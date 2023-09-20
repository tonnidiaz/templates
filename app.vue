<template>
    <Html lang="en" class="dark">
         <NuxtLayout>
              <NuxtPage></NuxtPage>
         </NuxtLayout>
        
    </Html>
</template>
<script setup lang="ts">
import "~/src/styles/styles.scss";
import { initFlowbite } from 'flowbite'

onMounted(()=>{
    initFlowbite();
})
</script>
