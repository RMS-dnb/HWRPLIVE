<template>
  <div v-if="isDevelopment" class="fixed top-4 right-4 z-50">
    <button
      @click="sendMockOpen"
      class="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 mb-2 block"
    >
      Mock Post Office
    </button>
    <button
      @click="sendMockBirdPost"
      class="px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600 block mb-2"
    >
      Mock Bird Post
    </button>
    <button
      @click="sendMockReload"
      class="px-4 py-2 bg-yellow-500 text-white rounded hover:bg-yellow-600 block mb-2"
    >
      Mock Reload
    </button>
    <button
      @click="closeInterface"
      class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600 block mb-2"
    >
      Close Interface
    </button>

    <!-- Debug Info -->
    <div class="mt-2 p-2 bg-black/80 rounded text-white">
      <p class="font-crock">Debug Info:</p>
      <p>View: {{ store.activeView }}</p>
      <p>Telegram View: {{ currentView }}</p>
      <p>Bird Post: {{ store.isBirdPost }}</p>
      <p>Visible: {{ store.isVisible }}</p>
      <p>My Telegram: {{ store.currentNumber }}</p>
      <p>Total Telegrams: {{ store.telegrams?.length || 0 }}</p>
      <p>Filtered Count: {{ store.filteredTelegrams?.length || 0 }}</p>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useNui } from '../composables/useNui'
import { useTelegramStore } from '../stores/telegramStore'

const isDevelopment = process.env.NODE_ENV === 'development'
const { mockMessage } = useNui()
const store = useTelegramStore()
const currentView = ref('inbox')

const mockData = {
  Open: {
    year: 2024,
    MyTelegram: 'TG-PLAYER123',
    leftText: 'VALENTINE',
    rightText: 'VALENTINE',
    currentNumber: 'TG-PLAYER123',
    telegrams: [
      // INBOX TELEGRAMS (received)
      {
        id: 1,
        title: 'Welcome Message',
        sender: 'Admin TG-ADMIN',
        receiver: 'TG-PLAYER123',
        date: '01/01/2024   09:00',
        text: 'Welcome to the telegram system!',
        open: 0
      },
      {
        id: 2,
        title: 'Business Proposal',
        sender: 'John Doe TG-123',
        receiver: 'TG-PLAYER123',
        date: '01/01/2024   10:15',
        text: 'I have a business proposal for you...',
        open: 1
      },
      {
        id: 3,
        title: 'Meeting Request',
        sender: 'Jane Doe TG-456',
        receiver: 'TG-PLAYER123',
        date: '01/01/2024   11:30',
        text: 'Can we meet tomorrow at noon?',
        open: 0
      },
      // SENT TELEGRAMS
      {
        id: 4,
        title: 'Re: Business Proposal',
        sender: 'TG-PLAYER123',
        receiver: 'TG-123',
        date: '01/01/2024   10:30',
        text: 'I am interested in your proposal...',
        open: 1
      },
      {
        id: 5,
        title: 'Urgent Matter',
        sender: 'TG-PLAYER123',
        receiver: 'TG-789',
        date: '01/01/2024   12:00',
        text: 'Please respond as soon as possible...',
        open: 1
      },
      {
        id: 6,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id: 7,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id:8,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id:9,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id:10,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id:11,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id:12,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id:13,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id:14,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id:15,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
      {
        id:16,
        title: 'Meeting Confirmation',
        sender: 'TG-PLAYER123',
        receiver: 'TG-456',
        date: '01/01/2024   13:45',
        text: 'Yes, tomorrow at noon works perfect.',
        open: 1
      },
    ],
    contacts: [
      {
        id: 1,
        name: 'System Admin',
        number: 'TG-ADMIN'
      },
      {
        id: 2,
        name: 'John Doe',
        number: 'TG-123'
      },
      {
        id: 3,
        name: 'Jane Doe',
        number: 'TG-456'
      },
      {
        id: 4,
        name: 'Bob Smith',
        number: 'TG-789'
      }
    ]
  },
  birdPost: {
    MyTelegram: 'BIRD-POST',
    currentNumber: 'BIRD-POST',
    leftText: 'VALENTINE',
    rightText: 'VALENTINE',
    contacts: [
      {
        id: 1,
        name: 'John Doe',
        number: 'TG-123'
      },
      {
        id: 2,
        name: 'Jane Doe',
        number: 'TG-456'
      },
      {
        id: 3,
        name: 'My Bird Post',
        number: 'BIRD-POST'
      }
    ]
  }
}

const sendMockOpen = () => {
  console.log('[DEV] Sending Mock Post Office')
  mockMessage('Open', mockData.Open)
}

const sendMockBirdPost = () => {
  console.log('[DEV] Sending Mock Bird Post')
  mockMessage('birdPost', mockData.birdPost)
}

const sendMockReload = () => {
  console.log('[DEV] Sending Mock Reload')
  const newTelegram = {
    id: 7,
    title: 'New Message ' + Date.now(),
    sender: 'New Contact TG-999',
    receiver: 'TG-PLAYER123',
    date: '01/01/2024   14:00',
    text: 'This is a new test telegram',
    open: 0
  }

  const newContact = {
    id: 5,
    name: 'New Contact',
    number: 'TG-999'
  }

  mockMessage('Open', {
    ...mockData.Open,
    contacts: [...mockData.Open.contacts, newContact],
    telegrams: [...mockData.Open.telegrams, newTelegram]
  })
}

const closeInterface = () => {
  store.handleClose()
}
</script>