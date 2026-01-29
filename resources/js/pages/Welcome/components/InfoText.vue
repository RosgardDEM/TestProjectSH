<script setup lang="ts">
import AngleIcon from '@/icons/angle.svg?raw'

const { topText, bottomText, hasMore } = defineProps({
    topText: { type: String, default: '' },
    bottomText: { type: String, default: '' },
    hasMore: { type: Boolean, default: false },
})

const topTextArray = [topText].flat(1)
</script>

<template>
    <div class="info-text">
    <div :class="{
        'info-text__first-line': true,
        'info-text__first-line--hover': hasMore,
    }">
        <p class="info-text__first-line-container">
            <span v-for="(line, index) in topTextArray" :key="index">
                {{ line }}
            </span>
        </p>
        <div
            v-if="hasMore"
            v-html="AngleIcon"
            class="info-text__first-line-angle"
        />
    </div>
    <span class="info-text__last-line">
        {{ bottomText }}
    </span>
    </div>
</template>

<style scoped lang="scss">
.info-text {
    display: flex;
    flex-direction: column;
    row-gap: 2px;

    &__first-line {
        color: #FFFFFF;
        font-size: 16px;

        display: flex;
        column-gap: 4px;
        align-items: center;

        &--hover {
            cursor: pointer;
        }
    }

    &__first-line-angle {
        color: #A0AEB7;
        transition: color 300ms;
    }

    &__first-line:hover > &__first-line-angle,
    &__first-line:active > &__first-line-angle {
        color: #FFFFFF;
    }

    &__first-line-container {
        display: flex;
        flex-direction: column;
    }

    &__last-line {
        color: #A0AEB7;
        font-size: 13px;
    }
}
</style>
