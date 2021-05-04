import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'link' ];

  copy = () => {
    const range = document.createRange();
    const selection = window.getSelection();
    range.selectNode(this.linkTarget);
    selection.removeAllRanges();
    selection.addRange(range);
    try {
        const result = document.execCommand('copy');
        if (result) {
            alert(`🎉 Link copied!`);
        }
    }
    catch(err) {
        // Une erreur est surevnue lors de la tentative de copie
        alert('Link could not be copied.. 😞');
    }
  }
}
