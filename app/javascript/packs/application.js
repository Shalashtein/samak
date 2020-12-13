// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("bootstrap")
// For Toast Messages
global.toastr = require("toastr")
import "../stylesheets/application"
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// MapBox
import { initMapbox } from './init_mapbox';
jQuery('.payment-option').click( function(e) {
  jQuery('.collapse-option').collapse('hide');
});
jQuery('#pay-button').click( function(e) {
  console.log('clicked');
});
jQuery('#active-order-tab').click( function(e) {
  console.log("Clicked on Active tab");
 if(!jQuery("#history-order-list").hasClass("noshow")){
  console.log("History Tab does not have noshow class, adding...");
  jQuery("#history-order-list").addClass("noshow");
  console.log("Added noshow class to History tab");
  }
  if(jQuery("#active-order-list").hasClass("noshow")){
    console.log("Active Tab has noshow class, removing...");
  jQuery("#active-order-list").removeClass("noshow");
  console.log("Removed noshow class from active");
  }
});
jQuery('#history-order-tab').click( function(e) {
  console.log("Clicked on History tab");
 if(!jQuery("#active-order-list").hasClass("noshow")){
  console.log("Active Tab does not have noshow class, adding..");
  jQuery("#active-order-list").addClass("noshow");
  console.log("Added noshow class to Active tab");
  }
  if(jQuery("#history-order-list").hasClass("noshow")){
    console.log("History Tab has noshow class, removing...");
    jQuery("#history-order-list").removeClass("noshow");
    console.log("Removed noshow class from history");
  }
});
jQuery('#catch-to-market-modal-confirm').click( function(e) {
  console.log("xx");
  jQuery('#catch-to-market-submit').click();
});
document.addEventListener('turbolinks:load', () => {
  initMapbox();
});
