import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "bodyCont"]

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      // フリーワード検索の入力値を取得
      const bodyCont = this.bodyContTarget.value;
      // フリーワード検索の入力値がある場合のみ、フォームを送信
      if (bodyCont) {
        this.formTarget.requestSubmit()
      }
    }, 200)
  }
}
