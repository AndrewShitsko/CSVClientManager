<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'client.label', default: 'Client')}"/>
    <title><g:message code="default.google.map.label" args="[entityName]"/></title>
</head>

<body>
<h1><g:message code="default.google.map.label" args="[entityName]"/></h1>

<div id="map"></div>
<script>
    function initMap() {
        var mapOptions = {
            zoom: 6
        };

        var map = new google.maps.Map(document.getElementById("map"), mapOptions);

        var infoWindow = new google.maps.InfoWindow();

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                map.setCenter(pos);
            }, function () {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            handleLocationError(false, infoWindow, map.getCenter());
        }

        <g:each var="client" in="${clientList}">
        var marker${client.id} = new google.maps.Marker({
            position: new google.maps.LatLng(${client.latitude}, ${client.longitude}),
            map: map,
            title: "${client.name}"
        });
        </g:each>

    }

    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                'Error: The Geolocation service failed.' :
                'Error: Your browser doesn\'t support geolocation.');
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIPAH-SuRYGrcpku24rKhqxOp8ChMKMRs&callback=initMap" async
        defer></script>
</body>
</html>