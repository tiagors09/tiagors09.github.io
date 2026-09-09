<script setup lang="ts">
import { useSeoMeta } from '@unhead/vue'
import { storeToRefs } from 'pinia'
import { computed, ref, watchEffect } from 'vue'
import { useI18n } from 'vue-i18n'
import { useRoute } from 'vue-router'

import Pagination from '@/components/Pagination.vue'
import ProjectList from '@/components/ProjectList.vue'
import projects from '@/data/projects.json'
import useLangStore from '@/stores/lang'

const { t, locale } = useI18n()
const route = useRoute()

const langStore = useLangStore()
const { language } = storeToRefs(langStore)

const currentPage = ref(1)
const itemsPerPage = 6

const baseSiteUrl = import.meta.env.PROD
  ? 'https://tiagors09.github.io'
  : window.location.origin

useSeoMeta({
  title: 'Projects | Tiago Rodrigues',
  description: 'Explore my portfolio projects built with Vue, TypeScript and modern front-end practices.',
  ogTitle: 'Projects | Tiago Rodrigues',
  ogDescription: 'Explore my portfolio projects built with Vue, TypeScript and modern front-end practices.',
  ogImage: `${baseSiteUrl}/og-image.jpeg`,
  ogUrl: `${baseSiteUrl}${route.fullPath}`,
  ogType: 'website',
  twitterCard: 'summary_large_image',
})

const localizedProjects = computed(() =>
  projects.map((project) => ({
    ...project,
    description: project.description[language.value]
  }))
)

const paginatedProjects = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage

  return localizedProjects.value.slice(start, start + itemsPerPage)
})

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

      <ProjectList :projects="paginatedProjects" />

      <Pagination
        v-model:current-page="currentPage"
        :total-items="localizedProjects.length"
        :items-per-page="itemsPerPage"
        :max-visible-pages="5"
      />
    </div>
  </section>
</template>
