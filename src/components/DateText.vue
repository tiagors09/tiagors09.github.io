<script setup lang="ts">
defineProps<{
  date: string | null
  locale?: string
}>()

const formatDate = (date: string | null, locale = 'pt-BR') => {
  if (!date) return ''

  const [year, month] = date.split('-')

  return new Date(
    Number(year),
    Number(month) - 1
  ).toLocaleDateString(locale, {
    month: 'short',
    year: 'numeric'
  })
}

</script>

<template>
  <span>
    {{ formatDate(date, locale) }}
  </span>
</template>
