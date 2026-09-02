import { defineStore } from 'pinia';
import { ref } from 'vue';

type Theme = 'light' | 'dark';

const useThemeStore = defineStore('theme', () => {
  const theme = ref<Theme>('light');

  const toggleTheme = () => {
    theme.value = theme.value === 'light' ? 'dark' : 'light';
  }

  return { theme, toggleTheme }
});

export default useThemeStore;
