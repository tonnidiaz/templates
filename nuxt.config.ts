// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    modules: [
        "@pinia/nuxt",
        "nuxt-simple-sitemap",
 
    ],
    css: ['~/assets/css/tailwind.css'],
    
    postcss: {
        plugins: {
          tailwindcss: {},
          autoprefixer: {},
        },
      },
   



    devtools: { enabled: false },
    site: {
        url: "https://tunedbass.vercel.app",
    },
});
