<template>
    <aside >
        <ul class="menu gap-5  sidebar">
   
    
   <li class="tooltip tooltip-right" data-tip="Home">
       <NuxtLink to="/">
           <i class="fa fa-home fs-20"></i>
       </NuxtLink>
   </li>
   <li class="tooltip tooltip-right" data-tip="Contact us">
       <NuxtLink to="/contact">
       <i class="fa fa-envelope fs-20"></i>
       </NuxtLink>
   </li>
   <li class="tooltip tooltip-right" data-tip="About us">
       <NuxtLink to="/about">
        <i class="fa fa-info-circle fs-20"></i>
       </NuxtLink>
   </li>
</ul>
    </aside>
</template>

<script setup lang="ts"></script>
