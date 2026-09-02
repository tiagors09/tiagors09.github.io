import { defineStore } from 'pinia'
import { ref } from 'vue'

export type Language = 'pt-BR' | 'en-US'

const useLangStore = defineStore('lang', () => {
  const language = ref<Language>('pt-BR')

  const toggleLanguage = () => {
    language.value = language.value === 'pt-BR' ? 'en-US' : 'pt-BR'
  }

  const setLanguage = (lang: Language) => {
    language.value = lang
  }

  return {
    language,
    toggleLanguage,
    setLanguage
  }
})

export default useLangStore
