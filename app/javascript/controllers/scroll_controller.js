import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll"
export default class extends Controller {
  static targets = ["responses"];

  connect() {
    console.log("Hello, Stimulus!", this.element);
    this.scrollToBottom();
    this.registerMutationObserver();
  }

  scrollToBottom() {
    const containerHeight = this.responsesTarget.clientHeight;
    const contentHeight = this.responsesTarget.scrollHeight;
    const scrollPosition = this.responsesTarget.scrollTop;

    if (
      contentHeight > containerHeight &&
      scrollPosition < contentHeight - containerHeight
    ) {
      this.responsesTarget.scrollTop = contentHeight - containerHeight;
    }
  }

  registerMutationObserver() {
    const observer = new MutationObserver(() => {
      this.scrollToBottom();
    });

    observer.observe(this.responsesTarget, {
      childList: true,
    });
  }
}
