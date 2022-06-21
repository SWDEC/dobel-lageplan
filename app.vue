<template>
  <div class="lg:mx-4 lg:my-8 my-6">
    <div class="mb-4 mx-4 flex justify-between items-center">
      <a href="https://swdec.de" target="_blank">
        <img
          class="lg:max-w-[24rem] sm:max-w-[20rem] max-w-[16rem] flex-shrink flex-1"
          src="/assets/img/logos/SWD-EC-Logo_Landesverband_RGB-offwhite_lang.png"
        />
      </a>
      <img
        class="lg:max-w-[12rem] sm:max-w-[9rem] max-w-[6rem] flex-shrink flex-1"
        src="/assets/img/logos/Logo_DELTA_weiss.png"
      />
    </div>
    <div
      class="bg-gray-800 max-w-screen-xl mx-auto lg:rounded overflow-hidden shadow-xl flex lg:flex-row flex-col"
    >
      <ModelViewer
        class="flex-1 shrink bg-gradient-to-br from-gray-800 to-slate-700 lg:min-h-[30rem] object-none w-full"
      />
      <div class="lg:py-10 lg:px-12 sm:px-8 sm:py-6 px-6 py-4 flex-1 grow">
        <h1
          class="text-white font-bold sm:text-3xl text-2xl tracking-wider uppercase"
        >
          {{ title }}
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

const title = "Dobel-Lageplan";

useHead({
  title,
});
</script>
