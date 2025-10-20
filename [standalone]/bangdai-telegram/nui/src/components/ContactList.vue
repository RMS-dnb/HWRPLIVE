<template>
  <div class="flex flex-col h-full">
    <!-- Search Bar -->
    <div class="relative mb-4">
      <div class="absolute top-[48vh] left-[0vh] flex">
        <!-- Search Icon/Input -->
        <div class="relative flex items-center">
          <button v-if="!isSearching" @click="toggleSearch"
            class="flex items-center px-2 py-1 rounded hover:bg-black/20" v-tooltip="getText('tooltips.search')">
            <i class="fas fa-search opacity-100"></i>
          </button>
          <input v-show="isSearching" v-model="searchQuery" ref="searchInput" type="text"
            :placeholder="getText('placeholders.searchContacts')" class="w-[20vh] h-[3vh] px-3 text-center
                  bg-white/0 font-crock text-lg border-2 border-black focus:border-black
                  outline-none focus:outline-none focus:bg-white/60
                  focus:ring-0 focus:ring-offset-0
                  transition-all duration-300" @blur="handleBlur" />
        </div>
      </div>
    </div>

    <div class="flex-1 overflow-auto scrollbar mt-[2vh] max-h-[43vh]">
      <table class="t-table w-full">
        <thead>
          <tr>
            <th class="w-[40%]">{{ getText('labels.name') }}</th>
            <th class="w-[35%]">{{ getText('labels.number') }}</th>
            <th class="w-[25%]">{{ getText('labels.actions') }}</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="contact in filteredContacts" :key="contact.id" @click="selectAndComposeContact(contact)"
            class="hover:bg-black/40 cursor-pointer">
            <td>{{ contact.name }}</td>
            <td>{{ contact.number }}</td>
            <td>
              <div class="action-buttons flex justify-center space-x-2">
                <button @click.stop="composeNewTelegram(contact)" class="text-telegram-text opacity-70 hover:opacity-100 hover:text-blue-600
                          text-black-all duration-200" v-tooltip="getText('tooltips.sendTelegram')">
                  <i class="fas fa-paper-plane"></i>
                </button>
                <!-- Add Edit Button -->
                <button @click.stop="editContact(contact)" class="text-telegram-text opacity-70 hover:opacity-100 hover:text-yellow-600
                          text-black-all duration-200" v-tooltip="getText('tooltips.editContact')">
                  <i class="fas fa-edit"></i>
                </button>
                <button @click.stop="deleteContact(contact.id)" class="text-telegram-text opacity-70 hover:opacity-100 hover:text-red-600
                          text-black-all duration-200" v-tooltip="getText('tooltips.deleteContact')">
                  <i class="fas fa-trash"></i>
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Create Contact Form Modal -->
    <div v-if="showCreateForm" class="absolute inset-0 flex items-center justify-center">
      <div class="bg-black/80 p-6 rounded-lg w-[30vh]">
        <h2 class="text-white text-xl mb-4 font-crock text-center">
          {{ isEditMode ? getText('labels.editContact') : getText('labels.newContact') }}
        </h2>
        <input v-model="newContact.name" type="text" :placeholder="getText('placeholders.contactName')" class="w-full h-[3vh] mb-2 bg-gray-500/70 border-none
                opacity-95 font-crock text-lg text-center rounded focus:outline-none" />
        <input v-model="newContact.number" type="text" placeholder="TG-XXX" :disabled="isEditMode" class="w-full h-[3vh] mb-4 bg-gray-500/70 border-none
                opacity-95 font-crock text-lg text-center rounded focus:outline-none
                disabled:opacity-50 disabled:cursor-not-allowed" />
        <div class="flex justify-between">
          <button @click="createContact" class="px-4 py-1 text-lg text-white bg-green-600/80 hover:bg-green-500
                  rounded font-crock text-black-colors duration-200"
            v-tooltip="isEditMode ? getText('tooltips.updateContact') : getText('tooltips.saveContact')">
            {{ isEditMode ? getText('buttons.update') : getText('buttons.save') }}
          </button>
          <button @click="toggleCreateForm" class="px-4 py-1 text-lg text-white bg-red-600/80 hover:bg-red-500
                  rounded font-crock text-black-colors duration-200" v-tooltip="getText('tooltips.cancel')">
            {{ getText('buttons.cancel') }}
          </button>
        </div>
      </div>
    </div>

    <!-- Create New Contact Button -->
    <button @click="toggleCreateForm" class="absolute bottom-[2.5vh] right-[12vh] px-2 py-1 text-[200%] text-white 
        rounded font-crock hover:scale-105 text-black-transform duration-500">
      {{ getText('buttons.createNew') }}
    </button>

    <!-- My Telegram Number -->
    <div class="absolute bottom-[3.5vh] left-[5vh] flex items-center gap-2">
      <span class="text-[#000] font-crock text-[2.5vh] font-bold">{{ getText('labels.telegramNo') }}</span>
      <div class="border-l-2 border-[#000] pl-2">
        <span class="text-[#000] font-crock text-[2vh] font-semibold">{{ store.currentNumber }}</span>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, watch, nextTick } from 'vue'
