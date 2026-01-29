<script setup lang="ts">
interface MenuItem {
    title: string
    url: string
}

const menuLinks: MenuItem[] = [
    { title: 'Афиша', url: '#' },
    { title: 'Сеансы', url: '#' },
    { title: 'Пушкинская карта', url: '#' },
    { title: 'Кинотеатр', url: '#' },
    { title: 'Контакты', url: '#' },
]
</script>

<template>
<div class="footer">
    <div class="footer-menu">
        <h3 class="footer-menu__title">
            Меню
        </h3>
        <ul class="footer-menu__list">
            <li
              v-for="link in menuLinks"
              class="footer-menu__item"
            >
                <a
                    :href="link.url"
                    class="footer-menu__link"
                >
                    {{ link.title }}
                </a>
            </li>
        </ul>
    </div>
    <div class="footer-pay-methods">
        <h3 class="footer-pay-methods__title">Способы оплаты:</h3>
        <img class="footer-pay-methods__image" style="width: 50px" src="/images/pay-mastercard.svg" alt="MasterCard"/>
        <img class="footer-pay-methods__image" style="width: 60px" src="/images/pay-visa.svg" alt="Visa"/>
    </div>
    <p class="footer__info">
        Все сеансы начинаются с рекламно-информационного блока.<br/>
        Точную продолжительность сеансов можно уточнить в кинотеатре.
    </p>
</div>
</template>

<style scoped lang="scss">
.footer {
    background: #0C3542;
    padding-block: 28px 20px;
    display: grid;
    row-gap: 54px;
    column-gap: 180px;
    grid-template-rows: repeat(2, auto);
    grid-template-columns: repeat(2, 1fr);

    &__info {
        color: #A0AEB7;
        font-size: 13px;
    }

    @media screen and (max-width: 1023px) {
        row-gap: 20px;
        column-gap: 30px;
    }
}

.footer-menu {
    width: fit-content;
    grid-row: 1 / 3;

    &__title {
        color: #FFFFFF;
        font-size: 16px;
    }

    &__list {
        display: flex;
        flex-direction: column;
        margin-top: 14px;
    }

    &__item {
        color: #A0AEB7;
        font-size: 16px;
        transition: color 300ms;

        &:hover, &:active {
            color: #FFFFFF;
        }
    }

    &__link {
        color: inherit;
        display: block;
        padding-block: 3px 2px;
    }
}

.footer-pay-methods {
    display: grid;
    width: fit-content;
    height: fit-content;
    row-gap: 7px;
    column-gap: 20px;
    align-items: center;
    grid-template-rows: repeat(2, auto);
    grid-template-columns: repeat(2, auto);

    &__title {
        color: #FFFFFF;
        font-size: 16px;
        grid-column: 1 / 3;
    }

    &__image {
        aspect-ratio: 1/1;
        object-fit: contain;
    }
}
</style>
