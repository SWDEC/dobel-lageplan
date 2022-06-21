<template>
  <canvas ref="canvas" class="focus-visible:outline-none" id="renderCanvas"></canvas>
</template>

<script setup>
// import babylonjsPkg from "babylonjs";
// const {
//   Engine,
//   Color4,
//   SceneLoader,
//   Scene,
//   ArcRotateCamera,
//   Vector3,
//   HemisphericLight,
//   SSAORenderingPipeline
// } = babylonjsPkg;
import {
  Engine,
  Color4,
  SceneLoader,
  Scene,
  ArcRotateCamera,
  Vector3,
  HemisphericLight,
  SSAORenderingPipeline
} from "babylonjs";
import "babylonjs-loaders";

const canvas = ref();

onMounted(() => {
  // Load the 3D engine
  var engine = new Engine(canvas.value, true, {
    preserveDrawingBuffer: true,
    stencil: true,
  });
  // CreateScene function that creates and return the scene
  var createScene = function () {
    // Create a basic BJS Scene object
    var scene = new Scene(engine);
    // Create an Orbit Camera
    var camera = new ArcRotateCamera(
      "camera1",
      3,
      1,
      100,
      new Vector3(-40, 0, 0),
      scene
    );
    // Attach the camera to the canvas
    camera.attachControl(canvas.value, false);
    camera.panningSensibility = 30;
    // Create a basic light, aiming 0, 1, 0 - meaning, to the sky
    var light = new HemisphericLight("light1", new Vector3(0, 1, 0), scene);
    // ambient occlusion
    var ssao = new SSAORenderingPipeline('ssaopipeline', scene, 0.95, [camera]);
    // Return the created scene
    return scene;
  };
  // call the createScene function
  var scene = createScene();
  // Make background transparent
  scene.clearColor = new Color4(0, 0, 0, 0);
  // load gltf model
  SceneLoader.ImportMeshAsync("root", "/assets/3d/", "Dobel_Delta.gltf");
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
