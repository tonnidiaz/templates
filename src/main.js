import "./assets/bootstrap/css/bootstrap.css"
import "./assets/scss/styles.scss"
import "./assets/scss/styles2.scss"
import "./assets/scss/classes.scss"
import "./assets/scss/sidenav.scss"
import '@material-design-icons/font';
import { createApp } from "vue";
import App from "./App.vue";
import { createPinia } from "pinia";
import { router } from "./router"

const app = createApp(App)
app.use(createPinia())
app.use(router)
app.mount("#app");
 