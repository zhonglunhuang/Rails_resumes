import { Controller } from "stimulus"
import EasyMDE from "easymde"
import "easymde/dist/easymde.min.css"
import { marked }  from "marked"

export default class extends Controller {
    initialize() {
        this.origcontent = ""
    }
    connect() {
        this.origcontent = this.element.textContent
        this.element.innerHTML = marked.parse(this.origcontent)
    }

    disconnect(){
        this.element.textContent = this.origcontent
    }
  }
  

