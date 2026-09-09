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

  // Poucas páginas: mostra todas
  if (total <= max) {
    return Array.from({ length: total }, (_, index) => ({
      type: 'page' as const,
      page: index + 1
    }))
  }

  const items: PageItem[] = []

  // Sempre mostra a primeira página
  items.push({
    type: 'page',
    page: 1
  })

  /*
   * Define quantas páginas podem aparecer
   * ao redor da página atual.
   */
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

  // Reticências depois da primeira página
  if (startPage > 2) {
    items.push({
      type: 'ellipsis',
      marker: 'start'
    })
  }

  // Páginas intermediárias
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

  // Reticências antes da última página
  if (endPage < total - 1) {
    items.push({
      type: 'ellipsis',
      marker: 'end'
    })
  }

  // Sempre mostra a última página
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
    <!-- Controles anteriores -->
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

    <!-- Páginas -->
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

    <!-- Controles seguintes -->
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

/* Controles da esquerda */
.pagination-controls-left {
  grid-area: left;
  display: flex;
  align-items: center;
  justify-content: flex-start;
  gap: 0.5rem;
}

/* Lista de páginas */
.pagination-list {
  grid-area: pages;

  display: flex;
  align-items: center;
  justify-content: center;

  gap: 0.35rem;
  margin: 0;
  padding: 0;

  /*
   * Impede o Bulma de alterar a posição
   * da lista dentro do nosso grid.
   */
  order: unset;
}

/* Controles da direita */
.pagination-controls-right {
  grid-area: right;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 0.5rem;
}

.pagination-link,
.pagination-button {
  min-width: 2.5rem;
  min-height: 2.5rem;
}

.pagination-link {
  margin: 0;
}

.pagination-ellipsis {
  min-width: 2.5rem;
  min-height: 2.5rem;

  display: inline-flex;
  align-items: center;
  justify-content: center;
}

/* Botões */
.pagination-button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 0.35rem;
}

/* Mobile */
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
  }

  .pagination-link,
  .pagination-button,
  .pagination-ellipsis {
    min-width: 2.25rem;
    min-height: 2.25rem;
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
</style>
