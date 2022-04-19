import { Controller } from "stimulus"

export default class extends Controller {

  close(e) {
    e.preventDefault(); 
    console.log(this.element);
    console.log("close!!!!");
    this.element.remove()
  }
}
