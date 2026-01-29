<script setup lang="ts">
import { ref } from 'vue';
import RoundButton from './RoundButton.vue';

interface NavigationItem {
    title: string
}

const items: NavigationItem[] = [
    { title: 'Афиша' },
    { title: 'Сеансы' },
    { title: 'Кинотеатр' },
    { title: 'Контакты' },
]

const activeIndex = ref(0)
const setActiveIndex = (index: number) => { activeIndex.value = index }
</script>

<template>
    <div class="navigation">
        <ul class="navigation__list">
            <li
                v-for="(item, index) in items"
                :key="item.title"
                class="navigation-item"
                :class="{'navigation-item--active': index === activeIndex}"
            >
                <button
                    @click="setActiveIndex(index)"
                    class="navigation-item__button"
                >
                    {{ item.title }}
                </button>
            </li>
        </ul>
        <div class="navigation__buttons">
            <RoundButton text="Войти" is-active/>
            <RoundButton text="Написать отзыв" is-active/>
        </div>
    </div>
</template>

<style scoped lang="scss">
.navigation {
    display: flex;
    align-items: center;
    background: #FFFFFF;

    &__list {
        display: flex;
        column-gap: 12px;
        align-items: center;
    }

    &__buttons {
        display: flex;
        column-gap: 32px;
        align-items: center;
        margin-left: 22px;
    }

    @media screen and (max-width: 1023px) {
        flex-direction: column-reverse;
        align-items: flex-start;

        &__buttons {
            margin-block: 10px;
            margin-left: unset;
        }
    }
}

.navigation-item {
    height: 48px;
    font-size: 14px;
    overflow: hidden;
    position: relative;
    transition: background 300ms;

    &:hover, &:active {
        background: #E7E7EC;
    }

    &::after {
        content: '';
        position: absolute;
        background: #FF0000;
        width: 100%;
        height: 3px;
        left: 0;
        bottom: -3.5px;
        pointer-events: none;
        transition: bottom 300ms;
    }

    &--active::after {
        bottom: 0;
    }

    &__button {
        width: 100%;
        height: 100%;
        padding-inline: 10px;
    }
}
</style>
