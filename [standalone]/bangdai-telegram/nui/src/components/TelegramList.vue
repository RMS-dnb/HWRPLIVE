<template>
  <div class="flex flex-col h-full">
    <!-- Search Bar and View Toggles -->
    <div class="relative mb-4">
      <div class="absolute top-[48vh] left-[0vh] flex">
        <!-- Search Icon/Input -->
        <div class="relative flex items-center">
          <button 
            v-if="!isSearching"
            @click="toggleSearch"
            class="flex items-center px-2 py-1 rounded hover:bg-black/20"
            v-tooltip="getText('tooltips.search')"
          >
            <i class="fas fa-search opacity-100"></i>
          </button>
          <input
            v-show="isSearching"
            v-model="searchQuery"
            ref="searchInput"
            type="text"
            :placeholder="getText('placeholders.searchTelegrams')"
            class="w-[20vh] h-[3vh] px-3 text-center
                  bg-white/0 font-crock text-lg border-2 border-black focus:border-black
                  outline-none focus:outline-none focus:bg-white/60
                  focus:ring-0 focus:ring-offset-0
                  transition-all duration-300"
            @blur="handleBlur"
          />
        </div>

        <!-- View Toggle Buttons -->
        <div class="flex gap-2 ml-2">
          <button
            @click="currentView = 'inbox'"
            class="flex items-center px-2 py-1 rounded"
            :class="currentView === 'inbox' ? 'bg-black/40' : 'hover:bg-black/20'"
            v-tooltip="getText('tooltips.inbox')"
          >
            <i class="fas fa-inbox opacity-100"></i>
          </button>
          <button
            @click="currentView = 'sent'"
            class="flex items-center px-2 py-1 rounded"
            :class="currentView === 'sent' ? 'bg-black/40' : 'hover:bg-black/20'"
            v-tooltip="getText('tooltips.sent')"
          >
            <i class="fas fa-paper-plane opacity-100"></i>
          </button>
        </div>
      </div>
    </div>

    <div class="flex-1 overflow-auto scrollbar mt-[2vh] max-h-[43vh]">
      <table class="t-table w-full">
        <thead>
          <tr>
            <th class="w-[10%] font-crock">{{ getText('labels.status') }}</th>
            <th class="w-[35%] font-crock">{{ getText('labels.title') }}</th>
            <th class="font-crock">{{ currentView === 'inbox' ? getText('labels.sender') : getText('labels.receiver') }}</th>
            <th class="font-crock">{{ getText('labels.date') }}</th>
            <th class="w-[15%] font-crock">{{ getText('labels.actions') }}</th>
          </tr>
        </thead>
        <tbody>
          <tr 
            v-for="telegram in filteredTelegrams" 
            :key="telegram.id"
            @click="openTelegram(telegram)"
            class="hover:bg-black/40 cursor-pointer font-crock"
          >
            <td class="text-center">
              <i :class="[
                'fas',
                currentView === 'inbox' 
                  ? telegram.open === 1 ? 'fa-envelope-open' : 'fa-envelope'
                  : 'fa-paper-plane',
                'opacity-70'
              ]"></i>
            </td>
            <td>{{ telegram.title }}</td>
            <td>{{ currentView === 'inbox' ? telegram.sender : telegram.receiver }}</td>
            <td>{{ telegram.date }}</td>
            <td>
              <div class="action-buttons flex justify-center space-x-2">
                <button
                  @click.stop="retrieveTelegram(telegram)"
                  class="text-telegram-text opacity-70 hover:opacity-100 hover:text-green-800 
                         transition-all duration-200"
                  v-tooltip="getText('tooltips.saveTelegram')"
                >
                  <i class="fas fa-download"></i>
                </button>
                <button
                  @click.stop="deleteTelegram(telegram.id)"
                  class="text-telegram-text opacity-70 hover:opacity-100 hover:text-red-600
                         transition-all duration-200"
                  v-tooltip="getText('tooltips.deleteTelegram')"
                >
                  <i class="fas fa-trash"></i>
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Create Button -->
    <button
      v-if="!store.currentTelegram"
      @click="createNewTelegram"
      class="absolute bottom-[2.5vh] right-[12vh] px-2 py-1 text-[200%] text-white 
          rounded font-crock hover:scale-105 text-black-transform duration-500"
    >
      {{ getText('buttons.composeNew') }}
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
import { ref, computed, nextTick } from 'vue'
import { useTelegramStore } from '../stores/telegramStore'
import { useAudio } from '../composables/useAudio'
import { useNui } from '../composables/useNui'
import { vTooltip } from '../directives/tooltip'
import { useLocalization } from '../composables/useLocalization'

const store = useTelegramStore()
const { playSound } = useAudio()
const { fetchNui } = useNui()
const { getText } = useLocalization()

const searchQuery = ref('')

const isSearching = ref(false)
const searchInput = ref(null)

const currentView = computed({
  get: () => store.lastTelegramView,
  set: (value) => {
    store.lastTelegramView = value
    playSound('button.mp3')
  }
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

const filteredTelegrams = computed(() => {
  let filtered = store.sortedTelegrams

  filtered = filtered.filter(telegram => {
    return telegram.type === currentView.value
  })

  if (searchQuery.value) {
    const query = searchQuery.value.toUpperCase()
    filtered = filtered.filter(telegram => 
      telegram.title.toUpperCase().includes(query) ||
      telegram.sender.toUpperCase().includes(query) ||
      telegram.receiver?.toUpperCase().includes(query)
    )
  }
  
  return filtered
})

const openTelegram = async (telegram) => {
  try {
    playSound('button.mp3')
    
    if (telegram.open === 0) {
      await fetchNui('OpenTelegram', { 
        telegram: telegram.id,
        sender: telegram.sender,
        receiver: telegram.receiver,
        date: telegram.date,
        title: telegram.title,
        text: telegram.text,
        view: store.lastTelegramView // Tambahkan ini
      })
    }

    store.handleViewPostal({
      sender: telegram.sender,
      receiver: telegram.receiver,
      date: telegram.date,
      title: telegram.title,
      text: telegram.text,
      leftText: store.currentCity,
      rightText: store.currentState,
      view: store.lastTelegramView // Tambahkan ini
    })
  } catch (error) {
    console.error('Error opening telegram:', error)
  }
}

const retrieveTelegram = async (telegram) => {
  playSound('button.mp3')
  const status = await fetchNui('RetrieveTelegram', {
    telegram: telegram.id,
    title: telegram.title,
    sender: telegram.sender,
    receiver: telegram.receiver,
    date: telegram.date,
    text: telegram.text,
    city: store.currentCity,
    state: store.currentState,
    MyTelegram: store.currentNumber,
    type: telegram.type // Tambahkan type dari telegram
  })
  
  if (status) {
    await fetchNui('Reload', {})
  }
}

const deleteTelegram = async (telegramId) => {
  playSound('button.mp3')
  const status = await fetchNui('DeleteTelegram', { 
    telegramId: telegramId,
    type: currentView.value  // 'inbox' atau 'sent'
  })
  if (status) {
    await fetchNui('Reload', {})
  }
}

const createNewTelegram = () => {
  playSound('button.mp3')
  store.activeView = 'compose'
  store.currentTelegram = null
}
</script>

<style lang="scss" scoped>
.t-table {
  @apply font-crock text-center border-collapse text-telegram-text;

  th {
    @apply bg-black/90 text-white text-[15px] font-normal h-[4vh] pt-[1vh] 
           border-2 border-black sticky top-0 z-10;
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
  &:not(:focus):placeholder-shown {
    width: 0;
    padding: 0;
    opacity: 0;
  }
}
</style>