<script setup lang="ts">
import { Head } from '@inertiajs/vue3';
import TopBanner from './components/TopBanner.vue';
import Header from './components/Header.vue';
import Navigation from './components/Navigation.vue';
import DatePicker from './components/DatePicker.vue';
import FilmList from './components/FilmList.vue';
import ContactUs from './components/ContactUs.vue';
import Footer from './components/Footer.vue';
import EndLine from './components/EndLine.vue';
</script>

<template>
    <Head title="Афиша"/>
    <div class="container">
        <TopBanner url="/images/top-banner.jpg"/>
        <Header/>
        <nav class="container">
            <Navigation/>
            <DatePicker/>
        </nav>
        <main class="container">
            <FilmList/>
        </main>
        <footer class="container">
            <ContactUs/>
            <Footer/>
            <EndLine/>
        </footer>
    </div>
</template>

<style scoped lang="scss">
.container {
    width: 1240px;
    margin-inline: auto;
    position: relative;

    & > :not(.container) {
        padding-inline: 50px;
    }

    @media screen and (max-width: 1239px) {
        width: min(1024px, 100%);
        min-width: 596px;
    }
}
</style>
