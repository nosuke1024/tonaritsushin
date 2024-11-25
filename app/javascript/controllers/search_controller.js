import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]
  
  connect() {
    this.timeout = null
    console.log("Search controller connected") // 動作確認用
  }

  suggest() {
    // インクリメンタルサーチの実装
    clearTimeout(this.timeout)
    const query = this.inputTarget.value

    // 検索候補をクリア
    if (query.length < 2) {
      document.getElementById("search-candidates").innerHTML = ""
      return
    }

    // デバウンス処理（300ms）
    this.timeout = setTimeout(() => {
      const url = `/posts/search_candidates?keyword=${encodeURIComponent(query)}`
      
      fetch(url, {
        headers: {
          "Accept": "text/vnd.turbo-stream.html",
          "X-Requested-With": "XMLHttpRequest"
        }
      })
    }, 300)
  }

  selectCandidate(event) {
    // 候補選択の実装
    const selectedValue = event.currentTarget.dataset.searchValue
    this.inputTarget.value = selectedValue
    // 候補リストをクリア
    document.getElementById("search-candidates").innerHTML = ""
  }
}