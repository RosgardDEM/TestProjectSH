<script setup lang="ts">
const { text, isActive } = defineProps({
    text: { type: String, default: '' },
    isActive: { type: Boolean, default: false },
})
</script>

<template>
    <button
        class="round-button"
        :class="{'round-button--active': isActive}"
    >
        {{ text }}
    </button>
</template>

<style scoped lang="scss">
.round-button {
    font-size: 14px;
    color: #000000;
    background: #FFFFFF;
    padding: 8px 16px;
    border-radius: 16px;
    outline: 1px #E7E7EC solid;
    outline-offset: -1px;
    transition: background 300ms, color 300ms;

    &:hover, &:active {
        background: #E7E7EC;
    }

    &--active {
        color: #FFFFFF;
        background: #E92B43;
        outline: unset;
        outline-offset: unset;

        &:hover, &:active {
            background: #BD2437;
        }
    }
}
</style>
