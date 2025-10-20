import { ref, onMounted } from 'vue'

export function useFontLoader() {
    const isFontLoaded = ref(false)

    const checkFontLoading = async () => {
        try {
            await document.fonts.load('1rem "crock"')
            
            // Double check if font is actually loaded
            if (document.fonts.check('1rem "crock"')) {
                isFontLoaded.value = true
                console.log('Font crock loaded successfully')
            } else {
                console.warn('Font crock failed to load')
            }
        } catch (error) {
            console.error('Error loading font:', error)
        }
    }

    onMounted(() => {
        checkFontLoading()
    })

    return {
        isFontLoaded,
        checkFontLoading
    }
}