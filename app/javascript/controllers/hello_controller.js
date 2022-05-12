import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}

$('a.read-more').click( function(e) {
  // @TODO: Only works for one element on page.
  $('.expandable').toggleClass('expanded');
  $(this).text(function(i, text){
    return text === "Read More" ? "Read Less" : "Read More";
  })
  e.preventDefault();
});
