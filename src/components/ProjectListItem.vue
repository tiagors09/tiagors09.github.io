<script setup lang="ts">
import useThemeStore from '@/stores/theme';
import type Project from '@/types/project';
import { storeToRefs } from 'pinia';

defineProps<{
  project: Project
}>()

const themeStore = useThemeStore()
const { theme } = storeToRefs(themeStore)
</script>

<template>
  <article class="card" :class="`is-${theme}`">
    <div
      v-if="project.image"
      class="card-image"
    >
      <figure class="image is-16by9">
        <img
          :src="project.image"
          :alt="project.name"
          loading="lazy"
          decoding="async"
        />
      </figure>
    </div>

    <div class="card-content">
      <p class="title is-5">
        {{ project.name }}
      </p>

      <div class="content">
        {{ project.description }}
      </div>

      <div class="tags">
        <span
          v-for="technology in project.technologies"
          :key="technology"
          class="tag is-info is-light"
        >
          {{ technology }}
        </span>
      </div>
    </div>

    <footer
      v-if="project.github || project.demo"
      class="card-footer"
    >
      <a
        v-if="project.github"
        :href="project.github"
        target="_blank"
        rel="noopener noreferrer"
        class="card-footer-item"
        :aria-label="`GitHub: ${project.name}`"
      >
        <span class="icon">
          <i class="fa-brands fa-github"></i>
        </span>

        <span>GitHub</span>
      </a>

      <a
        v-if="project.demo"
        :href="project.demo"
        target="_blank"
        rel="noopener noreferrer"
        class="card-footer-item"
        :aria-label="`Demo: ${project.name}`"
      >
        <span class="icon">
          <i class="fa-solid fa-arrow-up-right-from-square"></i>
        </span>

        <span>Demo</span>
      </a>
    </footer>
  </article>
</template>
