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

.base-layout.is-light :deep(.title),
.base-layout.is-light :deep(.content),
.base-layout.is-light :deep(.heading),
.base-layout.is-light :deep(.subtitle),
.base-layout.is-light :deep(.content p),
.base-layout.is-light :deep(.content li) {
  color: #24292f;
}

.base-layout.is-light :deep(.subtitle),
.base-layout.is-light :deep(.has-text-grey) {
  color: #4b5563;
}

.base-layout.is-light :deep(.box li),
.base-layout.is-light :deep(.card li) {
  color: #24292f;
}

.base-layout.is-light :deep(a:not(.button)) {
  color: #075985;
}

.base-layout.is-light :deep(a:not(.button):hover) {
  color: #0c4a6e;
}

.base-layout.is-light :deep(.button.is-light),
.base-layout.is-light :deep(.tag:not(.is-primary):not(.is-info)) {
  background-color: #e8edf2;
  border-color: #b8c2cc;
  color: #26323d;
}

.base-layout.is-light :deep(.button.is-light:hover),
.base-layout.is-light :deep(.tag:not(.is-primary):not(.is-info):hover) {
  background-color: #d9e1e8;
  border-color: #8d9aa6;
  color: #17212b;
}

.base-layout.is-light :deep(.box),
.base-layout.is-light :deep(.card) {
  border: 1px solid #d1d9e0;
}

.base-layout.is-light :deep(.card-footer) {
  border-top-color: #d1d9e0;
}

.base-layout.is-light :deep(.navbar) {
  border-bottom: 1px solid #d1d9e0;
}

.base-layout.is-dark :deep(.title),
.base-layout.is-dark :deep(.content),
.base-layout.is-dark :deep(.heading),
.base-layout.is-dark :deep(.subtitle),
.base-layout.is-dark :deep(.content p),
.base-layout.is-dark :deep(.content li) {
  color: #f3f4f6;
}

.base-layout.is-dark :deep(.subtitle),
.base-layout.is-dark :deep(.has-text-grey) {
  color: #cbd5e1;
}

.base-layout.is-dark :deep(.box li),
.base-layout.is-dark :deep(.card li) {
  color: #f3f4f6;
}

.base-layout.is-dark :deep(a:not(.button)) {
  color: #7dd3fc;
}

.base-layout.is-dark :deep(a:not(.button):hover) {
  color: #bae6fd;
}

.base-layout.is-dark :deep(.button.is-light),
.base-layout.is-dark :deep(.tag:not(.is-primary):not(.is-info)) {
  background-color: #3b4652;
  border-color: #647181;
  color: #f8fafc;
}

.base-layout.is-dark :deep(.button.is-light:hover),
.base-layout.is-dark :deep(.tag:not(.is-primary):not(.is-info):hover) {
  background-color: #4b5866;
  border-color: #94a3b8;
  color: #ffffff;
}

.base-layout.is-dark :deep(.box),
.base-layout.is-dark :deep(.card) {
  border: 1px solid #3f4a56;
}

.base-layout.is-dark :deep(.card-footer) {
  border-top-color: #3f4a56;
}

.base-layout.is-dark :deep(.navbar) {
  border-bottom: 1px solid #3f4a56;
}

.base-layout :deep(input),
.base-layout :deep(textarea),
.base-layout :deep(select) {
  border-color: #9aa6b2;
}

.base-layout.is-dark :deep(input),
.base-layout.is-dark :deep(textarea),
.base-layout.is-dark :deep(select) {
  background-color: #202020;
  border-color: #647181;
  color: #f3f4f6;
}

.base-layout :deep(input::placeholder),
.base-layout :deep(textarea::placeholder) {
  color: #64707c;
  opacity: 1;
}

.base-layout.is-dark :deep(input::placeholder),
.base-layout.is-dark :deep(textarea::placeholder) {
  color: #b8c2cc;
}

.base-layout :deep(a:focus-visible),
.base-layout :deep(button:focus-visible),
.base-layout :deep(input:focus-visible),
.base-layout :deep(textarea:focus-visible),
.base-layout :deep(select:focus-visible) {
  outline: 3px solid #0ea5e9;
  outline-offset: 2px;
}

.base-layout :deep(:disabled) {
  opacity: 0.65;
}

.base-layout__content {
  min-height: calc(100vh - 3.25rem);
  background-color: transparent;
  color: inherit;
}
</style>
