<script setup lang="ts">
import { storeToRefs } from 'pinia'

import useThemeStore from '@/stores/theme'
import NavBar from './NavBar.vue'

const themeStore = useThemeStore()
const { theme } = storeToRefs(themeStore)
</script>

<template>
  <div class="base-layout" :class="`is-${theme}`">
    <NavBar />

    <main class="base-layout__content">
      <slot />
    </main>
  </div>
</template>

<style scoped>
.base-layout {
  min-height: 100vh;
  background-color: var(--app-background);
  color: var(--app-text);
}

.base-layout.is-light {
  --app-background: #ffffff;
  --app-text: #363636;
  --bulma-body-background-color: #ffffff;
  --bulma-body-color: #363636;
  --bulma-scheme-main: #ffffff;
  --bulma-scheme-main-bis: #fafafa;
  --bulma-box-background-color: #ffffff;
  --bulma-card-background-color: #ffffff;
}

.base-layout.is-dark {
  --app-background: #181818;
  --app-text: #ffffff;
  --bulma-body-background-color: #181818;
  --bulma-body-color: #ffffff;
  --bulma-scheme-main: #181818;
  --bulma-scheme-main-bis: #202020;
  --bulma-box-background-color: #202020;
  --bulma-card-background-color: #202020;
}

.base-layout__content {
  min-height: calc(100vh - 3.25rem);
  background-color: transparent;
  color: inherit;
}
</style>
