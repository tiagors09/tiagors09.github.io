<script setup lang="ts">
import { computed } from 'vue'

import { useI18n } from 'vue-i18n'

interface PaginationProps {
  currentPage: number
  totalItems: number
  itemsPerPage: number
  maxVisiblePages?: number
}

type PageItem =
  | {
      type: 'page'
      page: number
    }
  | {
      type: 'ellipsis'
      marker: string
    }

const props = withDefaults(defineProps<PaginationProps>(), {
  maxVisiblePages: 5
})

const emit = defineEmits<{
  'update:currentPage': [page: number]
  'page-change': [page: number]
}>()

const { t } = useI18n()

const totalPages = computed(() => {
  if (props.totalItems <= 0 || props.itemsPerPage <= 0) {
    return 0
  }

  return Math.ceil(props.totalItems / props.itemsPerPage)
})

const normalizedCurrentPage = computed(() => {
  if (totalPages.value <= 0) {
    return 1
  }

  return Math.min(
    Math.max(props.currentPage, 1),
    totalPages.value
  )
})

const pageItems = computed<PageItem[]>(() => {
  const total = totalPages.value
  const current = normalizedCurrentPage.value
  const max = Math.max(props.maxVisiblePages, 3)

  if (total <= 1) {
    return []
  }

  if (total <= max) {
    return Array.from({ length: total }, (_, index) => ({
      type: 'page' as const,
      page: index + 1
    }))
  }

  const items: PageItem[] = []

  items.push({
    type: 'page',
    page: 1
  })

  const siblingCount = Math.max(
    1,
    Math.floor((max - 3) / 2)
  )

  const startPage = Math.max(
    2,
    current - siblingCount
  )

  const endPage = Math.min(
    total - 1,
    current + siblingCount
  )

  if (startPage > 2) {
    items.push({
      type: 'ellipsis',
      marker: 'start'
    })
  }

  for (let page = startPage; page <= endPage; page++) {
    items.push({
      type: 'page',
      page
    })
  }

  if (endPage < total - 1) {
    items.push({
      type: 'ellipsis',
      marker: 'end'
    })
  }

  items.push({
    type: 'page',
    page: total
  })

  return items
})

function goToPage(page: number) {
  const safePage = Math.min(
    Math.max(page, 1),
    Math.max(totalPages.value, 1)
  )

  if (safePage === normalizedCurrentPage.value) {
    return
  }

  emit('update:currentPage', safePage)
  emit('page-change', safePage)
}

function isPageItem(
  pageItem: PageItem
): pageItem is { type: 'page'; page: number } {
  return pageItem.type === 'page'
}
</script>

<template>
  <nav
    v-if="totalPages > 1"
    class="pagination is-centered"
    role="navigation"
    :aria-label="t('pagination.navigation')"
  >
    <ul class="pagination-list">
      <li
        v-for="(pageItem, index) in pageItems"
        :key="
          pageItem.type === 'page'
            ? `page-${pageItem.page}`
            : `ellipsis-${pageItem.marker}-${index}`
        "
      >
        <span
          v-if="!isPageItem(pageItem)"
          class="pagination-ellipsis"
          aria-hidden="true"
        >
          &hellip;
        </span>

        <button
          v-else
          type="button"
          class="pagination-link"
          :class="{
            'is-current':
              pageItem.page === normalizedCurrentPage
          }"
          :aria-label="
            `${t('pagination.page')} ${pageItem.page}`
          "
          :aria-current="
            pageItem.page === normalizedCurrentPage
              ? 'page'
              : undefined
          "
          @click="goToPage(pageItem.page)"
        >
          {{ pageItem.page }}
        </button>
      </li>
    </ul>
  </nav>
</template>

<style scoped>
.pagination-link {
  color: #222;
}

.pagination-link.is-current {
  color: #fff;
}
</style>
