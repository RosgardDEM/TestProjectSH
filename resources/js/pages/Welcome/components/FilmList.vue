<script setup lang="ts">
import RoundButton from './RoundButton.vue';

enum Genre {
    Comedy = 'комедия',
    Action = 'экшен',
    Thriller = 'триллер',
    Fantasy = 'фентези',
    Fighting = 'боевик',
    Romance = 'мелодрама',
    Cartoon = 'мультфильм',
    AnimationAdventure = 'анимационное приключение',
}

enum AgeRating {
    SixPlus = '6+',
    TwelvePlus = '12+',
    SixteenPlus = '16+',
}

enum Hall {
    Hall1 = 'Зал 1',
    Hall2 = 'Зал 2',
    Hall3 = 'Зал 3',
    Hall4 = 'Зал 4',
    Hall5 = 'Зал 5 VIP',
    Hall6 = 'Зал 6 VIP',
}

interface SessionItem {
    date: Date
    hall: Hall
    is3D: Boolean
    price: number
}

interface FilmItem {
    id: 0
    title: string
    poster: string
    genres: Genre[]
    isPremier: Boolean
    ageRating: AgeRating | null
    sessions: SessionItem[]
}

const items: FilmItem[] = [
    {
        id: 1,
        title: 'Праздники',
        poster: '/images/poster-01.jpg',
        genres: [Genre.Comedy],
        isPremier: true,
        ageRating: AgeRating.TwelvePlus,
        sessions: [
            { date: new Date(0, 0, 0, 15, 35, 0), hall: Hall.Hall3, is3D: false, price: 1233 },
            { date: new Date(0, 0, 0, 17, 40, 0), hall: Hall.Hall6, is3D: false, price: 3080 },
            { date: new Date(0, 0, 0, 19, 15, 0), hall: Hall.Hall4, is3D: false, price: 1700 },
            { date: new Date(0, 0, 0, 21, 5, 0), hall: Hall.Hall3, is3D: false, price: 1700 },
            { date: new Date(0, 0, 0, 21, 40, 0), hall: Hall.Hall6, is3D: false, price: 4030 },
            { date: new Date(0, 0, 0, 22, 45, 0), hall: Hall.Hall3, is3D: false, price: 1700 },
        ],
    },
    {
        id: 2,
        title: 'Мег 2: Бездна',
        poster: '/images/poster-02.jpg',
        genres: [Genre.Action, Genre.Thriller],
        isPremier: false,
        ageRating: AgeRating.SixteenPlus,
        sessions: [
            { date: new Date(0, 0, 0, 15, 35, 0), hall: Hall.Hall6, is3D: false, price: 4030 },
            { date: new Date(0, 0, 0, 17, 40, 0), hall: Hall.Hall2, is3D: false, price: 3080 },
            { date: new Date(0, 0, 0, 19, 15, 0), hall: Hall.Hall4, is3D: false, price: 1700 },
        ],
    },
    {
        id: 3,
        title: 'Заложники',
        poster: '/images/poster-03.jpg',
        genres: [Genre.Action, Genre.Thriller],
        isPremier: false,
        ageRating: AgeRating.SixteenPlus,
        sessions: [
            { date: new Date(0, 0, 0, 16, 10, 0), hall: Hall.Hall1, is3D: false, price: 4030 },
            { date: new Date(0, 0, 0, 21, 30, 0), hall: Hall.Hall1, is3D: false, price: 3080 },
        ],
    },
    {
        id: 4,
        title: 'Леди Баг и Супер-Кот: Пробуждение силы',
        poster: '/images/poster-04.jpg',
        genres: [Genre.Fantasy, Genre.Fighting, Genre.Romance, Genre.Cartoon, Genre.Comedy],
        isPremier: false,
        ageRating: AgeRating.SixPlus,
        sessions: [
            { date: new Date(0, 0, 0, 16, 10, 0), hall: Hall.Hall1, is3D: false, price: 4030 },
            { date: new Date(0, 0, 0, 21, 30, 0), hall: Hall.Hall1, is3D: false, price: 3080 },
        ],
    },
    {
        id: 5,
        title: 'Когда не загрузилась афиша',
        poster: '/images/poster-05.jpg',
        genres: [Genre.Comedy],
        isPremier: true,
        ageRating: null,
        sessions: [
            { date: new Date(0, 0, 0, 15, 35, 0), hall: Hall.Hall3, is3D: false, price: 1233 },
            { date: new Date(0, 0, 0, 17, 40, 0), hall: Hall.Hall6, is3D: false, price: 3080 },
        ],
    },
    {
        id: 6,
        title: 'Руслан и Людмила. Больше, чем сказка',
        poster: '/images/poster-06.jpg',
        genres: [Genre.AnimationAdventure],
        isPremier: true,
        ageRating: AgeRating.SixPlus,
        sessions: [],
    },
]
</script>

