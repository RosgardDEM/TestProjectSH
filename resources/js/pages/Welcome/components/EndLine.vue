<script setup lang="ts">
import SocialList from './SocialList.vue'
</script>

<template>
    <div class="end-line">
        <SocialList/>
        <span class="end-line__copyright">
            © {{ (new Date).getFullYear() }} Все права защищены
        </span>
    </div>
</template>

<style scoped lang="scss">
.end-line {
    background: #0C3542;
    padding-block: 20px 23px;
    border-top: 1px rgba(#A0AEB7, 0.3) solid;
    display: flex;
    align-items: center;
    justify-content: space-between;

    &__copyright {
        color: #A0AEB7;
        font-size: 14px;
    }
}
</style>
