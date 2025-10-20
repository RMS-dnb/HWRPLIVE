<template>
  <div id="telegrams-create">
    <!-- Labels -->
    <label class="form-label sender-label">{{ getText('labels.sender') }}</label>
    <label class="form-label receiver-label">{{ getText('labels.receiver') }}</label>
    <label class="form-label date-label">{{ getText('labels.date') }}</label>

    <!-- Inputs -->
    <div class="sender-container">
      <input
        id="telegram-sender"
        v-model="store.formData.sender"
        :disabled="isViewMode"
        type="text"
      />
      <i v-if="!isViewMode"
        class="use-my-number fas"
        :class="useMyNumber ? 'fa-square-check' : 'fa-square'"
        @click="toggleMyNumber"
        v-tooltip="getText('tooltips.includeMyNumber')"></i>
      <i v-if="isViewMode && hasTelegramNumberInSender"
        class="add-sender-contact fas fa-user-plus"
        @click="addToContacts"
        v-tooltip="getText('tooltips.addToContacts')"></i>
      </div>

    <!-- Receiver with add contact icon -->
    <div class="receiver-container">
      <input
        id="telegram-receiver"
        v-model="store.formData.receiver"
        :disabled="isViewMode || sendToAll"
        type="text"
      />
      <i v-if="!isViewMode && authorizedJobs"
        class="send-to-all fas"
        :class="sendToAll ? 'fa-square-check' : 'fa-square'"
        @click="toggleSendToAll"
        v-tooltip="getText('tooltips.sendToAll')"></i>
    </div>

    <input
      id="telegram-date"
      v-model="store.formData.date"
      disabled
      type="text"
    />

    <div class="form-section-line"></div>

    <!-- Title -->
    <label class="form-label title-label">{{ getText('labels.title') }}</label>
    <input
      id="telegram-title"
      v-model="store.formData.title"
      :disabled="isViewMode"
      type="text"
    />

    <!-- Message -->
    <label class="form-label message-label">{{ getText('labels.message') }}</label>
    <textarea
      id="telegram-text"
      v-model="store.formData.text"
      :disabled="isViewMode"
    ></textarea>
  </div>

  <!-- Flying Telegram Animation -->
  <div v-if="showAnimation" 
       class="flying-telegram"
       @animationend="handleAnimationEnd">
    <img src="../assets/img/telegram.png" 
         alt="Flying telegram"
         class="w-[20vh] h-[15vh] object-contain" />
  </div>

  <!-- Send Button -->
  <button
   v-if="!isViewMode"
   id="send-new-telegram"
   @click="handleSend"
   class="absolute bottom-[2.5vh] right-[12vh] px-2 py-1 text-[200%] text-white 
          rounded font-crock hover:scale-105 transition-transform duration-500"
 >
   {{ getText('buttons.send') }}
 </button>
 <button
   v-if="isViewMode"
   @click="handleAnswer"
   class="absolute bottom-[2.5vh] right-[12vh] px-2 py-1 text-[200%] text-white 
          rounded font-crock hover:scale-105 transition-transform duration-500"
 >
   {{ getText('buttons.answer') }}
 </button>
 <div class="absolute bottom-[3.5vh] left-[5vh] flex items-center gap-2">
    <span class="text-[#000] font-crock text-[2.5vh] font-bold">{{ getText('labels.telegramNo') }}</span>
    <div class="border-l-2 border-[#000] pl-2">
      <span class="text-[#000] font-crock text-[2vh] font-semibold">{{ store.currentNumber }}</span>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useTelegramStore } from '../stores/telegramStore'
import { useAudio } from '../composables/useAudio'
import { useNui } from '../composables/useNui'
import { vTooltip } from '../directives/tooltip'
import { useLocalization } from '../composables/useLocalization'

const { getText } = useLocalization()
const showAnimation = ref(false)
const store = useTelegramStore()
const { playSound } = useAudio()
const { fetchNui } = useNui()

const useMyNumber = ref(false)
const sendToAll = ref(false)
const isViewMode = computed(() => !!store.currentTelegram)
const hasTelegramNumberInSender = computed(() => {
  const match = store.formData.sender.match(/TG-\w+/);
  return !!match;
});
const authorizedJobs = computed(() => {
  if (!store.authorizedJobs?.enable) return true
  const player = store.playerData
  const jobConfig = store.authorizedJobs?.[player?.job]
  return jobConfig && jobConfig.grades.includes(player?.grade)
})

const toggleSendToAll = () => {
  if (!authorizedJobs.value) return
  playSound('button.mp3')
  sendToAll.value = !sendToAll.value
  store.formData.receiver = sendToAll.value ? '*' : ''
}

const handleSend = async () => {
  if (!store.formData.sender && !store.formData.receiver && 
      !store.formData.title && !store.formData.text) return

  playSound('button.mp3')
  showAnimation.value = true
}

const handleAnswer = async () => {
  try {
    playSound('button.mp3')
    
    const response = await fetchNui('AnswerTelegram', {
      sender: store.formData.sender,
      title: store.formData.title,
      date: store.formData.date
    })

    if (response && response.success && response.senderNumber) {
      const currentDate = store.formData.date
      store.resetFormData()
      store.formData.date = currentDate
      store.formData.receiver = response.senderNumber
      store.currentTelegram = null
    }
  } catch (error) {
    console.error('Error in handleAnswer:', error)
  }
}