<template>
    <div class="film-list">
        <div
            class="film-item"
            v-for="item in items"
            :key="item.id"
        >
            <div class="film-item__poster">
                <img class="film-item__image" :src="item.poster" :alt="item.title" onerror="this.style.display='none'"/>
                <span class="film-item__premier" v-if="item.isPremier">ПРЕМЬЕРА</span>
                <span class="film-item__age-rating" v-if="item.ageRating">{{ item.ageRating }}</span>
            </div>
            <h2 class="film-item__title">
                {{ item.title }}
            </h2>
            <ul class="film-item__genre-list">
               <li
                   class="film-item__genre-item"
                   v-for="genre in item.genres"
                   :key="genre"
               >
                   {{ genre }}
               </li>
            </ul>
            <ul
                class="film-item__sessions"
                v-if="item.sessions.length"
            >
                <li
                    class="film-session"
                    v-for="(session, index) in item.sessions"
                    :key="index"
                >
                    <div class="film-session__button" role="button">
                        <p class="film-session__time">
                            {{ session.date.toLocaleTimeString('ru-RU', {
                                hour: '2-digit',
                                minute: '2-digit'
                            }) }}
                        </p>
                        <p class="film-session__info">
                            <span>{{ session.is3D ? '3D' : '2D' }}</span>
                            <span>&nbsp;{{ session.price }} ₸</span>
                        </p>
                    </div>
                    <span class="film-session__hall">{{ session.hall }}</span>
                </li>
            </ul>
            <button
                class="film-item__tomorrow"
                v-if="!item.sessions.length"
            >
                Сеансы на Завтра
            </button>
        </div>
    </div>
</template>

<style scoped lang="scss">
.film-list {
    background: #FFFFFF;
    padding-block: 20px 100px;
    display: flex;
    flex-wrap: wrap;
    column-gap: 25px;
    row-gap: 35px;

    @media screen and (max-width: 1023px) {
        justify-content: center;
    }
}

.film-item {
    width: 265px;

    &__poster {
        width: 265px;
        height: 384px;
        background: #123D4B;
        position: relative;

        @media (hover: hover) {
            transition: transform 300ms, box-shadow 300ms;

            &:hover {
                transform: scale(1.05);
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            }
        }
    }

    &__poster::before {
        content: '';
        position: absolute;
        width: 100%;
        height: 100%;
        background: url("/images/broken-image.svg") no-repeat center;
    }

    &__image {
        position: absolute;
        object-fit: cover;
        user-select: none;
        pointer-events: none;
        width: 100%;
        height: 100%;
    }

    &__premier {
        position: absolute;
        background: #E92B43;
        color: #FFFFFF;
        font-size: 14px;
        padding: 4px 8px;
        top: 8px;
        right: 8px;
    }

    &__age-rating {
        position: absolute;
        background: #12344B;
        color: #FFFFFF;
        font-size: 16px;
        padding: 6px 8px;
        left: 8px;
        bottom: 8px;
    }

    &__title {
        font-size: 24px;
        margin-top: 10px;
    }

    &__genre-list {
        display: flex;
        flex-wrap: wrap;
        row-gap: 7px;
        column-gap: 7px;
        margin-top: 10px;
    }

    &__genre-item {
        font-size: 12px;
        color: #727276;
        padding: 3px 4px;
        background: #F2F2F5;
        border-radius: 3px;
    }

    &__sessions {
        display: flex;
        row-gap: 20px;
        column-gap: 10px;
        margin-top: 20px;
        flex-wrap: wrap;
    }

    &__tomorrow {
        font-size: 14px;
        border-radius: 5px;
        padding: 8px 16px;
        color: #FFFFFF;
        background: #E92B43;
        font-weight: 500;
        margin-top: 20px;
    }
}

.film-session {
    &__button {
        border-radius: 3px;
        overflow: hidden;
        outline: 1px var(--color) solid;
        outline-offset: -1px;
        text-align: center;
        cursor: pointer;
        transition: outline 300ms;

        --color: #E92B43;

        &:hover, &:active {
            --color: #BD2437;
        }
    }

    &__time {
        background: var(--color);
        color: #FFFFFF;
        font-weight: 500;
        font-size: 15px;
        padding: 7px 14px;
        transition: background 300ms;
    }

    &__info {
        font-size: 11px;
        color: #4C4C4F;
        display: flex;
        justify-content: space-between;
        padding: 3px 5px;
    }

    &__hall {
        font-size: 10px;
        display: block;
        text-align: center;
        margin-top: 3px;
        color: #4C4C4F;
    }
}
</style>
