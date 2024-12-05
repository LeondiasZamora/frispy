// import {
//   Controller
// } from "@hotwired/stimulus";

// export default class extends Controller {
//   static targets = ["icon"];

//   toggle(event) {
//     event.preventDefault();
//     const icon = this.element.querySelector("img.save-icon-recipes");
//     const state = icon.dataset.state;

//     if (state === "saved") {
//       icon.src = "save_frispy.svg";
//       icon.dataset.state = "unsaved";
//     } else {
//       icon.src = "filled_save.svg";
//       icon.dataset.state = "saved";
//     }

//     this.element.querySelector("a.save-link").click();
//   }
// }
