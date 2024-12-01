import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ["menu", "dropdown"]

  toggleMenu() {
    this.menuTarget.classList.toggle("show")
  }

  toggleDropdown(event) {
    event.preventDefault()
    this.dropdownTarget.classList.toggle("show")
  }

  // メニュー外をクリックした時に閉じる
  closeMenu(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.remove("show")
      this.dropdownTarget.classList.remove("show")
    }
  }

  connect() {
    // メニュー外クリックのイベントリスナーを追加
    document.addEventListener("click", this.closeMenu.bind(this))
  }

  disconnect() {
    // コントローラーが破棄される時にイベントリスナーを削除
    document.removeEventListener("click", this.closeMenu.bind(this))
  }
}