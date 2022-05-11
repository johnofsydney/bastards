import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}

$('.read-more a').click(function(e) {
  console.log('clicked');
  $(this).closest('.expandable').toggleClass('expanded');
  $(this).text(function(i, text){
    return text === "Read More" ? "Read Less" : "Read More";
  })
  e.preventDefault();
});
