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


document.addEventListener("DOMContentLoaded", () => {
  const planItems = document.querySelectorAll(".plan-item");
  // Si no hay elementos no hacemos nada
  if (planItems.length === 0) return;

  // Retraso escalonado para que las cards aparezcan una tras otra
  planItems.forEach((item, index) => {
    item.style.transitionDelay = `${index * 150}ms`;
  });

  const planObserver = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          // El elemento es visible — activamos la animación
          entry.target.classList.add("plan-item--visible");

          // Dejamos de observarlo para que no se repita
          planObserver.unobserve(entry.target);
        }
      });
    },
    {
      threshold: 0.1, // 10% visible es suficiente para cards más grandes
    }
  );

  planItems.forEach((item) => planObserver.observe(item));
})

//===============Data tables======================

//function initDataTable() {
//  const tabla = document.getElementById("tabla-user");
//  if (!tabla) return;
//
//  if ($.fn.DataTable.isDataTable(tabla)) {
//    $(tabla).DataTable().destroy();
//  }
//
//
//  $(tabla).DataTable({
//    searching: false,
//    pageLength: 15,
//    lengthChange: false,
//    order: [[0, "asc"]],
//    columnDefs: [
//      { orderable: false, targets: -1 }
//    ],
//    language: {
//      paginate: {
//        first: "«",
//        last: "»",
//        next: "›",
//        previous: "‹"
//      },
//      info: "Mostrando _START_ – _END_ de _TOTAL_ registros",
//      infoEmpty: "No hay registros",
//      infoFiltered: "(filtrado de _MAX_ registros)",
//      zeroRecords: "No se encontraron resultados"
//    }
//  });
//}
//
//
//document.addEventListener("turbo:load", initDataTable);
//document.addEventListener("DOMContentLoaded", initDataTable);


//==============tabla con buscador=========================

function initSearchableDataTable() {
  const tabla = document.getElementById("tabla-searchable");
  if (!tabla) return;

  if ($.fn.DataTable.isDataTable(tabla)) {
    $(tabla).DataTable().destroy();
  }

  const placeholder = tabla.dataset.placeholder || "Filtrar...";


  const dt = $(tabla).DataTable({
    dom: "tip",
    pageLength: 15,
    lengthChange: false,
    order: [[0, "asc"]],
    columnDefs: [
      { orderable: false, targets: -1 }
    ],
    language: {
      paginate: {
        first: "«",
        last: "»",
        next: "›",
        previous: "‹"
      },
      info: "Mostrando _START_ – _END_ de _TOTAL_ registros",
      infoEmpty: "No hay registros",
      infoFiltered: "(filtrado de _MAX_ registros)",
      zeroRecords: "No se encontraron resultados"
    },

    initComplete: function () {
      // Flag que indica si hay una búsqueda activa
      let buscando = false;

      const input = $("<input>")
        .attr("type", "text")
        .attr("placeholder", placeholder)
        .addClass("form-control")
        .on("keypress", function (e) {
          if (e.key === "Enter") ejecutarBusqueda();
        });

      const botonLupa = $("<span>")
        .addClass("btn btn-outline-light")
        .html('<i class="fa-solid fa-magnifying-glass"></i>')
        .on("click", function () {
          // Decidimos qué hacer según el estado, no según el valor del input
          if (buscando) {
            limpiarBusqueda();
          } else {
            ejecutarBusqueda();
          }
        });

      function ejecutarBusqueda() {
        if (input.val() === "") return; // Sin texto no hacemos nada
        dt.search(input.val()).draw();
        buscando = true;
        botonLupa.html('<i class="fa-regular fa-circle-xmark"></i>');
      }

      function limpiarBusqueda() {
        input.val("");
        dt.search("").draw();
        buscando = false;
        botonLupa.html('<i class="fa-solid fa-magnifying-glass"></i>');
      }

      // Si el usuario borra el input a mano resetea el estado
      input.on("input", function () {
        if ($(this).val() === "") {
          buscando = false;
          botonLupa.html('<i class="fa-solid fa-magnifying-glass"></i>');
        }
      });

      const inputGroup = $("<div>")
        .addClass("input-group")
        .append(input, botonLupa);

      $("#filtro").html(inputGroup);
    }
  });
}

document.addEventListener("turbo:load", initSearchableDataTable);
document.addEventListener("DOMContentLoaded", initSearchableDataTable);



//======================== barras de progreso ==========================

document.addEventListener("DOMContentLoaded", () => {
  const skillsSection = document.querySelector(".skills-section");

  // Si la sección no existe en esta página, no hacemos nada
  if (!skillsSection) return;

  // IntersectionObserver — observa cuándo la sección es visible
  const observer = new IntersectionObserver(
    (entries, observerInstance) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          // Seleccionamos todas las barras dentro de la sección
          const bars = skillsSection.querySelectorAll(".skill-item__bar");

          bars.forEach((bar) => {
            // Leemos el porcentaje del atributo data-percentage
            const targetPercent = bar.dataset.percentage;

            // Pequeño delay para que la animación se vea escalonada
            setTimeout(() => {
              bar.style.width = `${targetPercent}%`;
            }, 1000);
          });

          // Dejamos de observar — la animación solo ocurre una vez
          observerInstance.unobserve(entry.target);
        }
      });
    },
    {
      // threshold: 0.3 = la animación arranca cuando el 30% de la sección es visible
      threshold: 0.4,
    }
  );

  observer.observe(skillsSection);
});