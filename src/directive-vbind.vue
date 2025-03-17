<template>
    <h1>{{ title }}</h1>
    <a v-bind:href="link" :style="{ color: textColor, fontSize: textSize }" target="_blank">Click 1</a><br>
    <a :href="link" target="_blank" :title="tooltiptitle">Click 2</a><br>
    <img :src="imageSrc" alt="Gambar Logo Vue">
</template>

<script>
    export default {
        data() {
            return {
                title: "v-bind:href dengan vue template",
                link: "https://www.detik.com",
                imageSrc: "https://vuejs.org/images/logo.png",
                tooltiptitle: "Tekan Tobol Ini",
                textColor: "blue",
                textSize: "30px",
            }
        }
    }
</script>

<style>
    * {
        text-align: center;
    }
</style>