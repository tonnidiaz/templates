<template>
    <aside  class="sidebar" aria-label="Sidebar">
        <div class="content">
            <ul class="gap-10">
                <li class="bar-item group">
                    <NuxtLink to="/">
                        <span>
                            <i class="material-icons">home</i>
                        </span>
                    </NuxtLink>
                </li>
                <li class="bar-item group">
                    <NuxtLink to="/contact">
                        <span>
                            <i class="material-icons">email</i>
                        </span>
                    </NuxtLink>
                </li>
                <li class="bar-item ">
                    <NuxtLink to="/forms">
                        <i class="material-icons">article</i>
                    </NuxtLink>
                </li>
            </ul>
            <ul class="hide-sm">
                <li class="bar-item group">
                    <NuxtLink to="/about">
                        <span>
                            <i class="material-icons">info</i>
                        </span>
                    </NuxtLink>
                </li>
            </ul>
        </div>
    </aside>
</template>

<script setup lang="ts"></script>
