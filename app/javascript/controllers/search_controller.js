import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["bodyCont", "results"] // resultsTargetという値を、返す

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(async () => {
      const keyword = this.bodyContTarget.value;

      try {
        // ローディング表示
        this.resultsTarget.innerHTML = "<div class='loading'>Loading...</div>";

        // fetch API で非同期に検索候補を取得、search_candidatesに遷移
        const response = await fetch(`${window.location.pathname}/search_candidates?keyword=${keyword}`);

        if (!response.ok) {
          // エラーレスポンスの場合
          const message = `Error: ${response.status} ${response.statusText}`;
          this.resultsTarget.innerHTML = `<div class='error'>${message}</div>`;
          throw new Error(message);
        }

        // レスポンスをHTMLとして処理
        const html = await response.text();
        this.resultsTarget.innerHTML = html; // 検索候補を反映

        // 検索候補をクリックしたら同期処理で検索結果を表示
        this.resultsTarget.querySelectorAll('.candidate').forEach(candidate => {
          candidate.addEventListener('click', () => {
            // candidateのデータ属性からキーワードを取得
            const keyword = candidate.dataset.keyword;
            // 同期処理で検索結果を表示
            window.location.href = `${window.location.pathname}?q[body_cont]=${keyword}`;
          });
        });

      } catch (error) {
        console.error("検索エラー:", error);
        // エラーメッセージを表示 (必要に応じて)
        this.resultsTarget.innerHTML = "<div class='error'>検索に失敗しました</div>";
      }
    }, 200)
  }
}