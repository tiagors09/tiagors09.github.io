<script setup lang="ts">
import { useI18n } from 'vue-i18n';

import profile from '@/data/profile.json';

const { t } = useI18n()

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
          class="button"
        >
          GitHub
        </a>

        <a
          :href="profile.links.linkedin"
          target="_blank"
          rel="noopener noreferrer"
          class="button"
        >
          LinkedIn
        </a>

      </div>

    </div>
  </section>
</template>
