<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

import ProjectList from '@/components/ProjectList.vue'
import projects from '@/data/projects.json'
import useLangStore from '@/stores/lang'
import useThemeStore from '@/stores/theme'

const { t, locale } = useI18n()

const langStore = useLangStore()
const { language } = storeToRefs(langStore)

const themeStore = useThemeStore()
const { theme } = storeToRefs(themeStore)

const localizedProjects = computed(() =>
  projects.map((project) => ({
    ...project,
    description: project.description[language.value]
  }))
)

const syncLanguage = () => {
  locale.value = language.value
}

syncLanguage()
</script>

<template>
  <section class="section" :class="`is-${theme}`">
    <div class="container">
      <h1 class="title">
        {{ t('projects.title') }}
      </h1>

      <ProjectList :projects="localizedProjects" />
    </div>
  </section>
</template>
