import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["bodyCont", "results"]

  connect() {
  }

  search(event) {
    const searchTerm = this.bodyContTarget.value;
    fetch(`/posts/search?q[body_cont]=${searchTerm}`, { headers: { 'Accept': 'text/vnd.turbo-stream.html' } })
      .then(response => response.text())
      .then(html => Turbo.renderStreamMessage(html));
  }

  focus() {
    // フォーカス時に空欄を表示
    this.resultsTarget.innerHTML = '<ul></ul>'; 
    // フォーカス時に検索候補を表示
    this.search(); 
  }

  blur() {
    // フォーカスが外れたら検索候補を非表示
    this.resultsTarget.innerHTML = ''; 
  }
}
