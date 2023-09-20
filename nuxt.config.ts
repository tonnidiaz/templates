// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    modules: [
        "@pinia/nuxt",
        "nuxt-simple-sitemap",
        "@nuxtjs/tailwindcss",
        "@nuxtjs/color-mode",
    ],
    colorMode: {
        classSuffix: "",
        preference: 'dark',
        fallback: 'dark'
    },

    devtools: { enabled: false },
    site: {
        url: "https://tunedbass.vercel.app",
    },
});
