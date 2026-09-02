<script setup lang="ts">
import { storeToRefs } from 'pinia'
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

const changeLanguage = () => {
  toggleLanguage()
  locale.value = language.value
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
        <RouterLink to="/" class="navbar-item">
          <strong>Tiago Rodrigues</strong>
        </RouterLink>
      </div>

      <div class="navbar-menu is-active">
        <div class="navbar-end">
          <RouterLink to="/" class="navbar-item">
            {{ t('nav.home') }}
          </RouterLink>

          <RouterLink to="/about" class="navbar-item">
            {{ t('nav.about') }}
          </RouterLink>

          <RouterLink to="/experience" class="navbar-item">
            {{ t('nav.experience') }}
          </RouterLink>

          <RouterLink to="/projects" class="navbar-item">
            {{ t('nav.projects') }}
          </RouterLink>

          <RouterLink to="/contact" class="navbar-item">
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
