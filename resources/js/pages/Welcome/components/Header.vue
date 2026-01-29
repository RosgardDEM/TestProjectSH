<script setup lang="ts">
import InfoText from './InfoText.vue';
import SocialList from './SocialList.vue';
import RoundButton from './RoundButton.vue';
</script>

<template>
<header class="header">
    <div class="header__left-side">
        <img class="header__logo" src="/images/logo.svg" alt="KOMEK by ticket"/>
        <InfoText top-text="Казахстан" bottom-text="улица Тестовая 1"/>
        <InfoText top-text="+7 (775) 000 00 01" bottom-text="Касса" has-more/>
    </div>
    <div class="header__right-side">
        <SocialList/>
        <RoundButton text="Мне пришёл билет" is-active/>
    </div>
</header>
</template>

<style scoped lang="scss">
.header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-block: 24px;
    background: #123D4B;

    &__logo {
        height: 45px;
        object-fit: cover;
        user-select: none;
        pointer-events: none;
    }

    &__left-side {
        display: flex;
        align-items: center;

        & > :nth-child(2) {
            margin-left: 70px;
        }

        & > :nth-child(3) {
            margin-left: 126px;
        }
    }

    &__right-side {
        display: flex;
        column-gap: 16px;
        align-items: center;
    }

    @media screen and (max-width: 1239px) {
        &__left-side {
            & > :nth-child(2),
            & > :nth-child(3) {
                margin-left: 30px;
            }
        }
    }

    @media screen and (max-width: 1023px) {
        flex-direction: column;
        row-gap: 30px;

        &__left-side {
            width: 100%;
            display: grid;
            column-gap: 30px;
            grid-template-columns: 1fr auto auto;

            & > :nth-child(2),
            & > :nth-child(3) {
                margin-left: unset;
            }
        }

        &__right-side {
            width: 100%;
            justify-content: space-between;
        }
    }
}
</style>
