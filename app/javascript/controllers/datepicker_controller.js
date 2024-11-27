import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="datepicker"
export default class extends Controller {
static values = {dates: Array}

  connect() {
    flatpickr(this.element, {
      minDate: "today",
      maxDate: new Date().fp_incr(90),
    })
  }
}