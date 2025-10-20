import { createApp } from "vue";
import { createPinia } from "pinia";
import App from "./App.vue";
import { vTooltip } from "./directives/tooltip";
import { useLocalization } from "./composables/useLocalization";
import "./app.scss";

async function initializeApp() {
  try {
    // Load translations
    const { loadTranslation } = useLocalization();
    await loadTranslation();
    
    // Wait for fonts to load
    await document.fonts.ready;
    
    // Create and mount app
    const app = createApp(App);
    const pinia = createPinia();
    
    app.directive("tooltip", vTooltip);
    app.use(pinia);
    
    // Mount the app
    app.mount("#app");
    
  } catch (error) {
    console.error('Error initializing application:', error);
  }
}

// Execute initialization
initializeApp();