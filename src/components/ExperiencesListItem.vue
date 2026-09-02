<script setup lang="ts">
import DateText from '@/components/DateText.vue';
import useThemeStore from '@/stores/theme';
import type Experience from '@/types/experience';
import { storeToRefs } from 'pinia';

defineProps<{
  experience: Experience
  currentLabel?: string
}>()

const themeStore = useThemeStore()
const { theme } = storeToRefs(themeStore)
</script>

<template>
  <article class="box" :class="`is-${theme}`">
    <div class="level mb-2">
      <div>
        <h3 class="title is-5 mb-1">
          {{ experience.role }}
        </h3>

        <p class="subtitle is-6 mb-0">
          {{ experience.company }}
        </p>

        <span
          v-if="experience.current"
          class="tag is-success is-light mt-2"
        >
          {{ currentLabel }}
        </span>
      </div>

      <div class="has-text-right">
        <p class="is-size-7 has-text-grey">
          <DateText :date="experience.startDate" />

          -

          <span v-if="experience.current">
            {{ currentLabel }}
          </span>

          <DateText
            v-else
            :date="experience.endDate"
          />
        </p>
      </div>
    </div>

    <ul class="mb-4">
      <li
        v-for="(description, index) in experience.description"
        :key="index"
        class="mb-2"
      >
        {{ description }}
      </li>
    </ul>

    <div class="tags">
      <span
        v-for="technology in experience.technologies"
        :key="technology"
        class="tag is-info is-light"
      >
        {{ technology }}
      </span>
    </div>
  </article>
</template>
