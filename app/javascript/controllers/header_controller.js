import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="header"
export default class extends Controller {
  static targets = ["menu"]

  toggleMenu() {
    this.menuTarget.classList.toggle("show")
  }
}