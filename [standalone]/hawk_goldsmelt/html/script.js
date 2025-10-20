var success_s = new Audio("sounds/success.mp3");
  success_s.volume = 0.1;
var cog_spin_s = new Audio("sounds/cog_spin.mp3");
  cog_spin_s.volume = 0.3;

let successPercent = 0;
let progress = 0;
let overTargetStartTime = null;
let failed = false;
let uiVisible = false;

const successDisplay = document.getElementById('success-count');
const circle = document.querySelector('.progress-ring-circle');
const button = document.getElementById('progress-button');
const radius = circle.r.baseVal.value;
const circumference = 2 * Math.PI * radius;
const gear = document.getElementById('gear');
const targetMin = 60;
const targetMax = 70;

circle.style.strokeDasharray = `${circumference}`;
circle.style.strokeDashoffset = `${circumference}`;


window.addEventListener("message", (event) => {
  const data = event.data;

  if (data.action === "showSmeltUI") {
    document.body.style.display = "flex";
    document.querySelector(".progress-container").style.display = "block";
    safePlayAudio(cog_spin_s);

    //  clean data
    hasSentZero = true;
    progress = 0;
    successPercent = 0;
    overTargetStartTime = null;
    failed = false;
    lastClickTime = Date.now();
    successDisplay.textContent = "0%";
    setProgress(progress);
    button.disabled = false;
    gear.textContent = '⚙';
    circle.style.stroke = '#e6e6e6';
    uiVisible = true;
  }

  if (data.action === "hideSmeltUI") {
    uiVisible = false;
    document.body.style.display = "none";
    document.querySelector(".progress-container").style.display = "none";
  }

});

function setProgress(percent) {
  if (percent > 95) percent = 95;
  const offset = circumference - (percent / 100) * circumference;
  circle.style.strokeDashoffset = offset;

  if (percent > targetMax) {
    circle.style.stroke = '#ff4444'; 
  } else if (percent >= targetMin && percent <= targetMax) {
    circle.style.stroke = '#ff9900'; 
  } else {
    circle.style.stroke = '#e6e6e6';
  }
}

function safePlayAudio(audio) {
  try {
    const cloned = audio.cloneNode(true);
    cloned.volume = audio.volume;
    cloned.play().catch(() => {});
  } catch (e) {}
}


let resetLightTimeout = null;

button.addEventListener('click', () => {
  if (progress < 100) {
    gear.classList.add('spin'); 
    lastClickTime = Date.now();
    progress += Math.floor(Math.random() * 6) + 10;
    setProgress(progress);

    safePlayAudio(cog_spin_s);


 
      fetch(`https://${GetParentResourceName()}/adjustFire`, {
        method: 'POST',
        body: JSON.stringify({ action: 'increase' })
      });
  
      if (resetLightTimeout) clearTimeout(resetLightTimeout);
      resetLightTimeout = setTimeout(() => {
        const now = Date.now();
        if (now - lastClickTime >= 1000) {
          fetch(`https://${GetParentResourceName()}/adjustFire`, {
            method: 'POST',
            body: JSON.stringify({ action: 'reset' })
          });
        }
      }, 1000);

    setTimeout(() => {
      gear.classList.remove('spin');
    }, 500);
  }
});

let decayInterval = null;
let lastClickTime = Date.now();

function startDecayTimer() {
  if (decayInterval) return; 

  decayInterval = setInterval(() => {
    const now = Date.now();
    const timeSinceLastClick = now - lastClickTime;

    if (timeSinceLastClick > 1000 && progress > 0) {
      progress -= 1; 
      if (progress < 0) progress = 0;
      setProgress(progress);
    }
  }, 200); 
}

startDecayTimer(); 

let hasSentZero = true;
setInterval(() => {
  if (!uiVisible) return; 

  const now = Date.now();

  if (now - lastClickTime > 1000 && progress > 0) {
    progress -= 1;
    if (progress < 0) progress = 0;
    setProgress(progress);
  }
 
  if (progress === 0 && !hasSentZero) {
    hasSentZero = true;
    fetch(`https://${GetParentResourceName()}/closeUI`, {
      method: 'POST',
      body: JSON.stringify({})
    });
    uiVisible = false;
    document.body.style.display = "none";
    document.querySelector(".progress-container").style.display = "none";
    cog_spin_s.pause();
    cog_spin_s.currentTime = 0;

  }

  if (progress > 0) {
    hasSentZero = false; 
  }

  if (progress >= targetMin && progress <= targetMax) {
    if (successPercent < 100) {
      const gain = 1.0 + (progress / 50); 
      successPercent += gain;

      if (successPercent >= 100) {
        successPercent = 100;
        successDisplay.textContent = `100%`;
      
        setTimeout(() => {
          fetch(`https://${GetParentResourceName()}/closeSmeltUI`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({})
          });
          uiVisible = false;
          document.body.style.display = "none";
          document.querySelector(".progress-container").style.display = "none";
          cog_spin_s.pause();
          cog_spin_s.currentTime = 0;
          success_s.play();

        }, 500);
      }

      successDisplay.textContent = `${Math.floor(successPercent)}%`;
    }
  }

  if (progress > targetMax) {
    if (!overTargetStartTime) {
      overTargetStartTime = Date.now(); 
    } else if (Date.now() - overTargetStartTime > 2000 && !failed) {
      failed = true;
      progress = 0;
      successPercent = 0;
      failed = false;
      overTargetStartTime = null;
      lastClickTime = Date.now();

      gear.textContent = '⚙';
      circle.style.stroke = '#e6e6e6';
      button.disabled = false;
      successDisplay.textContent = `0%`;
      setProgress(progress);
      
      fetch(`https://${GetParentResourceName()}/closeSmeltUI`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ success: false }) 
      });
      uiVisible = false;
      cog_spin_s.pause();
      cog_spin_s.currentTime = 0;
      document.body.style.display = "none";
      document.querySelector(".progress-container").style.display = "none";

    }
  } else {
    overTargetStartTime = null; 
  }

}, 200);
