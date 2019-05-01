import React from "react";
import ReactDOM from "react-dom";
import Catalog from "./components/Catalog";

document.addEventListener("DOMContentLoaded", () => {
    const catalog = document.querySelector("#catalog");
    const budget = JSON.parse(catalog.getAttribute("budget"));
    ReactDOM.render(<Catalog budget={budget}/>, catalog);
});
