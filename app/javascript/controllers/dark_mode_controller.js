import { Controller } from "@hotwired/stimulus";
import VisibleElement from "../lib/visibleElement";

export default class extends Controller {
  static targets = ["darkModeIcon", "lightModeIcon"];

  connect() {
    if (this.themeChosen()) {
      this.setTheme(localStorage.getItem('darkMode') === 'true')
    } else {
      this.setTheme(this.systemTheme());
    }
  }

  toggleTheme() {
    const currentTheme = document.documentElement.classList.contains('dark');
    this.setTheme(!currentTheme)
    localStorage.setItem('darkMode', (!currentTheme).toString());
  }

  // private

  setTheme(darkMode) {
    if (darkMode) {
      document.documentElement.classList.add('dark');
      new VisibleElement(this.darkModeIconTarget).hide();
      new VisibleElement(this.lightModeIconTarget).show();
    } else {
      document.documentElement.classList.remove('dark');
      new VisibleElement(this.lightModeIconTarget).hide();
      new VisibleElement(this.darkModeIconTarget).show();
    }

    return true;
  }

  systemTheme() {
    return window.matchMedia('(prefers-color-scheme: dark)').matches;
  }

  themeChosen() {
    return localStorage.getItem('darkMode') !== null;
  }
}
