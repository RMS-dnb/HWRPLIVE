import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useTelegramStore = defineStore('telegram', () => {
  // State
  const isVisible = ref(false)
  const currentTelegram = ref(null)
  const currentYear = ref(null)
  const isBirdPost = ref(false)
  const isViewMode = ref(false)
  const currentName = ref('')
  const currentNumber = ref('')
  const currentCity = ref('')
  const currentState = ref('')
  const telegrams = ref([])
  const contacts = ref([])
  const activeView = ref('telegrams')
  const lastTelegramView = ref('inbox')
  const currentView = ref('inbox')
  const contactNumber = ref('')
  const shouldShowCreateForm = ref(false)
  const playerData = ref(null)
  const authorizedJobs = ref(null)
  const isClosing = ref(false)
  const formData = ref({
    sender: '',
    receiver: '',
    date: '',
    title: '',
    text: ''
  })

  const contactFormData = ref({
    number: '',
    showForm: false
  })

  async function handleClose() {
    isClosing.value = true
    setTimeout(() => {
      isVisible.value = false
      isClosing.value = false
    }, 600)
  }

  const showNavigationButtons = computed(() => {
    return activeView.value !== 'viewItem'
  })

  const sortedTelegrams = computed(() => {
    return [...telegrams.value].sort((a, b) => {
      const dateA = new Date(a.date.split('   ')[0].split('/').reverse().join('/'))
      const dateB = new Date(b.date.split('   ')[0].split('/').reverse().join('/'))
      return dateB - dateA
    })
  })

  const sortedContacts = computed(() => {
    return [...contacts.value].sort((a, b) => a.name.localeCompare(b.name))
  })

  // Form Actions
  function setFormReceiver(number) {
    formData.value = {
      ...formData.value,
      receiver: number
    }
  }

  function setFormSender(sender) {
    formData.value = {
      ...formData.value,
      sender: sender
    }
  }

  function setFormData(data) {
    formData.value = {
      ...formData.value,
      ...data
    }
  }

  function resetFormData() {
    const date = new Date()
    const hours = String(date.getHours()).padStart(2, '0')
    const minutes = String(date.getMinutes()).padStart(2, '0')
    const day = String(date.getDate()).padStart(2, '0')
    const month = String(date.getMonth() + 1).padStart(2, '0')
    
    formData.value = {
      sender: '',
      receiver: '',
      date: `${day}/${month}/${currentYear.value}   ${hours}:${minutes}`,
      title: '',
      text: ''
    }
  }

  // Main Actions
  function handleOpen(data) {
    authorizedJobs.value = data.authorizedJobs
    playerData.value = data.playerData
    isVisible.value = true
    currentYear.value = data.year
    currentNumber.value = data.MyTelegram
    currentCity.value = data.leftText
    currentState.value = data.rightText
    telegrams.value = data.telegrams // Pastikan telegrams memiliki properti type
    contacts.value = data.contacts
    isBirdPost.value = false
    isViewMode.value = false
    currentTelegram.value = null
    activeView.value = 'telegrams'
    lastTelegramView.value = lastTelegramView.value || 'inbox' // Default ke inbox jika belum diset
    resetFormData()
  }

  async function handleViewItem(data) {
    isVisible.value = true
    activeView.value = 'viewItem'
    currentTelegram.value = data
    formData.value = {
      sender: data.sender || '',
      receiver: data.receiver || '',
      date: data.date || '',
      title: data.title || '',
      text: data.text || ''
    }
    currentNumber.value = data.MyTelegram
    currentCity.value = data.leftText
    currentState.value = data.rightText
  }

  async function handleViewPostal(data) {
    isVisible.value = true
    activeView.value = 'compose'
    currentTelegram.value = data
    formData.value = {
      sender: data.sender || '',
      receiver: data.receiver || '',
      date: data.date || '',
      title: data.title || '',
      text: data.text || ''
    }
    currentCity.value = data.leftText
    currentState.value = data.rightText
    lastTelegramView.value = currentView.value
}

  async function handleBirdPost(data) {
    isVisible.value = true
    isBirdPost.value = true
    currentName.value = data.leftText
    currentYear.value = new Date().getFullYear()
    currentNumber.value = data.MyTelegram
    currentCity.value = data.leftText
    currentState.value = data.rightText
    contacts.value = data.contacts
    activeView.value = 'contacts'
    resetFormData()
  }

  function resetState() {
    currentTelegram.value = null
    currentName.value = ''
    isViewMode.value = false
    activeView.value = isBirdPost.value ? 'contacts' : 'telegrams'
    resetFormData()
  }

  function setContactNumber(number) {
    contactNumber.value = number;
  }

  function openContactForm(number) {
    contactFormData.value = {
      number: number,
      showForm: true
    }
  }
  
  function resetContactForm() {
    contactFormData.value = {
      number: '',
      showForm: false
    }
  }

  return {
    // State
    isVisible,
    currentTelegram,
    currentYear,
    isBirdPost,
    currentName,
    currentNumber,
    currentCity,
    currentState,
    telegrams,
    contacts,
    activeView,
    formData,
    
    // Getters
    sortedTelegrams,
    sortedContacts,
    showNavigationButtons,

    contactFormData,

    isClosing,
    authorizedJobs,
    playerData,
    
    // Form Actions
    setFormReceiver,
    setFormSender,
    setFormData,
    resetFormData,
    
    // Main Actions
    handleOpen,
    handleViewItem,
    handleViewPostal,
    handleBirdPost,
    handleClose,
    resetState,

    openContactForm,
    resetContactForm,
    lastTelegramView,
    
    contactNumber,
    shouldShowCreateForm,
    setContactNumber,
  }
})