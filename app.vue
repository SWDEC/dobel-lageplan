<template>
  <div class="lg:mx-4">
    <div
      class="bg-gray-800 max-w-screen-xl mx-auto lg:my-8 lg:rounded overflow-hidden lg:shadow-xl flex lg:flex-row flex-col"
    >
      <ModelViewer
        class="flex-1 shrink bg-gradient-to-br from-gray-800 to-slate-700 lg:min-h-[30rem] object-none w-full"
      />
      <div class="lg:py-10 lg:px-12 sm:px-8 sm:py-6 px-6 py-4 flex-1 grow">
        <h1
          class="text-white font-bold sm:text-3xl text-2xl tracking-wider uppercase"
        >
          Dobel - Was wo?
        </h1>
        <Location
          v-for="(location, index) in locations"
          :key="location.name"
          class="mt-8"
          :number="index + 1"
          :name="location.name"
          :description="location.description"
        />
      </div>
    </div>
  </div>
</template>

<script setup>
import "@/assets/index.scss";
import Location from "@/components/Location";
import { locations } from "@/assets/locations.json";

useHead({
  title: "Dobel - Was wo?",
});
</script>
