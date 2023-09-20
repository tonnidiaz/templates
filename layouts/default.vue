<template>
    <div>
        <Header/>
        <div class="tu-app">
              <Sidebar />
            <main><slot /></main>
            <Drawer class="right"/>
        </div>
        
    </div>
</template>

<script lang="ts" setup>
import Header from "@/components/Header.vue";
</script>

<style>
.nav-link.nuxt-link-exact-active.nuxt-link-active {
    color: #ff6a06 !important;
}
.adblocked {
    width: 100%;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 9999999999;
    background-color: rgba(0, 0, 0, 0.8);
    overflow: hidden;
}

.loda {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.8);
    z-index: 9999999999;
}

.fw-6 {
    font-weight: 600 !important;
}
.fw-7 {
    font-weight: 700 !important;
}
</style>
