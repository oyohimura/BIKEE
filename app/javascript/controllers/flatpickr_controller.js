import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startDate", "endDate" ]

  connect() {
    flatpickr(this.startDateTarget, {enableTime: true, time_24hr: true})
    flatpickr(this.endDateTarget, {enableTime: true, time_24hr: true})
  }
}
