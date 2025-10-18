document.addEventListener("DOMContentLoaded", function () {
  const sectionTitle = "User Guide";
  const navLinks = document.querySelectorAll(".md-nav__link");

  navLinks.forEach(link => {
    if (link.textContent.trim() === sectionTitle) {
      const parentItem = link.closest(".md-nav__item");
      if (parentItem) {
        const toggleInput = parentItem.querySelector(".md-nav__toggle");

        if (toggleInput) {
          toggleInput.checked = true;
        }
      }
    }
  });
});