<script setup lang="ts">
import { computed, watchEffect } from 'vue';
import { useI18n } from 'vue-i18n';

import profile from '@/data/profile.json';

const { t } = useI18n()

watchEffect(() => {
  document.title = `${t('contact.title')} | Tiago Rodrigues`
})


const whatsappUrl = computed(() => {
  const phone = profile.phone.replace(/\D/g, '')
  return `https://wa.me/55${phone}`
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
          <a :href="whatsappUrl" target="_blank" rel="noopener noreferrer" aria-label="Entrar em contato pelo WhatsApp" > 
            <span class="icon"> 
              <i class="fa-brands fa-whatsapp" aria-hidden="true"/> 
            </span> 
            
            {{ profile.phone }} 
          </a> 
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

          <span class="ml-1">
            GitHub
          </span>
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

          <span class="ml-1">
            LinkedIn
          </span>
        </a>

      </div>

    </div>
  </section>
</template>
