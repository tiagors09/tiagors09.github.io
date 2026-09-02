<script setup lang="ts">
import { useI18n } from 'vue-i18n';
import { RouterLink } from 'vue-router';

const { t } = useI18n()
</script>

<template>
  <section class="hero is-medium">
    <div class="hero-body">
      <div class="container">
        <div class="columns is-vcentered">
          <div class="column is-two-thirds">
            <p class="is-size-5 mb-2">
              {{ t('home.greeting') }}
            </p>

            <h1 class="title is-1 mb-3">
              {{ t('home.name') }}
            </h1>

            <h2 class="subtitle is-3">
              {{ t('home.role') }}
            </h2>

            <p class="is-size-5 mb-5">
              {{ t('home.description') }}
            </p>

            <div class="buttons">
              <RouterLink
                to="/experience"
                class="button is-primary is-medium"
              >
                {{ t('home.experience') }}
              </RouterLink>

              <RouterLink
                to="/projects"
                class="button is-light is-medium"
              >
                {{ t('home.projects') }}
              </RouterLink>
            </div>
          </div>

          <div class="column">
            <div class="box">
              <p class="heading">
                {{ t('home.role') }}
              </p>

              <div class="tags">
                <span class="tag is-primary">Flutter</span>
                <span class="tag">Dart</span>
                <span class="tag">Clean Architecture</span>
                <span class="tag">BLoC / Cubit</span>
                <span class="tag">REST API</span>
                <span class="tag">Git</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
