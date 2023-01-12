import { Controller } from "@hotwired/stimulus"
import toastr from 'toastr'
// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    const type = this.element.dataset.type
    const message = this.element.dataset.message

    toastr.options = {
      closeButton: true,
    }

    if (type == 'notice') {
      toastr.success(message)
    } else if (type == 'alert') {
      toastr.error(message)
    }
  }
}
