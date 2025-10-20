import { ref } from 'vue'

const translations = ref(null)

export function useLocalization() {
  const loadTranslation = async () => {
    try {
      const response = await fetch('../../locales/locale_ui.json')
      if (!response.ok) throw new Error('Failed to load translations')
      translations.value = await response.json()
      return true
    } catch (error) {
      console.error('Error loading translations:', error)
      return false
    }
  }

  const getText = (key) => {
    if (!translations.value) {
      return key
    }

    const keys = key.split('.')
    let value = translations.value

    for (const k of keys) {
      if (value && value[k]) {
        value = value[k]
      } else {
        console.warn(`Translation key not found: ${key}`)
        return key
      }
    }

    return value
  }

  return {
    loadTranslation,
    getText
  }
}