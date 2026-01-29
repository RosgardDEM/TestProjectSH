<script setup lang="ts">
import { ref } from 'vue';
import RoundButton from './RoundButton.vue';

class DateMapper {
    static _days = [
        'Воскресенье',
        'Понедельник',
        'Вторник',
        'Среда',
        'Четверг',
        'Пятница',
        'Суббота',
    ]
    static _months = [
        'янв.', 'фев.', 'март', 'апр.',
        'май', 'июнь', 'июль', 'авг.',
        'сент.', 'окт.', 'нояб.', 'дек.',
    ]
    static toString = (date: Date) => {
        const day = this._days[date.getDay()]
        const month = this._months[date.getMonth()]
        return `${day}, ${date.getDate()} ${month}`
    }
}

interface DateItem {
    date: string
    title: string
}

const items: DateItem[] = (
    [...new Array(6)].map((_, index) => {
        const date = new Date
        date.setDate(date.getDate() + index)

        const title = (() => {
            if (index === 0) return 'Сегодня'
            if (index === 1) return 'Завтра'
            return DateMapper.toString(date)
        })()

        return { date, title }
    })
)

const activeIndex = ref(0)
const setActiveIndex = (index: number) => { activeIndex.value = index }
</script>

<template>
    <div class="date-picker">
        <ul class="date-picker__list">
            <li
                v-for="(item, index) in items"
                :key="item.title"
            >
                <RoundButton
                    @click="setActiveIndex(index)"
                    :text="item.title"
                    :is-active="index === activeIndex"
                />
            </li>
        </ul>
    </div>
</template>

<style scoped lang="scss">
.date-picker {
    padding-block: 8px;
    background: #F2F2F5;

    &__list {
        display: flex;
        flex-wrap: wrap;
        row-gap: 6px;
        column-gap: 6px;
    }
}
</style>
