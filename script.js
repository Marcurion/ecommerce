window.onload = () => {
    const btn = document.getElementById("btn-browse-collection");
    btn.addEventListener("click", () => {
      document.getElementById("product-1").scrollIntoView({
        behavior: "smooth"
      });
    });
  };