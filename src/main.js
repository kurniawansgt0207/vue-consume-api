import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import Sample from './directive-vbind.vue';
import InputData from './form.vue';
import ConsumeAPI from './vue-api-consume.vue';

createApp(App).mount('#app')
createApp(Sample).mount('#sample')
createApp(InputData).mount('#input-data')
createApp(ConsumeAPI).mount('#consume-api')