window.onload = () => {
    const btn = document.getElementById("btn-browse-collection");
    btn.addEventListener("click", () => {
      document.getElementById("product-1").scrollIntoView({
        behavior: "smooth"
      });
    });

    const quantities = Array.from(document.getElementsByClassName("quantity"));
    quantities.forEach(element => { element.addEventListener("change", (e) => {
        console.log(e.target.value);
        const product = element.closest(".product");
        if (product)
        {
            product.getElementsByClassName("snipcart-add-item")?.[0]?.setAttribute("data-item-quantity", e.target.value);
        }
    })
        
    });
  };