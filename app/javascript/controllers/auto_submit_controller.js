import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-submit"
export default class extends Controller {
  connect() {
    console.log('connected')
  }

  submit(event) {
    const value = event.target.value
    if (value.length > 2 || value.length === 0) {
      setTimeout(() => {
        this.element.submit()
      }, 1000)
    }
  }
}
