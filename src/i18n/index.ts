import { createI18n } from 'vue-i18n'

import enUS from '@/i18n/locales/en-US'
import ptBR from '@/i18n/locales/pt-BR'

const i18n = createI18n({
  legacy: false,
  locale: 'pt-BR',
  fallbackLocale: 'en-US',

  messages: {
    'pt-BR': ptBR,
    'en-US': enUS
  }
})

export default i18n
