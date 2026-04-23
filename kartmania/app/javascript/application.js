// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import '@fortawesome/fontawesome-free/js/all.js';
//import { animate, stagger } from "animejs"
//
//const initStaggerText = () => {
//  // Selecciona TODOS los elementos con la clase
//  const elements = document.querySelectorAll(".stagger-text");
//  console.log("elementos encontrados:", elements.length)
//
//  if (!elements.length) return;
//
//  // Itera sobre cada uno
//  elements.forEach(el => {
//    el.innerHTML = el.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
//  });
//
//  animate(".stagger-text .letter", {
//    opacity: [0, 1],
//    translateY: [20, 0],
//    delay: stagger(50),
//    easing: "easeOutExpo",
//  });
//};
//
//document.addEventListener("turbo:load", initStaggerText);
//document.addEventListener("DOMContentLoaded", initStaggerText);