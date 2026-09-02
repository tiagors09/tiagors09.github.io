<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { computed, watchEffect } from 'vue'
import { useI18n } from 'vue-i18n'

import ExperienceList from '@/components/ExperienceList.vue'
import experiences from '@/data/experiences.json'
import useLangStore from '@/stores/lang'

const { t } = useI18n()

const langStore = useLangStore()
const { language } = storeToRefs(langStore)

const localizedExperiences = computed(() =>
  experiences.map((experience) => ({
    ...experience,
    role: experience.role[language.value],
    description: experience.description[language.value]
  }))
)

watchEffect(() => {
  document.title = `${t('experience.title')} | Tiago Rodrigues`
})
</script>

<template>
  <section class="section">
    <div class="container">
      <h1 class="title">
        {{ t('experience.title') }}
      </h1>

      <ExperienceList
        :experiences="localizedExperiences"
        :current-label="t('experience.present')"
      />
    </div>
  </section>
</template>
