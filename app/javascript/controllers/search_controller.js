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

      // 非同期処理にリクエスト
      fetch(url, {
        headers: {
          "Accept": "text/vnd.turbo-stream.html",
          "X-Requested-With": "XMLHttpRequest"
        }
      })
      // 検索候補をHTMLに返すことを
      .then(response => response.text())
      .then(html => { //検索候補がレンダリングして実際に表示される
        document.getElementById("search-candidates").innerHTML = html;
      });
    }, 300);
  }
}