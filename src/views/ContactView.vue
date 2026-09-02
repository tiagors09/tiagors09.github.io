<script setup lang="ts">
import { watchEffect } from 'vue';
import { useI18n } from 'vue-i18n';

import profile from '@/data/profile.json';

const { t } = useI18n()

watchEffect(() => {
  document.title = `${t('contact.title')} | Tiago Rodrigues`
})

</script>

<template>
  <section class="section">
    <div class="container">

      <h1 class="title is-2">
        {{ t('contact.title') }}
      </h1>

      <div class="content is-medium">

        <p>
          {{ profile.location }}
        </p>

        <p>
          <a :href="`mailto:${profile.email}`">
            {{ profile.email }}
          </a>
        </p>

        <p>
          {{ profile.phone }}
        </p>

      </div>

      <div class="buttons">

        <a
          :href="profile.links.github"
          target="_blank"
          rel="noopener noreferrer"
          class="button is-dark"
        >
          <span class="icon" aria-hidden="true">
            <i class="fa-brands fa-github"></i>
          </span>

          GitHub
        </a>

        <a
          :href="profile.links.linkedin"
          target="_blank"
          rel="noopener noreferrer"
          class="button is-link"
        >
          <span class="icon" aria-hidden="true">
            <i class="fa-brands fa-linkedin"></i>
          </span>

          LinkedIn
        </a>

      </div>

    </div>
  </section>
</template>
