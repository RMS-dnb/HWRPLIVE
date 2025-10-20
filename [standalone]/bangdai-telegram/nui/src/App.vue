<template>
  <DevTester v-if="isDevelopment" />
  <TelegramLayout v-if="store.isVisible || isClosing" />
</template>

<script setup>
import { onMounted } from 'vue'
import { useTelegramStore } from './stores/telegramStore'
import TelegramLayout from './components/TelegramLayout.vue'
import DevTester from './components/DevTester.vue'

const isDevelopment = process.env.NODE_ENV === 'development'
const store = useTelegramStore()

onMounted(() => {
  window.addEventListener('message', handleMessage)
})

const handleMessage = async (event) => {
  const { action, ...data } = event.data
  
  switch (action) {
    case 'Open':
      await store.handleOpen(data)
      break
    case 'ViewItem':
      await store.handleViewItem(data)
      break
    case 'birdPost':
      await store.handleBirdPost(data)
      break
    case 'Close':
      store.handleClose()
      break
  }
}
</script>