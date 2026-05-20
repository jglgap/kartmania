// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import '@fortawesome/fontawesome-free/js/all.js';
import { animate, stagger } from "animejs"

const initStaggerText = () => {
  // Selecciona TODOS los elementos con la clase
  const elements = document.querySelectorAll(".stagger-text");
  console.log("elementos encontrados:", elements.length)

  if (!elements.length) return;

  // Itera sobre cada uno
  elements.forEach(el => {
    el.innerHTML = el.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
  });

  animate(".stagger-text .letter", {
    opacity: [0, 1],
    translateY: [20, 0],
    delay: stagger(20),
    easing: "easeOutExpo",
  });
};

document.addEventListener("turbo:load", initStaggerText);
document.addEventListener("DOMContentLoaded", initStaggerText);


// efectos en our
document.addEventListener("DOMContentLoaded", () => {

  const filas = document.querySelectorAll(".scroll-row");

  if (filas.length > 0) {


    filas.forEach((fila, index) => {
      if (index % 2 === 0) {
        fila.classList.add("scroll-row--from-left");
      } else {
        fila.classList.add("scroll-row--from-right");
      }
    });


    setTimeout(() => {

      const observerFilas = new IntersectionObserver(
        (entries) => {
          entries.forEach((entry) => {
            if (entry.isIntersecting) {
              entry.target.classList.add("scroll-row--visible");
              observerFilas.unobserve(entry.target);
            }
          });
        },
        { threshold: 0.15 }
      );

      filas.forEach((fila) => observerFilas.observe(fila));

    }, 300); 
  }

});



document.addEventListener("DOMContentLoaded", () => {

  const cards = document.querySelectorAll(".flip-card");
  if (cards.length === 0) return;

  cards.forEach(card => {

    function toggle(e) {
      e.stopPropagation();
      const inner = card.querySelector(".flip-card__inner");
      const flipped = inner.classList.toggle("is-flipped");
      card.setAttribute("aria-pressed", flipped);
    }

    // En móvil (touch), prevenimos el comportamiento por defecto
    // para evitar el doble-tap zoom y el delay de 300ms
    card.addEventListener("touchend", (e) => {
      e.preventDefault();
      toggle(e);
    });

    // Click para escritorio
    card.addEventListener("click", toggle);

    // Teclado
    card.addEventListener("keydown", e => {
      if (e.key === "Enter" || e.key === " ") {
        e.preventDefault();
        toggle(e);
      }
    });
  });

});

//=========welcome========
document.addEventListener("DOMContentLoaded", () => {
  const imagenes = document.querySelectorAll(".banner__img");
  if (imagenes.length < 2) return;
  let indiceActual = 0;
  setInterval(() => {
    imagenes[indiceActual].classList.remove("banner__img--active");
    indiceActual = (indiceActual + 1) % imagenes.length;
    imagenes[indiceActual].classList.add("banner__img--active");
  }, 4000); // 4000ms = 4 segundos entre cambios
  const items = document.querySelectorAll(".circle-item");
  // Si no hay elementos no hacemos nada
  if (items.length === 0) return;

  items.forEach((item, index) => {
    item.style.transitionDelay = `${index * 150}ms`;
  });
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          // El elemento ya es visible — añadimos la clase que activa la animación
          entry.target.classList.add("circle-item--visible");

          // Dejamos de observarlo para que la animación no se repita
          observer.unobserve(entry.target);
        }
      });
    },
    {
      threshold: 0.2, // Se activa cuando el 20% del elemento es visible
    }
  );
  items.forEach((item) => observer.observe(item));
});