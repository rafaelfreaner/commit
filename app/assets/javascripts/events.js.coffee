$ ->
  $.ajax
    dataType: 'text'
    url: '/events.json'
    success: (data) ->
      geojson = $.parseJSON(data)
      map.featureLayer.setGeoJSON(geojson)

  L.mapbox.accessToken = 'pk.eyJ1IjoicmFmYWVsZnJlYW5lciIsImEiOiJveW8x'
  map = L.mapbox.map('map', 'rafaelfreaner.j9aa9oh1').setView([40.783084, -73.965307], 12);

  map.featureLayer.on 'layeradd', (e) ->
    marker = e.layer
    properties = marker.feature.properties
    popupContent =  '<div class="popup">' +
                      '<h3>' + properties.name + '</h3>' +
                      '<p>' + properties.time + '</p>' +
                      '<a href="http://localhost:3000/conversations/new">Commit</a>' + 
                    '</div>'
    marker.bindPopup popupContent,
      closeButton: false
      minWidth: 320