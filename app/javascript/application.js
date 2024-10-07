// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
// jQueryを読み込む
import * as jQuery from "jquery";
window.$ = jQuery;
window.jQuery = jQuery;
// Rails UJSを読み込む
import Rails from "@rails/ujs"; // Rails UJSのimport
Rails.start();