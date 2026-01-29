<script setup lang="ts">
import FacebookIcon from '@/icons/social-facebook.svg?raw'
import InstagramIcon from '@/icons/social-instagram.svg?raw'
import YouTubeIcon from '@/icons/social-youtube.svg?raw'
import VKIcon from '@/icons/social-vkontakte.svg?raw'

interface SocialItem {
    url: string
    name: string
    icon: string
}

const socials: SocialItem[] = [
    { url: '#', name: 'Facebook', icon: FacebookIcon },
    { url: '#', name: 'Instagram', icon: InstagramIcon },
    { url: '#', name: 'YouTube', icon: YouTubeIcon },
    { url: '#', name: 'VK', icon: VKIcon },
]
</script>

<template>
    <ul class="socials">
       <li
           v-for="social in socials"
           :key="social.name"
           class="socials__item"
       >
           <a
               rel="nofollow"
               :href="social.url"
               v-html="social.icon"
               class="socials__icon"
           />
       </li>
    </ul>
</template>

<style scoped lang="scss">
.socials {
    display: flex;
    column-gap: 16px;

    &__item {
        width: 32px;
        aspect-ratio: 1/1;
    }

    &__icon {
        width: 100%;
        height: 100%;
        display: block;
        color: #A0AEB7;
        transition: color 300ms;

        &:hover, &:active {
            color: #FFFFFF;
        }
    }
}
</style>
