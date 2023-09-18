<template>
    <div>
        <div>
            <!--------------------------------------------- UTILS   ---------------------------------------------------------->

            <div id="global-overlay" class="sch blur"></div>
            <!--------------------------------------------- END UTILS   ---------------------------------------------------------->
            <div id="main-app">
                <Header />
                <div class="dflex _row _main">
                    <Sidenav />
                    <main>
                        <div class="body">
                            <div class="app">
                                <slot />
                            </div>
                        </div>

                        <Footer />
                    </main>
                </div>
            </div>

            <div id="social_bar"></div>
        </div>
    </div>
</template>

<script lang="ts" setup>
import Header from "@/components/Header.vue";
import Sidenav from "@/components/Sidenav.vue";

const route = useRoute();

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
