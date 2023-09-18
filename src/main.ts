
import "@/assets/bootstrap/css/bootstrap.min.css";
import "@/styles/styles.scss";
import "@/styles/dialog.scss";
import "@/styles/toast.scss";
import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router' 

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.mount('#app')
 