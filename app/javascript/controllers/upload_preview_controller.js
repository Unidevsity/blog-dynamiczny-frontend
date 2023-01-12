import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="upload-preview"
export default class extends Controller {
  static targets = [ "input", "preview" ]
  setImagePreview() {
    const input = this.inputTarget
    const preview = this.previewTarget

    if (input.files && input.files[0]) {
      const reader = new FileReader()
      const image = input.files[0]

      reader.onload = function(e) {
        preview.src = e.target.result
      }

      reader.readAsDataURL(image)
    }
  }
}
