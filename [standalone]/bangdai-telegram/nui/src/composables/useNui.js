import { ref, onMounted, onUnmounted } from 'vue'
import { useTelegramStore } from '../stores/telegramStore'

const isDevelopment = process.env.NODE_ENV === 'development'

// Mock data untuk development
const mockData = {
    'Open': {
        year: 2024,
        MyTelegram: 'TG-123',
        leftText: 'VALENTINE',
        rightText: 'CITY',
        telegrams: [
            {
                id: 1,
                title: 'Test Telegram',
                sender: 'John Doe',
                receiver: 'Jane Doe',
                date: '12/11/2024   14:30',
                text: 'This is a test telegram',
                open: 0
            }
        ],
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
            }
        ]
    },
    'SendTelegram': { success: true },
    'CreateContact': { success: true },
    'DeleteContact': { success: true },
    'DeleteTelegram': { success: true },
    'OpenTelegram': { success: true },
    'RetrieveTelegram': { success: true },
    'Reload': { success: true }
}

export const useNui = () => {
    const loading = ref(false)
    const store = useTelegramStore()

    const fetchNui = async (eventName, data = {}) => {
        try {
            loading.value = true

            if (isDevelopment) {
                await new Promise(resolve => setTimeout(resolve, 100))
                return mockData[eventName] || false
            }

            const resp = await fetch(`https://${GetParentResourceName()}/${eventName}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                },
                body: JSON.stringify(data)
            })
            return await resp.json()
        } catch (error) {
            return isDevelopment ? mockData[eventName] || false : false
        } finally {
            loading.value = false
        }
    }

    const messageHandler = async (event) => {
        const { action, ...data } = event.data
    
        switch (action) {
            case 'Open':
                await new Promise(resolve => setTimeout(resolve, 100))
                store.handleOpen(data)
                break
            case 'birdPost':
                store.handleBirdPost(data)
                break
            case 'ViewItem':
                store.handleViewItem(data)
                break
        }
    }

    onMounted(() => {
        window.addEventListener('message', messageHandler)
    })
    
    onUnmounted(() => {
        window.removeEventListener('message', messageHandler)
    })

    const mockMessage = (action, data) => {
        if (isDevelopment) {
            window.dispatchEvent(new MessageEvent('message', {
                data: { action, ...data }
            }))
        }
    }

    if (isDevelopment) {
        onMounted(() => {
            window.addEventListener('message', messageHandler)
        })

        onUnmounted(() => {
            window.removeEventListener('message', messageHandler)
        })
    }

    return {
        loading,
        fetchNui,
        mockMessage
    }
}