<script setup lang="ts">
const { url } = defineProps({
    url: { type: String, default: null },
})
</script>

<template>
    <div class="top-banner">
        <img
            class="top-banner__image"
            onerror="this.style.display='none'"
            v-if="url"
            :src="url"
            alt=""
        />
    </div>
</template>

<style scoped lang="scss">
.top-banner {
    position: relative;
    aspect-ratio: 1240 / 380;

    &__image {
        position: absolute;
        object-fit: cover;
        height: 100%;
        width: 100%;
        top: 0;
        left: 0;
    }
}
</style>
