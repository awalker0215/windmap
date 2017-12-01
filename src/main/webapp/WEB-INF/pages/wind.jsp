<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 85%;
      }
      #size {
        height: 15%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
      var map;
	  var markers = [];
      var markers_ststion = [];
      
      var icons = {
              1: {
                icon: 'resources/pic/0-01.png'
              },
              2: {
                  icon: 'resources/pic/1-01.png'
                },
              3: {
                  icon: 'resources/pic/2-01.png'
                },
              4: {
                  icon: 'resources/pic/3-01.png'
                },
              5: {
                  icon: 'resources/pic/4-01.png'
                },
              6: {
                  icon: 'resources/pic/5-01.png'
                },
              7: {
                  icon: 'resources/pic/6-01.png'
                },
              8: {
                  icon: 'resources/pic/7-01.png'
                },
             9: {
                  icon: 'resources/pic/8-01.png'
                }
            };
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 23.3536049, lng: 120.1050019},
          zoom: 8
        });
        
        var infoWindow_marker = new google.maps.InfoWindow();
        
		<c:forEach items="${allparkinfo}" var="p">

		  latLng = new google.maps.LatLng("${p.lat}", "${p.lng}");
		  marker = new google.maps.Marker({
		            position: latLng,
		            map:map,
		            //icons: icons["${p.level}"].icon
		    });
		  markers.push(marker);	
		  
		  //var html = "園區名稱："+"${p.name}"+"<br>"+"每小時預測發電量："+"${p.electricity}";
		  var html = "園區名稱："+"${p.name}";
       	  var dital = "${p.l_id}";
		  //html = html +"<p>地點：" + dataPhoto.position +"</p>";
        //html = html +"<p>種類：" + dataPhoto.type +"</p>";
        bindInfoWindow(marker, map, infoWindow_marker, html);
		</c:forEach>
		
		<c:forEach items="${nearstationinfo}" var="p">

		  latLng = new google.maps.LatLng("${p.lat}", "${p.lng}");
		  marker = new google.maps.Marker({
		            position: latLng,
		            map:map,
		            icon: icons["${p.level}"].icon
		    });
		  markers_ststion.push(marker);	
		  
		  var html = "測站名稱："+"${p.name}"+"<br>"+"每小時預測發電量："+"${p.electricity}";
     	  var dital = "${p.l_id}";
		  //html = html +"<p>地點：" + dataPhoto.position +"</p>";
      	  //html = html +"<p>種類：" + dataPhoto.type +"</p>";
      	  bindInfoWindow(marker, map, infoWindow_marker, html);
		</c:forEach>
		
    }
      function bindInfoWindow(marker, map, infoWindow, html) {
	        // 除了 click 事件，也可以用 mouseover 等事件觸發氣泡框顯示
	        google.maps.event.addListener(marker, 'click', function() { 
	            infoWindow.setContent(html);
	            infoWindow.open(map, marker);
	      });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBe1Es58qp5WIdisRPkpnmSqp_E_DRkqx8&callback=initMap"
    async defer></script>
    <div id="size">
    <img src="resources/pic/table-02-02.png" alt="Smiley face" style = "float:right">
    </div>
  </body>
</html>