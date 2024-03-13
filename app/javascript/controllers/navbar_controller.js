import { Controller } from "@hotwired/stimulus";
import VisibleElement from "../lib/visibleElement";

export default class extends Controller {
  static targets = ["openIcon", "closeIcon", 'mobileMenu'];

  connect() {
    this.setMobileMenu(false);
  }

  toggleMenu() {
    const menuOpened = this.mobileMenuTarget.classList.contains('block');
    this.setMobileMenu(!menuOpened);
  }

  // private

  setMobileMenu(open) {
    if (open) {
      new VisibleElement(this.mobileMenuTarget).show();
      new VisibleElement(this.closeIconTarget).hide();
      new VisibleElement(this.openIconTarget).show();
    } else {
      new VisibleElement(this.mobileMenuTarget).hide();
      new VisibleElement(this.closeIconTarget).show();
      new VisibleElement(this.openIconTarget).hide();
    }
  }
}
