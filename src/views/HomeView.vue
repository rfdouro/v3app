<template>
 <main>

  <button @click="teste">TESTE</button>
 </main>
</template>

<script setup>
import TheWelcome from "../components/TheWelcome.vue";

function teste() {
 alert(123);
}
</script>
