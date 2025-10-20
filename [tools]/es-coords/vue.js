const app = new Vue({
  el: '#app',
  data: {
    ui: false,
    xCoord: 0.0,
    yCoord: 0.0,
    zCoord: 0.0,
    heading: 0.0,
    format: 'vector3',
    position: {
      top: '50%',
      left: '50%',
      transform: 'translate(-50%, -50%)'
    },
    isDragging: false,
    dragOffset: {
      x: 0,
      y: 0
    },
    isFivem: false,
    history: [],
    favorites: [],
    maxHistoryItems: 10,
    notification: {
      show: false,
      message: '',
      timeout: null
    },
    selectedHistoryIndex: -1,
    historySearch: '',
    favoritesSearch: '',
    copiedStates: {
      x: false,
      y: false,
      z: false,
      h: false,
      all: false
    },
    menuAnimation: {
      scale: 0.8,
      opacity: 0,
      rotate: -5,
      translateY: 20
    }
  },
  computed: {
    formattedCoordinates() {
      switch(this.format) {
        case 'vector3':
          return `vector3(${this.xCoord}, ${this.yCoord}, ${this.zCoord})`;
        case 'vector4':
          return `vector4(${this.xCoord}, ${this.yCoord}, ${this.zCoord}, ${this.heading})`;
        case 'table':
          return `{x = ${this.xCoord}, y = ${this.yCoord}, z = ${this.zCoord}, h = ${this.heading}}`;
        case 'json':
          return JSON.stringify({
            x: this.xCoord,
            y: this.yCoord,
            z: this.zCoord,
            h: this.heading
          }, null, 2);
        case 'raw':
          return `${this.xCoord}, ${this.yCoord}, ${this.zCoord}, ${this.heading}`;
        default:
          return `vector3(${this.xCoord}, ${this.yCoord}, ${this.zCoord})`;
      }
    },
    filteredHistory() {
      if (!this.historySearch) return this.history;
      const search = this.historySearch.toLowerCase();
      return this.history.filter(item => 
        `${item.x}, ${item.y}, ${item.z}, ${item.h}`.toLowerCase().includes(search) ||
        item.format.toLowerCase().includes(search)
      );
    },
    filteredFavorites() {
      if (!this.favoritesSearch) return this.favorites;
      const search = this.favoritesSearch.toLowerCase();
      return this.favorites.filter(item => 
        item.name.toLowerCase().includes(search) ||
        `${item.x}, ${item.y}, ${item.z}, ${item.h}`.toLowerCase().includes(search)
      );
    },
  },
  watch: {
    position: {
      handler(newPosition) {
        if (!this.isDragging) {
          localStorage.setItem('coordinateCopierPosition', JSON.stringify(newPosition));
        }
      },
      deep: true
    }
  },
  created() {
    try {
      this.isFivem = window.GetParentResourceName !== undefined;
    } catch (e) {
      this.isFivem = false;
      console.warn('Not running in FiveM environment');
    }

    window.addEventListener('message', this.handleEventMessage);
    document.addEventListener("keydown", this.onKeydown);
    document.addEventListener('mousemove', this.onMouseMove);
    document.addEventListener('mouseup', this.onMouseUp);
    
    const savedPosition = localStorage.getItem('coordinateCopierPosition');
    if (savedPosition) {
      try {
        const parsedPosition = JSON.parse(savedPosition);
        if (parsedPosition && typeof parsedPosition === 'object' && 
            'top' in parsedPosition && 'left' in parsedPosition) {
          this.position = parsedPosition;
        }
      } catch (e) {
        console.error('Error loading position:', e);
        this.resetPosition();
      }
    }

    this.loadHistory();
  },
  mounted() {
    if (this.isFivem) {
      setInterval(this.updateCoordinates, 1000);
    }
  },
  methods: {  
    handleEventMessage(event) {
      const item = event.data;
      
      if (item.type === 'UPDATE_COORDS') {
        this.xCoord = item.data.x;
        this.yCoord = item.data.y;
        this.zCoord = item.data.z;
        this.heading = item.data.h;
      } else if (item.type === 'SET_VISIBILITY') {
        if (item.animation) {
          if (item.show) {
            this.ui = true;
            this.animateMenuIn(item.animationType);
            this.postFivem('UpdateFavorites', { favorites: this.favorites });
          } else {
            this.animateMenuOut(item.animationType);
          }
        } else {
          this.ui = item.show;
        }
      } else if (item.type === 'GET_FAVORITES') {
        this.postFivem('UpdateFavorites', { favorites: this.favorites });
      }
    },
    animateMenuIn(type) {
      this.menuAnimation.scale = 0.8;
      this.menuAnimation.opacity = 0;
      this.menuAnimation.rotate = -5;
      this.menuAnimation.translateY = 20;
      
      anime({
        targets: this.menuAnimation,
        scale: 1,
        opacity: 1,
        rotate: 0,
        translateY: 0,
        duration: 500,
        easing: 'easeOutElastic(1, .8)',
        complete: () => {
          this.menuAnimation.scale = 1;
          this.menuAnimation.opacity = 1;
          this.menuAnimation.rotate = 0;
          this.menuAnimation.translateY = 0;
        }
      });
    },
    animateMenuOut(type) {
      anime({
        targets: this.menuAnimation,
        scale: 0.8,
        opacity: 0,
        rotate: 5,
        translateY: -20,
        duration: 300,
        easing: 'easeInBack',
        complete: () => {
          this.ui = false;
          this.menuAnimation.scale = 0.8;
          this.menuAnimation.opacity = 0;
          this.menuAnimation.rotate = -5;
          this.menuAnimation.translateY = 20;
        }
      });
    },
    Close() {
      this.ui = false;
      this.postFivem('Close');
    },
    Show() {
      this.ui = true;
    },
    onKeydown(event) {
      if (event.key === "Escape") {
        this.Close();
      }
    },
    updateCoordinates() {
      if (this.ui && this.isFivem) {
        this.postFivem('GetCoords');
      }
    },
    postFivem(eventName, data = {}) {
      if (this.isFivem) {
        try {
          $.post(`https://${GetParentResourceName()}/${eventName}`, JSON.stringify(data));
        } catch (e) {
          console.error(`Error sending FiveM event: ${eventName}`, e);
        }
      }
    },
    copySpecificValue(value, type) {
      if (this.isFivem) {
        const text = value.toString();
        this.postFivem('CopyToClipboard', { text });
        this.showCopiedState(type);
        this.showNotification(`${type.toUpperCase()} coordinate copied!`);
      } else {
        navigator.clipboard.writeText(value.toString()).then(() => {
          this.showCopiedState(type);
          this.showNotification(`${type.toUpperCase()} coordinate copied!`);
          if (navigator.vibrate) {
            navigator.vibrate(50);
          }
        }).catch(err => {
          console.error('Copy failed:', err);
          this.showNotification('Copy failed!', 'error');
        });
      }
    },
    showCopiedState(type) {
      this.copiedStates[type] = true;
      setTimeout(() => {
        this.copiedStates[type] = false;
      }, 1000);
    },
    copyAllCoordinates() {
      let text = '';
      switch(this.format) {
        case 'vector3':
          text = `vector3(${this.xCoord}, ${this.yCoord}, ${this.zCoord})`;
          break;
        case 'vector4':
          text = `vector4(${this.xCoord}, ${this.yCoord}, ${this.zCoord}, ${this.heading})`;
          break;
        case 'table':
          text = `{x = ${this.xCoord}, y = ${this.yCoord}, z = ${this.zCoord}, h = ${this.heading}}`;
          break;
        case 'json':
          text = JSON.stringify({
            x: this.xCoord,
            y: this.yCoord,
            z: this.zCoord,
            h: this.heading
          }, null, 2);
          break;
        case 'raw':
          text = `${this.xCoord}, ${this.yCoord}, ${this.zCoord}, ${this.heading}`;
          break;
      }

      if (this.isFivem) {
        this.postFivem('CopyToClipboard', { text });
        this.showCopiedState('all');
        this.showNotification('All coordinates copied!');
      } else {
        navigator.clipboard.writeText(text).then(() => {
          this.showCopiedState('all');
          this.showNotification('All coordinates copied!');
          if (navigator.vibrate) {
            navigator.vibrate(50);
          }
        }).catch(err => {
          console.error('Copy failed:', err);
          this.showNotification('Copy failed!', 'error');
        });
      }
      this.addToHistory();
    },
    showNotification(message, type = 'success') {
      this.notification.message = message;
      this.notification.show = true;
      
      if (this.notification.timeout) {
        clearTimeout(this.notification.timeout);
      }
      
      this.notification.timeout = setTimeout(() => {
        this.notification.show = false;
      }, 3000);
      
      if (this.isFivem) {
        this.postFivem('ShowNotification', { message });
      } else {
        console.log('Notification:', message);
      }
    },
    startDrag(event) {
      if (event.button !== 0) return;
      
      const rect = this.$refs.draggable.getBoundingClientRect();
      this.isDragging = true;
      this.dragOffset = {
        x: event.clientX - rect.left,
        y: event.clientY - rect.top
      };
      
      this.position.transform = 'none';
      this.position.top = rect.top + 'px';
      this.position.left = rect.left + 'px';
    },
    onMouseMove(event) {
      if (!this.isDragging) return;
      
      const newPosition = {
        left: (event.clientX - this.dragOffset.x) + 'px',
        top: (event.clientY - this.dragOffset.y) + 'px',
        transform: 'none'
      };
      
      this.position = newPosition;
    },
    onMouseUp() {
      if (this.isDragging) {
        this.isDragging = false;
        localStorage.setItem('coordinateCopierPosition', JSON.stringify(this.position));
      }
    },
    resetPosition() {
      const defaultPosition = {
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)'
      };
      
      this.position = defaultPosition;
      localStorage.removeItem('coordinateCopierPosition');
      this.showNotification('Position reset!');
    },
    addToHistory() {
      const newEntry = {
        x: this.xCoord,
        y: this.yCoord,
        z: this.zCoord,
        h: this.heading,
        format: this.format,
        timestamp: new Date().toISOString()
      };
      
      this.history.unshift(newEntry);
      if (this.history.length > this.maxHistoryItems) {
        this.history.pop();
      }
      
      this.saveHistory();
    },
    removeHistory(index) {
      this.history.splice(index, 1);
      this.saveHistory();
      this.showNotification('History item deleted!');
    },
    saveHistory() {
      localStorage.setItem('coordinateHistory', JSON.stringify(this.history));
    },
    addToFavorites(index = -1) {
      let item;
      if (index === -1) {
        item = this.history[0];
      } else {
        item = this.history[index];
      }

      if (!item) {
        this.showNotification('No coordinates to add to favorites!', 'error');
        return;
      }

      const isDuplicate = this.favorites.some(favorite => 
        Math.abs(favorite.x - item.x) < 0.01 && 
        Math.abs(favorite.y - item.y) < 0.01 && 
        Math.abs(favorite.z - item.z) < 0.01
      );

      if (isDuplicate) {
        this.showNotification('These coordinates already exist in favorites!', 'error');
        return;
      }

      const newFavorite = {
        x: item.x,
        y: item.y,
        z: item.z,
        h: item.h,
        name: `Favorite ${this.favorites.length + 1}`,
        timestamp: new Date().toISOString()
      };
      
      this.favorites.push(newFavorite);
      this.saveFavorites();
      this.showNotification('Added to favorites!');
      
      this.selectedHistoryIndex = -1;
    },
    removeFavorite(index) {
      this.favorites.splice(index, 1);
      this.saveFavorites();
      this.showNotification('Favorite location deleted!');
    },
    editFavoriteName(index, newName) {
      if (!newName || newName.trim() === '') {
        this.favorites[index].name = `Favorite ${index + 1}`;
        this.saveFavorites();
        return;
      }

      const existingFavorite = this.favorites.find((fav, i) => 
        i !== index && fav.name.toLowerCase() === newName.trim().toLowerCase()
      );

      if (existingFavorite) {
        this.showNotification('A favorite with this name already exists!', 'error');
        this.favorites[index].name = `Favorite ${index + 1}`;
      } else {
        this.favorites[index].name = newName.trim();
        this.showNotification('Favorite name updated!');
      }
      this.saveFavorites();
    },
    saveFavorites() {
      localStorage.setItem('coordinateFavorites', JSON.stringify(this.favorites));
      this.postFivem('UpdateFavorites', { favorites: this.favorites });
    },
    loadHistory() {
      const savedHistory = localStorage.getItem('coordinateHistory');
      const savedFavorites = localStorage.getItem('coordinateFavorites');
      
      if (savedHistory) {
        try {
          this.history = JSON.parse(savedHistory);
        } catch (e) {
          console.error('Error loading history:', e);
          this.history = [];
        }
      }
      
      if (savedFavorites) {
        try {
          this.favorites = JSON.parse(savedFavorites);
        } catch (e) {
          console.error('Error loading favorites:', e);
          this.favorites = [];
        }
      }
    },
    selectHistoryItem(index) {
      this.selectedHistoryIndex = index;
    },
    copyHistoryItem(item) {
      const text = this.formatCoordinates(item, true);
      if (this.isFivem) {
        this.postFivem('CopyToClipboard', { text });
      } else {
        this.copyToClipboard(text, 'history');
      }
      this.showNotification('History coordinate copied!');
    },
    loadHistoryItem(item) {
      this.xCoord = item.x;
      this.yCoord = item.y;
      this.zCoord = item.z;
      this.heading = item.h;
      this.format = item.format;
      this.showNotification('Coordinates loaded!');
    },
    copyFavoriteItem(item) {
      const text = this.formatCoordinates(item);
      if (this.isFivem) {
        this.postFivem('CopyToClipboard', { text });
      } else {
        this.copyToClipboard(text, 'favorite');
      }
      this.showNotification('Favorite coordinate copied!');
    },
    loadFavoriteItem(item) {
      this.xCoord = item.x;
      this.yCoord = item.y;
      this.zCoord = item.z;
      this.heading = item.h;
      this.showNotification('Favorite coordinates loaded!');
    },
    formatCoordinates(item, keepStructure = false) {
      if (keepStructure && item.format) {
        if (item.format === 'vector3') {
          return `vector3(${item.x},${item.y},${item.z})`;
        } else if (item.format === 'vector4') {
          return `vector4(${item.x},${item.y},${item.z},${item.h})`;
        }
      }
      return `${item.x},${item.y},${item.z},${item.h}`.replace(/\s+/g, '');
    },
    copyToClipboard(text, type) {
      const textArea = document.createElement('textarea');
      textArea.value = text;
      document.body.appendChild(textArea);
      textArea.select();
      
      try {
        document.execCommand('copy');
        this.showNotification('Copied to clipboard!');
        
        if (type) {
          const buttonClass = type === 'all' ? '.copy-all-button' : `.copy-${type}`;
          const button = document.querySelector(buttonClass);
          if (button) {
            button.classList.add('copied');
            setTimeout(() => {
              button.classList.remove('copied');
            }, 1000);
          }
        }
      } catch (err) {
        console.error('Copy error:', err);
        this.showNotification('Copy failed!', 'error');
      }
      
      document.body.removeChild(textArea);
    },
    teleportToFavorite(item) {
      if (this.isFivem) {
        this.postFivem('TeleportToLocation', {
          x: item.x,
          y: item.y,
          z: item.z,
          h: item.h
        });
        this.showNotification('Teleporting to location...');
      }
    },
  },
  beforeDestroy() {
    window.removeEventListener('message', this.handleEventMessage);
    document.removeEventListener("keydown", this.onKeydown);
    document.removeEventListener('mousemove', this.onMouseMove);
    document.removeEventListener('mouseup', this.onMouseUp);
  }
});