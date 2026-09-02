<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { computed, watchEffect } from 'vue'
import { useI18n } from 'vue-i18n'

import ProjectList from '@/components/ProjectList.vue'
import projects from '@/data/projects.json'
import useLangStore from '@/stores/lang'

const { t, locale } = useI18n()

const langStore = useLangStore()
const { language } = storeToRefs(langStore)

const localizedProjects = computed(() =>
  projects.map((project) => ({
    ...project,
    description: project.description[language.value]
  }))
)

watchEffect(() => {
  document.title = `${t('projects.title')} | Tiago Rodrigues`
})

const syncLanguage = () => {
  locale.value = language.value
}

syncLanguage()
</script>

<template>
  <section class="section">
    <div class="container">
      <h1 class="title">
        {{ t('projects.title') }}
      </h1>

      <ProjectList :projects="localizedProjects" />
    </div>
  </section>
</template>
