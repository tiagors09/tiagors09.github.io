<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { ref } from 'vue'
import { useI18n } from 'vue-i18n'
import { RouterLink } from 'vue-router'

import useLangStore from '../stores/lang'
import useThemeStore from '../stores/theme'

const { t, locale } = useI18n()

const themeStore = useThemeStore()
const langStore = useLangStore()

const { theme } = storeToRefs(themeStore)
const { language } = storeToRefs(langStore)

const { toggleTheme } = themeStore
const { toggleLanguage } = langStore
const isMenuOpen = ref(false)

const changeLanguage = () => {
  toggleLanguage()
  locale.value = language.value
}

const closeMenu = () => {
  isMenuOpen.value = false
}
</script>

<template>
  <nav
    class="navbar"
    :class="`is-${theme}`"
    role="navigation"
    aria-label="main navigation"
  >
    <div class="container">
      <div class="navbar-brand">
        <RouterLink to="/" class="navbar-item" active-class="is-active" @click="closeMenu">
          <strong>Tiago Rodrigues</strong>
        </RouterLink>
      </div>

      <button
        class="navbar-burger"
        :class="{ 'is-active': isMenuOpen }"
        type="button"
        :aria-label="t('nav.menu')"
        :aria-expanded="isMenuOpen"
        aria-controls="main-navigation-menu"
        @click="isMenuOpen = !isMenuOpen"
      >
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
        <span aria-hidden="true"></span>
      </button>

      <div
        id="main-navigation-menu"
        class="navbar-menu"
        :class="{ 'is-active': isMenuOpen }"
      >
        <div class="navbar-end">
          <RouterLink to="/" class="navbar-item" active-class="is-active" @click="closeMenu">
            {{ t('nav.home') }}
          </RouterLink>

          <RouterLink to="/about" class="navbar-item" active-class="is-active" @click="closeMenu">
            {{ t('nav.about') }}
          </RouterLink>

          <RouterLink to="/experience" class="navbar-item" active-class="is-active" @click="closeMenu">
            {{ t('nav.experience') }}
          </RouterLink>

          <RouterLink to="/projects" class="navbar-item" active-class="is-active" @click="closeMenu">
            {{ t('nav.projects') }}
          </RouterLink>

          <RouterLink to="/contact" class="navbar-item" active-class="is-active" @click="closeMenu">
            {{ t('nav.contact') }}
          </RouterLink>

          <button
            class="button is-ghost navbar-item"
            type="button"
            :aria-label="t('actions.switchLanguage')"
            @click="changeLanguage"
          >
            <span class="icon">
              <i class="fa-solid fa-globe" aria-hidden="true"></i>
            </span>

            <span>
              {{ language === 'pt-BR' ? 'EN' : 'PT' }}
            </span>
          </button>

          <button
            class="button is-ghost navbar-item"
            type="button"
            :aria-label="t('actions.switchTheme')"
            @click="toggleTheme"
          >
            <span class="icon">
              <i
                :class="theme === 'dark' ? 'fa-solid fa-sun' : 'fa-solid fa-moon'"
                aria-hidden="true"
              ></i>
            </span>
          </button>
        </div>
      </div>
    </div>
  </nav>
</template>
