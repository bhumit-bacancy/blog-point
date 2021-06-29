// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery
//= require jquery_ujs


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// //Override the default confirm dialog by rails
// $.rails.allowAction = function(link){
//     if (link.data("confirm") == undefined){
//       return true;
//     }
//     $.rails.showConfirmationDialog(link);
//     return false;
//   }
  
//   //User click confirm button
//   $.rails.confirmed = function(link){
//     link.data("confirm", null);
//     link.trigger("click.rails");
//   }
  
//   //Display the confirmation dialog
//   $.rails.showConfirmationDialog = function(link){
//     var message = link.data("confirm");
//     swal({
//       title: message,
//       type: 'warning',
//       confirmButtonText: 'Sure',
//       confirmButtonColor: '#2acbb3',
//       showCancelButton: true
//     }).then(function(e){
//       $.rails.confirmed(link);
//     });
//   };