<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'

import ExperienceList from '@/components/ExperienceList.vue'
import experiences from '@/data/experiences.json'
import useLangStore from '@/stores/lang'
import useThemeStore from '@/stores/theme'

const { t } = useI18n()

const langStore = useLangStore()
const { language } = storeToRefs(langStore)

const themeStore = useThemeStore()
const { theme } = storeToRefs(themeStore)

const localizedExperiences = computed(() =>
  experiences.map((experience) => ({
    ...experience,
    role: experience.role[language.value],
    description: experience.description[language.value]
  }))
)
</script>

<template>
  <section class="section" :class="`is-${theme}`">
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
