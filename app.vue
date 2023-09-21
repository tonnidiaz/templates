<template>
    <Html lang="en" class="dark" data-theme="tb">
        <TMeta/>
        <NuxtLayout>

            <NuxtPage></NuxtPage>
        </NuxtLayout> 
    </Html>
</template> 
<script setup lang="ts">
import "~/src/styles/daisyui.scss";

useHead({
    link: [{
        rel: 'stylesheet',
        href: '/assets/fa/fa.css'
    }]
});
</script>
