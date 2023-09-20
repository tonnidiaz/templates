<template>
    <header>
        <nav class="">
            <div
                class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4"
            >
                <a href="/" class="flex items-center">
                    
                    <span
                        class="txt-brand"
                        >{{SITE}}</span
                    >
                </a>
                <button
                    type="button"
                    @click="openDrawer"
                    class="inline-flex items-center p-2 w-30 h-30 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                    aria-expanded="false"
                >
                    <span class="sr-only">Open main menu</span>
                    <span>
                        <i class="material-icons">menu</i>
                    </span>
                </button>
                <div
                    class="hidden w-full md:block md:w-auto"
                    id="navbar-default"
                >
                    <ul
                        class="flex flex-col p-4 md:p-0 mt-4 rounded-lg md:flex-row md:space-x-8 md:mt-0 md:border-0  dark:border-gray-700"
                    >
                        <li>
                            <NuxtLink to="/">Home</NuxtLink>
                        </li>
                        <li>
                            <NuxtLink to="/contact">Contact</NuxtLink>
                        </li>
        
                        <li>
                            <NuxtLink to="/about">About</NuxtLink>
                        </li>
        
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <!--   <div>
        <header class="fixed top-0 z-50 w-full bg-white border-b border-gray-200 dark:bg-gray-800 dark:border-gray-700">
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="d-flex">
                    <button
                        class="navbar-toggler" 
                        type="button"
                        data-toggle="collapse"
                        data-target="#navbarNav"
                        aria-controls="navbarNav"
                        aria-expanded="false"
                        @click="openSideMenu"
                        style="position: relative; left: -10px"
                    >
                        <span class="fs-20">
                            <i class="material-icons">menu</i>
                        </span>
                    </button>
                </div>
                <a class="navbar-brand" href="/"
                    ><span>T </span><span><i class="material-icons">tune</i></span> <span> B</span></a
                >
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <NuxtLink class="nav-link" to="/"
                                >Home</NuxtLink
                            >
                        </li>
                   
                        <li class="nav-item">
                            <NuxtLink class="nav-link" to="/contact"
                                >Contact us</NuxtLink
                            >
                        </li>
                    </ul>
                </div>
                <div class="navbar-nav">
                    <div
                        class="nav-item"
                        style="margin-left: 0px; margin-right: 0px"
                    >
                        
                    </div>
                </div>
            </nav>
        </header>
        <SideMenu />
    </div> -->
</template>

<script setup lang="ts">
import { openDrawer } from "~/utils/funcs";
import SideMenu from "./SideMenu.vue";
import $ from "jquery";

function openSideMenu() {
    const menu = $(".sidemenu"),
        blur = $(".blur");
    if (menu.hasClass("open")) {
        menu.removeClass("open");
        blur.removeClass("active");
    } else {
        menu.addClass("open");
        blur.addClass("active");
    }
    const closeMenu = (e: any) => {
        if (!menu[0].contains(e.target)) {
            menu.removeClass("open");
            $(".blur").removeClass("active");
            document.body.removeEventListener("click", closeMenu);
        }
    };
    console.log(blur);
    blur[0]?.addEventListener("click", closeMenu);
    blur[1]?.addEventListener("click", closeMenu);
}
</script>
