// Stimulus の導入時における具体例を示すためのサンプルファイル
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
