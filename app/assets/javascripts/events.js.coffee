$ ->
  map = L.mapbox.map('map', 'rafaelfreaner.j9aa9oh1').setView([40.783084, -73.965307], 12);

  $.ajax
    dataType: 'text'
    url: '/events.json'
    success: (data) ->
      geojson = $.parseJSON(data)
      map.featureLayer.setGeoJSON(geojson)