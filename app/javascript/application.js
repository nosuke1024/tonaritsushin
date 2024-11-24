// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import "./controllers/search_controller"
import * as bootstrap from "bootstrap"

document.addEventListener("turbo:load", () => {
  // import map を再読み込み
  importmap.reload();
});