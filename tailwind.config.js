/** @type {import('tailwindcss').Config} */
export default {
    content: [
        "./components/**/*.{js,vue,ts}",
        "./layouts/**/*.vue",
        "./pages/**/*.vue",
        "./plugins/**/*.{js,ts}",
        "./app.vue",
    ],
    theme: {
        extend: {},
       
    },

    darkMode: true,
    daisyui: {
        themes: [
            {
                tb: {
                    primary: "#ffa500",
                    secondary: "#f6d860",
                    accent: "#ecb847",
                    neutral: "#3d4451",
                    dark: '#292828',
                    "base-100": "#010101",
                },
            },
            "dark",
            "halloween",
            "forest",
            "black",
            "business",
            "night",
            "dracula",
        ],
    },
    plugins: [require("daisyui")],
};
