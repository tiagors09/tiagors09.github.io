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

const hasPrevious = computed(
  () => normalizedCurrentPage.value > 1
)

const hasNext = computed(
  () => normalizedCurrentPage.value < totalPages.value
)

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

  for (
    let page = startPage;
    page <= endPage;
    page++
  ) {
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
    class="pagination-wrapper"
    :aria-label="t('pagination.navigation')"
  >
    <div class="pagination-controls pagination-controls-left">
      <button
        type="button"
        class="button pagination-button"
        :disabled="!hasPrevious"
        :aria-label="t('pagination.first')"
        @click="goToPage(1)"
      >
        <span class="icon">
          <i
            class="fa-solid fa-angles-left"
            aria-hidden="true"
          ></i>
        </span>

        <span class="button-label">
          {{ t('pagination.first') }}
        </span>
      </button>

      <button
        type="button"
        class="button pagination-button"
        :disabled="!hasPrevious"
        :aria-label="t('pagination.previous')"
        @click="goToPage(normalizedCurrentPage - 1)"
      >
        <span class="icon">
          <i
            class="fa-solid fa-angle-left"
            aria-hidden="true"
          ></i>
        </span>

        <span class="button-label">
          {{ t('pagination.previous') }}
        </span>
      </button>
    </div>

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
          :aria-label="`${t('pagination.page')} ${pageItem.page}`"
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

    <div class="pagination-controls pagination-controls-right">
      <button
        type="button"
        class="button pagination-button"
        :disabled="!hasNext"
        :aria-label="t('pagination.next')"
        @click="goToPage(normalizedCurrentPage + 1)"
      >
        <span class="button-label">
          {{ t('pagination.next') }}
        </span>

        <span class="icon">
          <i
            class="fa-solid fa-angle-right"
            aria-hidden="true"
          ></i>
        </span>
      </button>

      <button
        type="button"
        class="button pagination-button"
        :disabled="!hasNext"
        :aria-label="t('pagination.last')"
        @click="goToPage(totalPages)"
      >
        <span class="button-label">
          {{ t('pagination.last') }}
        </span>

        <span class="icon">
          <i
            class="fa-solid fa-angles-right"
            aria-hidden="true"
          ></i>
        </span>
      </button>
    </div>
  </nav>
</template>

<style scoped>
.pagination-wrapper {
  width: 100%;
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  grid-template-areas: "left pages right";
  align-items: center;
  gap: 1rem;
  margin-top: 2rem;
}

.pagination-controls-left {
  grid-area: left;
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 0.5rem;
}

.pagination-controls-right {
  grid-area: right;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 0.5rem;
}

.pagination-list {
  grid-area: pages;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.35rem;
  margin: 0;
  padding: 0;
  list-style: none;
  order: unset;
}

.pagination-link,
.pagination-button {
  min-width: 2.5rem;
  min-height: 2.5rem;
  box-sizing: border-box;
  border-radius: 0.5rem;

  transition:
    background-color 0.15s ease,
    border-color 0.15s ease,
    color 0.15s ease,
    box-shadow 0.15s ease,
    opacity 0.15s ease;
}

.pagination-link {
  margin: 0;
  padding: 0.5rem 0.75rem;

  display: inline-flex;
  align-items: center;
  justify-content: center;

  border: 1px solid #dbdbdb;
  background-color: #ffffff;
  color: #363636;

  cursor: pointer;
}

.pagination-link:hover:not(.is-current) {
  background-color: #f5f5f5;
  border-color: #b5b5b5;
  color: #363636;
}

.pagination-link.is-current {
  background-color: #485fc7;
  border-color: #485fc7;
  color: #ffffff;
  font-weight: 600;
  cursor: default;
}

.pagination-link:focus-visible,
.pagination-button:focus-visible {
  outline: 2px solid #485fc7;
  outline-offset: 2px;
}

.pagination-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.35rem;

  padding: 0.5rem 0.75rem;

  border: 1px solid #dbdbdb;
  background-color: #ffffff;
  color: #363636;

  cursor: pointer;
}

.pagination-button:hover:not(:disabled) {
  background-color: #f5f5f5;
  border-color: #b5b5b5;
  color: #363636;
}

.pagination-button:disabled {
  opacity: 0.45;
  cursor: not-allowed;
  background-color: #f5f5f5;
  border-color: #e5e5e5;
  color: #7a7a7a;
}

.pagination-button .icon {
  margin: 0;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

.pagination-ellipsis {
  min-width: 2.5rem;
  min-height: 2.5rem;

  display: inline-flex;
  align-items: center;
  justify-content: center;

  color: #7a7a7a;
  user-select: none;
}

@media (prefers-color-scheme: dark) {
  .pagination-link,
  .pagination-button {
    border-color: #4a4a4a;
    background-color: #242424;
    color: #f5f5f5;
  }

  .pagination-link:hover:not(.is-current),
  .pagination-button:hover:not(:disabled) {
    background-color: #363636;
    border-color: #5a5a5a;
    color: #ffffff;
  }

  .pagination-link.is-current {
    background-color: #485fc7;
    border-color: #485fc7;
    color: #ffffff;
  }

  .pagination-button:disabled {
    background-color: #303030;
    border-color: #404040;
    color: #888888;
  }

  .pagination-ellipsis {
    color: #a0a0a0;
  }
}

@media screen and (max-width: 768px) {
  .pagination-wrapper {
    grid-template-columns: auto 1fr auto;
    grid-template-areas: "left pages right";
    gap: 0.5rem;
  }

  .pagination-controls-left,
  .pagination-controls-right {
    gap: 0.25rem;
  }

  .pagination-list {
    gap: 0.15rem;
    flex-wrap: nowrap;
    min-width: 0;
  }

  .pagination-link,
  .pagination-button,
  .pagination-ellipsis {
    min-width: 2.25rem;
    min-height: 2.25rem;
  }

  .pagination-link {
    padding: 0.4rem 0.5rem;
  }

  .pagination-button {
    padding: 0;
    width: 2.5rem;
  }

  .button-label {
    display: none;
  }

  .pagination-button .icon {
    margin: 0;
  }
}

@media screen and (max-width: 480px) {
  .pagination-wrapper {
    gap: 0.25rem;
  }

  .pagination-list {
    gap: 0.1rem;
  }

  .pagination-link,
  .pagination-ellipsis {
    min-width: 2rem;
    min-height: 2rem;
  }

  .pagination-button {
    width: 2.25rem;
    min-width: 2.25rem;
    min-height: 2.25rem;
  }
}
</style>
