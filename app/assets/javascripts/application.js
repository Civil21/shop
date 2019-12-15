// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require jquery3
//= require jquery_ujs
//= require bootstrap
//= require popper
//= require turbolinks
//= require_tree .
function sort(event) {
  $.ajax({
    url: '/sort',
    type: 'GET',
    dataType: 'script',
    data: {
      name: event.target.id
    }
  });
}
$(document).on('turbolinks:load', function() {
  var cost = document.getElementById("order_cost");
  var price = document.getElementById("order_price");
  var count = document.getElementById("order_count");

  $('.order_count').change(function() {
    cost.innerText = (price.innerText * count.value).toFixed(2);
  });
});