const props = defineProps({
  showCreateForm: {
    type: Object,
    required: true
  }
})

const handleAnimationEnd = async () => {
  showAnimation.value = false
  await fetchNui('SendTelegram', {
    ...store.formData,
    city: store.currentCity,
    state: store.currentState,
    isBirdPost: store.isBirdPost
  })
  store.activeView = 'telegrams'
}

const toggleMyNumber = () => {
  playSound('button.mp3')
  useMyNumber.value = !useMyNumber.value
  if (useMyNumber.value) {
    if (!store.formData.sender.includes(store.currentNumber)) {
      store.formData.sender = store.formData.sender ? 
        `${store.formData.sender} ${store.currentNumber}` : 
        store.currentNumber
    }
  } else {
    store.formData.sender = store.formData.sender.replace(store.currentNumber, '').trim()
  }
}

const addToContacts = async () => {
  playSound('button.mp3');
  // Extract TG number from sender
  const match = store.formData.sender.match(/TG-\w+/);
  if (match && match[0]) {
    store.setContactNumber(match[0]); // Set the extracted number
    store.activeView = 'contacts'; // Switch to contacts view
    store.shouldShowCreateForm = true; // Trigger form to open
  }
}
</script>

<style lang="scss" scoped>
// Style tetap sama seperti sebelumnya...
#telegrams-create {
  position: absolute;
  left: 3vh;
  top: 18vh;
  height: 47vh;
  width: 94vh;
  overflow: auto;
  overflow-x: hidden;
}

.form-label {
  position: absolute;
  font-family: "crock", crock, serif;
  font-size: 1.5vh;
  color: #000000;
  text-transform: uppercase;
  font-weight: lighter;
  z-index: 50;
}

.sender-label { left: 1vh; top: 0; }
.receiver-label { left: 35vh; top: 0; }
.date-label { left: 67.5vh; top: 0; }
.title-label { left: 1vh; top: 8vh; }
.message-label { left: 1vh; top: 13vh; }

#telegram-sender,
#telegram-receiver,
#telegram-date,
#telegram-title,
#telegram-text {
  position: absolute;
  background: rgba(255,255,255,0.4);
  border: none;
  opacity: 0.95;
  font-family: "crock", crock, serif;
  font-size: 18px;
  outline: none;
  text-align: left;
  text-indent: 0vh;
  resize: none;
  outline: none;
}

#telegram-text::-webkit-scrollbar{
  width: 1vh;
  background: rgba(0,0,0,0.1);
}
#telegram-text::-webkit-scrollbar-thumb{
  background: rgba(0,0,0,0.2);
  border-radius: 2px;
}

#telegram-text::-webkit-scrollbar-thumb:hover{
  background: rgba(0,0,0,0.3);
}

#telegram-sender { width: 22vh; height: 2vh; top: 3vh; left: 1vh; }
#telegram-receiver { width: 25vh; height: 2vh; top: 3vh; left: 35vh; }
#telegram-date { width: 25vh; height: 2vh; top: 3vh; right: 1vh; }
#telegram-title { width: 82vh; height: 3vh; top: 8vh; left: 11vh; }
#telegram-text { width: 82vh; height: 32vh; top: 13vh; left: 11vh; }

.form-section-line {
  position: absolute;
  top: 6vh;
  left: 0;
  width: 95vh;
  height: 4px;
  background-color: #000000;
  opacity: 0.85;
  z-index: 50;
  box-shadow: 
    0 0 2px rgba(0, 0, 0, 0.5),
    inset -5px -2px 10px rgba(0, 0, 0, 0.3),
    10px 0 10px rgba(255, 255, 255, 0.2),
    -15px 0 15px rgba(255, 255, 255, 0.1);
}

.use-my-number,
.add-sender-contact {
  position: absolute;
  color: #000000;
  opacity: 0.7;
  cursor: pointer;
  transition: all 0.2s ease;
  z-index: 1000;

  &:hover {
    opacity: 1;
  }
}

.use-my-number {
  left: 24vh;
  top: 3.5vh;
}

.add-sender-contact {
  left: 24vh; // Sesuaikan posisi agar tidak tumpang tindih dengan use-my-number
  top: 3.5vh;
}

.send-to-all {
  position: absolute;
  color: #000000;
  opacity: 0.7;
  cursor: pointer;
  transition: all 0.2s ease;
  left: 61vh;
  top: 3.5vh;
  z-index: 1000;

  &:hover {
    opacity: 1;
  }
}

input:focus,
textarea:focus {
  outline: none;
  border: none;
  background: rgba(255,255,255,0.5);
}

input:disabled,
textarea:disabled {
  background: rgba(255,255,255,0.4);
  color: #666;
  cursor: not-allowed;
}

.flying-telegram {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1000;
  animation: fly-away 1s ease-in forwards;
}

@keyframes fly-away {
  0% {
    transform: translate(-50%, -50%) scale(1) rotate(0deg);
    opacity: 1;
  }
  100% {
    transform: translate(100vw, -100vh) scale(0.5) rotate(45deg);
    opacity: 0;
  }
}
</style>