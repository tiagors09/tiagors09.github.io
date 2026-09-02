<script setup lang="ts">
import ExperienceListItem from '@/components/ExperiencesListItem.vue';
import type Experience from '@/types/experience';

withDefaults(
  defineProps<{
    experiences: Experience[]
    currentLabel?: string
  }>(),
  {
    currentLabel: 'Present'
  }
)
</script>

<template>
  <div>
    <ExperienceListItem
      v-for="experience in experiences"
      :key="experience.id"
      :experience="experience"
      :current-label="currentLabel"
    />
  </div>
</template>
