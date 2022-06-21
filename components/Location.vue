<template>
  <div class="flex flex-row items-center">
    <div
      class="bg-gray-700 rounded-full flex flex-shrink-0 justify-center items-center mr-6 w-[3rem] h-[3rem]"
    >
      <span class="text-white font-bold text-xl">
        {{ number }}
      </span>
    </div>
    <div>
      <h2 class="text-white font-bold text-xl tracking-wider">{{ name }}</h2>
      <p class="text-gray-200">{{ description }}</p>
    </div>
  </div>
</template>

<script setup>
const props = defineProps({
  number: {
    type: Number,
    default: null,
  },
  name: {
    type: String,
    default: "",
  },
  description: {
    type: String,
    default: "",
  },
});
</script>
