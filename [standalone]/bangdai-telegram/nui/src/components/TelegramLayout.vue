<template>
  <Transition
    @before-leave="onBeforeLeave" 
    @after-leave="onAfterLeave"
  >
    <div v-show="store.isVisible || isClosing" class="fixed inset-0 flex items-center justify-center">
      <!-- Control Buttons -->
      <Transition
        enter-active-class="transition duration-300"
        leave-active-class="transition duration-300"
        enter-from-class="opacity-0"
        leave-to-class="opacity-0"
      >
        <div class="buttons-container" v-show="showButtons && !isClosing">
          <!-- Close button -->
          <button @click="handleClose" class="tab-button close-tab">
            <p class="text-[140%] mt-[0.7vh] text-center text-white font-crock">{{ getText('buttons.close') }}</p>
          </button>

          <div v-if="store.activeView !== 'viewItem'">
            <button @click="handleContactsView"
              :class="{'active': store.activeView === 'contacts'}"
              class="tab-button contacts-tab">
              <p class="text-[140%] mt-[0.7vh] text-center text-white font-crock">{{ getText('buttons.contacts') }}</p>
            </button>

            <Transition
              enter-active-class="transition duration-300 ease-out"
              enter-from-class="opacity-0 translate-x-full"
              enter-to-class="opacity-100 translate-x-0" 
              leave-active-class="transition duration-200 ease-in"
              leave-from-class="opacity-100 translate-x-0"
              leave-to-class="opacity-0 translate-x-full">
              <button v-if="!store.isBirdPost && store.activeView !== 'telegrams'"
                @click="handleBack"
                class="tab-button back-tab">
                <p class="text-[140%] mt-[0.7vh] text-center text-white font-crock">{{ getText('buttons.back') }}</p>
              </button>
            </Transition>
          </div>
        </div>
      </Transition>

      <!-- Main Content -->
      <div
        v-show="store.isVisible || isClosing"
        class="telegram-container"
        :class="{
          'animate-unroll': !isClosing,
          'animate-roll': isClosing
        }"
        @animationend="onAnimationEnd">

        <div class="side-text">
          <span class="left-text">{{ store.currentCity }}</span>
          <span class="right-text">{{ store.currentState }}</span>
        </div>

        <template v-if="store.activeView === 'viewItem'">
          <ViewItemForm />
        </template>
        
        <div v-else class="relative h-full pt-[14vh] px-[3vh]">
          <div v-if="store.isBirdPost && store.activeView === 'telegrams'" 
            class="flex items-center justify-center h-full">
            <p class="text-2xl text-black font-crock text-center opacity-70">
              {{ getText('messages.birdPost') }}
            </p>
          </div>
          <TelegramList v-else-if="store.activeView === 'telegrams' && !store.isBirdPost" />
          <ComposeForm v-if="store.activeView === 'compose'" :showCreateForm="showCreateForm" />
          <ContactList v-if="store.activeView === 'contacts'" />
        </div>
      </div>
    </div>
  </Transition>
</template>

<script setup>
import { ref, onBeforeUnmount, onMounted } from 'vue'
import { useTelegramStore } from '../stores/telegramStore'
import { useAudio } from '../composables/useAudio'
import { useNui } from '../composables/useNui'
import TelegramList from './TelegramList.vue'
import ComposeForm from './ComposeForm.vue'
import ContactList from './ContactList.vue'
import ViewItemForm from './ViewItemForm.vue'
import { useLocalization } from '../composables/useLocalization'

const { getText } = useLocalization()
const showButtons = ref(false)
const showCreateForm = ref(false)
const isClosing = ref(false)
const store = useTelegramStore()
const { playSound } = useAudio()
const { fetchNui } = useNui()

const onBeforeLeave = () => {
  isClosing.value = true
  showButtons.value = false
}

const onAfterLeave = () => {
  isClosing.value = false
  store.handleClose()
}

const onAnimationEnd = () => {
  if (isClosing.value) {
    playSound('menu_close.mp3')
    store.handleClose()
  } else {
    showButtons.value = true
    playSound('menu_open.mp3')
  }
}

