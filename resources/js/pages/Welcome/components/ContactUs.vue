<script setup lang="ts">
import InfoText from './InfoText.vue';
</script>

<template>
<div class="contact-us">
    <img class="contact-us__logo" src="/images/logo.svg" alt="KOMEK by ticket"/>
    <InfoText :top-text="['admin@example.com', 'ticket@example.com']" bottom-text="улица Тестовая 1"/>
    <InfoText top-text="+7 (775) 000 00 01" bottom-text="Касса" has-more/>
    <InfoText top-text="08:00 - 22:00 с пн.-пт." bottom-text="График работы"/>
</div>
</template>

<style scoped lang="scss">
.contact-us {
    background: #123D4B;
    padding-block: 24px 30px;
    display: flex;
    justify-content: space-between;

    &__logo {
        height: 45px;
        object-fit: cover;
        user-select: none;
        pointer-events: none;
    }

    @media screen and (max-width: 1023px) {
        flex-wrap: wrap;
        column-gap: 20px;
        row-gap: 20px;
    }
}
</style>
