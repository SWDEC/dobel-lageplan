<template>
  <canvas ref="canvas" class="focus-visible:outline-none" id="renderCanvas"></canvas>
</template>

<script setup>
import * as BABYLON from "babylonjs";
import "babylonjs-loaders";

const canvas = ref();

onMounted(() => {
  // Load the 3D engine
  var engine = new BABYLON.Engine(canvas.value, true, {
    preserveDrawingBuffer: true,
    stencil: true,
  });
  // CreateScene function that creates and return the scene
  var createScene = function () {
    // Create a basic BJS Scene object
    var scene = new BABYLON.Scene(engine);
    // Create an Orbit Camera
    var camera = new BABYLON.ArcRotateCamera(
      "camera1",
      3,
      1,
      100,
      new BABYLON.Vector3(-40, 0, 0),
      scene
    );
    // Attach the camera to the canvas
    camera.attachControl(canvas.value, false);
    camera.panningSensibility = 30;
    // Create a basic light, aiming 0, 1, 0 - meaning, to the sky
    var light = new BABYLON.HemisphericLight("light1", new BABYLON.Vector3(0, 1, 0), scene);
    // ambient occlusion
    var ssao = new BABYLON.SSAORenderingPipeline('ssaopipeline', scene, 0.95, [camera]);
    // Return the created scene
    return scene;
  };
  // call the createScene function
  var scene = createScene();
  // Make background transparent
  scene.clearColor = new BABYLON.Color4(0, 0, 0, 0);
  // load gltf model
  BABYLON.SceneLoader.ImportMeshAsync("root", "/assets/3d/", "Dobel_Delta.gltf");
  // run the render loop
  engine.runRenderLoop(function () {
    scene.render();
  });
  // the canvas/window resize event handler
  window.addEventListener("resize", function () {
    engine.resize();
  });
});
</script>
