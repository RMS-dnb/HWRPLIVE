import { ref } from 'vue'
import menuOpen from '@/assets/audio/menu_open.mp3'
import menuClose from '@/assets/audio/menu_close.mp3'
import buttonClick from '@/assets/audio/button.mp3'

export function useAudio() {
 const volume = ref(0.5)
  
 const sounds = {
   'menu_open.mp3': menuOpen,
   'menu_close.mp3': menuClose,
   'button.mp3': buttonClick
 }

 const playSound = (sound) => {
   try {
     const audio = new Audio(sounds[sound])
     audio.volume = volume.value
     audio.play()
   } catch (error) {
     console.error('Error playing audio:', error)
   }
 }

 return {
   volume,
   playSound
 }
}