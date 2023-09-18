// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    modules: ["@pinia/nuxt", 'nuxt-simple-sitemap'],
    image: {domains: ['res.cloudinary.com']},
    devtools: { enabled: false },
    site: {
        url: "https://tunedbass.vercel.app"
      }
})
