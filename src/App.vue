<script setup lang="ts">
import { storeToRefs } from 'pinia'
import NavBar from './components/NavBar.vue'
import useThemeStore from './stores/theme'

const themeStore = useThemeStore()
const { theme } = storeToRefs(themeStore)
</script>

<template>
  <div :class="`is-${theme}`">
    <NavBar />

    <main :class="`is-${theme}`">
      <RouterView />
    </main>
  </div>
</template>
