<script setup lang="ts">
import { storeToRefs } from 'pinia'
import { watchEffect } from 'vue'
import { useI18n } from 'vue-i18n'

import profile from '@/data/profile.json'
import skills from '@/data/skills.json'
import useLangStore from '@/stores/lang'

const { t } = useI18n()

const langStore = useLangStore()

const { language } = storeToRefs(langStore)

watchEffect(() => {
  document.title = `${t('about.title')} | Tiago Rodrigues`
})
</script>

<template>
  <section class="section">
    <div class="container">

      <h1 class="title is-2">
        {{ t('about.title') }}
      </h1>

      <div class="content is-medium">
        <p>
          {{ profile.summary[language] }}
        </p>
      </div>

      <hr />

      <h2 class="title is-3">
        {{ t('about.technicalSkills') }}
      </h2>

      <div class="tags are-medium">
        <span
          v-for="skill in skills.technical"
          :key="skill.name"
          class="tag is-primary is-light"
        >
          {{ skill.name }}
        </span>
      </div>

      <h2 class="title is-3 mt-6">
        {{ t('about.softSkills') }}
      </h2>

      <div class="tags are-medium">
        <span
          v-for="skill in skills.soft[language]"
          :key="skill"
          class="tag"
        >
          {{ skill }}
        </span>
      </div>

    </div>
  </section>
</template>
