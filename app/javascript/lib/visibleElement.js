export default class VisibleElement {
  constructor(element) {
    this.element = element;
  }

  hide() {
    this.element.classList.add('hidden');
    this.element.classList.remove('block');
  }

  show() {
    this.element.classList.add('block');
    this.element.classList.remove('hidden');
  }
}