import { useTelegramStore } from '../stores/telegramStore'
import { useAudio } from '../composables/useAudio'
import { useNui } from '../composables/useNui'
import { vTooltip } from '../directives/tooltip'
import { useLocalization } from '../composables/useLocalization'

const { getText } = useLocalization()
const store = useTelegramStore()
const { playSound } = useAudio()
const { fetchNui } = useNui()

const showCreateForm = ref(false)
const isEditMode = ref(false)
const editingContactId = ref(null)
const searchQuery = ref('')
const isSearching = ref(false)
const searchInput = ref(null)
const newContact = ref({
  id: null,
  name: '',
  number: ''
})

const toggleSearch = () => {
  playSound('button.mp3')
  isSearching.value = true
  nextTick(() => {
    searchInput.value?.focus()
  })
}

const handleBlur = () => {
  if (!searchQuery.value) {
    isSearching.value = false
  }
}

const editContact = (contact) => {
  playSound('button.mp3')
  isEditMode.value = true
  editingContactId.value = contact.id
  newContact.value = {
    id: contact.id,
    name: contact.name,
    number: contact.number
  }
  showCreateForm.value = true
}

const filteredContacts = computed(() => {
  if (!searchQuery.value) return store.sortedContacts

  const query = searchQuery.value.toLowerCase()
  return store.sortedContacts.filter(contact =>
    contact.name.toLowerCase().includes(query) ||
    contact.number.toLowerCase().includes(query)
  )
})

const toggleCreateForm = () => {
  playSound('button.mp3')
  if (showCreateForm.value) {
    newContact.value = { id: null, name: '', number: '' }
    store.setContactNumber('')
    isEditMode.value = false
    editingContactId.value = null
  }
  showCreateForm.value = !showCreateForm.value
}

const createContact = async () => {
  if (!newContact.value.name || !newContact.value.number) return

  playSound('button.mp3')
  let status

  if (isEditMode.value) {
    status = await fetchNui('UpdateContact', newContact.value)
  } else {
    status = await fetchNui('CreateContact', newContact.value)
  }

  if (status) {
    newContact.value = { id: null, name: '', number: '' }
    isEditMode.value = false
    editingContactId.value = null
    showCreateForm.value = false
    await fetchNui('Reload', {})
  }
}

const deleteContact = async (contactId) => {
  playSound('button.mp3')
  const status = await fetchNui('DeleteContact', { id: contactId })

  if (status) {
    await fetchNui('Reload', {})
  }
}

const composeNewTelegram = (contact) => {
  playSound('button.mp3')
  store.activeView = 'compose'
  store.currentTelegram = null
  store.resetFormData()
  store.formData.receiver = contact.number
}

watch(() => store.contactNumber, (newNumber) => {
  if (newNumber) {
    showCreateForm.value = true;
    newContact.value = {
      name: '',
      number: newNumber
    };
  }
}, { immediate: true });

const selectAndComposeContact = (contact) => {
  playSound('button.mp3')
  store.activeView = 'compose'
  store.currentTelegram = null
  store.resetFormData()
  store.formData.receiver = contact.number
}
</script>

<style lang="scss" scoped>
.t-table {
  @apply font-crock text-center border-collapse text-telegram-text;

  th {
    @apply bg-black/90 text-white text-[15px] font-normal h-[4vh] pt-[1vh] border-2 border-black sticky top-0 z-10;
  }

  td {
    @apply text-[15px] font-light h-[4vh] border-2 border-black;
  }
}

.scrollbar {
  &::-webkit-scrollbar {
    @apply w-1 bg-black/80;
  }

  &::-webkit-scrollbar-thumb {
    @apply rounded bg-gray-500/80;
  }
}

input {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;

  &:focus {
    @apply bg-white/60;
    outline: none !important;
    box-shadow: none !important;
    border-color: black !important;
  }
}
</style>