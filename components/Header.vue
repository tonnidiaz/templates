<template>
    <div>
        <header>
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
    </div>
</template>

<script setup lang="ts">
import SideMenu from "./SideMenu.vue";
import $ from 'jquery';

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
