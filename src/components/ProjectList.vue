<script setup lang="ts">
import type Project from '@/types/project';
import ProjectListItem from './ProjectListItem.vue';

defineProps<{
  projects: Project[]
}>()

</script>

<template>
  <div class="columns is-multiline">
    <div
      v-for="project in projects"
      :key="project.id"
      class="column is-6"
    >
      <ProjectListItem :project="project" />
    </div>
  </div>
</template>
