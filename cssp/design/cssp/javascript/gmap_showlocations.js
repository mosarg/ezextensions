(function($){
    var gmapLocations={
        _init:function(){
            var self=this,options=self.options;
            var map=self._initMap(options.mapid);
            options.infowindow = new google.maps.InfoWindow({
                content: 'Hello world'
            });
            var bounds = new google.maps.LatLngBounds();
            for(var i in options.locations){
                self._createMarker(map,options.locations[i].latitude,
                    options.locations[i].longitude,
                    'test',bounds,options.icon,options.locations[i].node_id);
            }
            map.fitBounds(bounds);
        },
        _initMap:function(mapid){
            var self=this
            var options = {
                zoom: 0,
                startPoint: new google.maps.LatLng(0,0),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map=new google.maps.Map(document.getElementById(mapid),options);
            map.setCenter(options.startPoint);
            return map;
        },
        _createMarker:function( map,lat, lng, info, bounds, icon,nodeid)
        {
            var self=this;
            var point = new google.maps.LatLng(lat, lng);
            var marker=new google.maps.Marker({
                position:point,
                map:map,
                icon: icon
            });
            google.maps.event.addListener(marker, "click", function() {
                self._renderInfoWindow(marker,map,nodeid);
            });
            if (bounds)
            {
                bounds.extend(point);
            }
            return marker;
        },
        _renderInfoWindow:function(marker,map,nodeid){
            var self=this;
            var infowindows=self.options.infowindows;
            var infowindow=this.options.infowindow;
            var ezaction='content/view/'+self.options.popup_view+'/'+nodeid;

            if (infowindows.hasOwnProperty(nodeid)){
                    infowindow.setContent(infowindows[nodeid]);
                    infowindow.open(map,marker);
            }else{
                $.ezrun(ezaction,{
                    postdata:'ready'
                },function(data){
                    infowindow.setContent(data);
                    infowindow.open(map,marker);
                    infowindows[nodeid]=data;
                });
            }
        }
    }
    $.widget("ui.gmapLocations", gmapLocations);
    $.ui.gmapLocations.defaults ={
        mapid:'',
        locations:null,
        icon:'',
        infowindows:new Object(),
        popup_view:'full'
    };
})(jQuery);
