(function () {
  "use strict";

  document.addEventListener("click", function (e) {
    var el = e.target.closest(".style-picker > div");
    if (!el) return;

    var id = el.getAttribute("data-item-id");
    var parent = el.closest(".styles");
    var styles = parent.querySelectorAll(".style");

    styles.forEach(function (s) {
      s.style.display = s.getAttribute("data-item-id") === id ? "" : "none";
    });
  });
})();
