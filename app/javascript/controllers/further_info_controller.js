import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="further-info"
export default class extends Controller {
  static targets = ["info"]

  connect() {

  }

  toggle() {
    this.infoTarget.classList.toggle("d-none")
    console.log("toggled")
  }
}
