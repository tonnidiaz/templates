<template>
    <div>
        <!-- drawer init and toggle -->
        <div class="text-center">
            <button
            @click="openDrawer"
                class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
                type="button"
            >
                Show right drawer
            </button>
        </div>
    </div>
</template>

<script setup lang="ts">
import {openDrawer} from '~/utils/funcs';
import { initFlowbite } from "flowbite";

onMounted(() => {
    initFlowbite();
});
</script>
