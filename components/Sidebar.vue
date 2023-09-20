<template>
    <aside  class="sidebar" aria-label="Sidebar">
        <div class="content">
            <ul>
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
            </ul>
            <ul>
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
