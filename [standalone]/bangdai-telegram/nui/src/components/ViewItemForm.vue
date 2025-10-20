// ViewItemForm.vue
<template>
 <div id="telegrams-create">
   <!-- Labels -->
   <label class="form-label sender-label">{{ getText('labels.sender') }}</label>
   <label class="form-label receiver-label">{{ getText('labels.receiver') }}</label>
   <label class="form-label date-label">{{ getText('labels.date') }}</label>

   <input
     id="telegram-sender"
     v-model="store.formData.sender"
     disabled
     type="text"
   />

   <input
     id="telegram-receiver"
     v-model="store.formData.receiver"
     disabled
     type="text"
   />

   <input
     id="telegram-date"
     v-model="store.formData.date"
     disabled
     type="text"
   />

   <div class="form-section-line"></div>

   <label class="form-label title-label">{{ getText('labels.title') }}</label>
   <input
     id="telegram-title"
     v-model="store.formData.title"
     disabled
     type="text"
   />

   <label class="form-label message-label">{{ getText('labels.message') }}</label>
   <textarea
     id="telegram-text"
     v-model="store.formData.text"
     disabled
   ></textarea>
 </div>
 <div class="absolute bottom-[3.5vh] left-[5vh] flex items-center gap-2">
    <span class="text-[#000] font-crock text-[2.5vh] font-bold">{{ getText('labels.telegramNo') }}</span>
    <div class="border-l-2 border-[#000] pl-2">
      <span class="text-[#000] font-crock text-[2vh] font-semibold">{{ store.currentNumber }}</span>
    </div>
  </div>
</template>

<script setup>
import { useTelegramStore } from '../stores/telegramStore'
import { useLocalization } from '../composables/useLocalization'
  
const { getText } = useLocalization()
const store = useTelegramStore()
const backToList = () => {
  store.activeView = 'telegrams'
  store.currentTelegram = null
  // View akan otomatis kembali ke view sebelumnya karena kita simpan di store
}
</script>

<style lang="scss" scoped>
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
  background: rgba(255,255,255,0.6);
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
.add-receiver-contact {
  position: absolute;
  color: #49452b;
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

.add-receiver-contact {
  left: 61vh;
  top: 3.5vh;
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