// app/javascript/plugins/init_mapbox.js
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/shalashtein/ckieyax2e43ic19qrhajxpasn',
      center: [35.5018, 33.8938], // starting position
      zoom: 13 // starting zoom
    });
    map.on('idle', function() {
      console.log("... resizing");
      map.resize();
    });
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
                                      mapboxgl: mapboxgl }));
    map.on('click', function(e) {
    // The event object (e) contains information like the
    // coordinates of the point on the map that was clicked.
      var x = document.getElementsByClassName("mapboxgl-marker");
      if (x[0]){
        x[0].remove();
      }
      var y = document.getElementsByClassName("mapboxgl-popup");
      if (y[0]){
        y[0].remove();
      }
      var popup = new mapboxgl.Popup({ closeOnClick: false, closeButton: false, className: "popup-styled" })
      .setHTML(`<a data-slide-to="2" role="button" class="btn btn-primary fadeInUp" id="pay-button" href="#checkout-carousel" onclick="document.getElementById('hidden_submit_button').click(); console.log('clicked'); return false;">Choose Payment Method</a>`);
      var marker = new mapboxgl.Marker()
      .setLngLat([e.lngLat.wrap().lng, e.lngLat.wrap().lat])
      .setPopup(popup)
      .addTo(map)
      .togglePopup();
      var next = document.getElementById("pay-button");
      document.getElementById("location_lat").value = e.lngLat.wrap().lat;
      document.getElementById("location_long").value = e.lngLat.wrap().lng;
      if (next.classList.contains("btn-none")){
        next.classList.remove("btn-none");
        next.classList.toggle("fadeInUp");
      }
    });
  }
};

export { initMapbox }