const handleClose = async () => {
  isClosing.value = true
  showButtons.value = false
  await fetchNui('Close', {
    isBirdPost: store.isBirdPost,
    name: store.currentName
  })
}

const handleEscapeKey = async (event) => {
  if (event.key === 'Escape' && store.isVisible && !isClosing.value) {
    isClosing.value = true
    showButtons.value = false
    await fetchNui('Close', {
      isBirdPost: store.isBirdPost,
      name: store.currentName
    })
  }
}

onMounted(() => {
  window.addEventListener('keydown', handleEscapeKey)
})

const handleBack = () => {
  playSound('button.mp3')
  // Kembali ke telegrams dengan mempertahankan view
  store.activeView = 'telegrams'
  // Reset hanya telegram yang sedang dibuka
  store.currentTelegram = null

  fetchNui('Reload', {}).catch(err => {
   console.error('Failed to reload:', err)
  })
}

const handleContactsView = () => {
  playSound('button.mp3')
  if (store.activeView === 'contacts') {
    store.activeView = store.isBirdPost ? 'compose' : 'telegrams'
  } else {
    store.activeView = 'contacts'
  }
}

onBeforeUnmount(() => {
  isClosing.value = false
  showButtons.value = false
  window.removeEventListener('keydown', handleEscapeKey)
})
</script>

<style lang="scss" scoped>
.buttons-container {
  @apply absolute w-[100vh] h-[75vh];
  z-index: 1;
  pointer-events: none;
  
  .tab-button {
    pointer-events: auto;
  }
}

.telegram-container {
  @apply relative w-[100vh] h-[75vh] bg-no-repeat rounded-lg;
  background-image: url('../assets/img/telegram.png');
  background-size: 100% 100%;  // Mengatur background agar mengisi penuh container
  background-position: center;
  z-index: 2;
  transform-origin: left center;
  will-change: transform, opacity;

  &.animate-unroll {
    animation: unroll 0.6s ease-out forwards;
  }

  &.animate-roll {
    animation: roll 0.6s ease-in forwards;
  }
}


@keyframes roll {
  0% {
    transform: scaleX(1);
    opacity: 1;
  }
  100% {
    transform: scaleX(0);
    opacity: 0;
  }
}

@keyframes unroll {
  0% {
    transform: scaleX(0);
    opacity: 0;
  }
  100% {
    transform: scaleX(1);
    opacity: 1;
  }
}

.tab-button {
  @apply absolute w-[12vh] h-[4vh]
         rounded-lg border border-black/30 shadow-md text-white;

  &.close-tab {
    @apply -rotate-90 left-[94vh] top-[8vh] bg-red-500/90 
           hover:bg-red-600 transition-colors duration-300;
    clip-path: inset(0 -100px 0 0);
  }

  &.contacts-tab {
    @apply -rotate-90 left-[94vh] top-[20vh] bg-blue-500/90 
           hover:bg-blue-600 transition-colors duration-300;
    clip-path: inset(0 -100px 0 0);
    
    &.active {
      @apply bg-green-500/90 hover:bg-green-600;
    }
  }

  &.back-tab {
    @apply -rotate-90 left-[94vh] top-[32vh] bg-yellow-500/90 
           hover:bg-yellow-400 transition-colors duration-300;
    clip-path: inset(0 -100px 0 0);
  }

  p {
    @apply text-[140%] mt-[0.7vh] text-center text-white;
    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
  }

  &:hover {
    @apply transform translate-x-1;
    transition: transform 0.2s ease-out;
  }
}

.side-text {
  @apply absolute w-full;
  
  .left-text, .right-text {
    @apply text-black text-2xl font-crock font-semibold;
  }

  .left-text {
    @apply absolute top-[6.5vh] left-[12vh];
  }

  .right-text {
    @apply absolute top-[6.5vh] right-[12vh];
  }
}

.v-enter-active,
.v-leave-active {
  transition: opacity 0.6s ease;
}

.v-enter-from,
.v-leave-to {
  opacity: 0;
}
</style>