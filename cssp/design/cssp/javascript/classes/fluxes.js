(function($){
    function distance(point1,point2) {
        var R = 6371; //km
        var lat1 = point1.lat();
        var lon1 = point1.lng();
        var lat2 = point2.lat();
        var lon2 = point2.lng();
        var dLat = (lat2-lat1) * Math.PI / 180;
        var dLon = (lon2-lon1) * Math.PI / 180;
        var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
        Math.cos(lat1 * Math.PI / 180 ) * Math.cos(lat2 * Math.PI / 180 )
        *
        Math.sin(dLon/2) * Math.sin(dLon/2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        var d = R * c;
        return d;
    }
    function toHex(d, padding) {
        var hex = Number(d).toString(16);
        padding = typeof (padding) === "undefined" || padding === null ? padding = 2 : padding;

        while (hex.length < padding) {
            hex = "0" + hex;
        }
        return hex;
    }
    function colorPalette(length){
        var palette=new Array(),step=Math.floor(255/(length-1));
        var red=0,blue=0,green=0;
        for (var i=0;i<length;i++){
            red=Math.min(2*i*step,255);
            blue=0;
            green=Math.max(255-3*i*step,0);
            palette.push({
                r:red,
                g:green,
                b:blue,
                hex:'#'+toHex(red)+toHex(green)+'00'
            })
        }
        return palette;
    }
    var fluxes={
        _init:function(){
            var self=this,options=self.options;
            var markers=new Object();
            var map=self._initMap(options.mapid);
            options.infowindow = new google.maps.InfoWindow({
                content: 'Hello world'
            });
            var bounds = new google.maps.LatLngBounds();
            self._renderSecondarySchool(map,bounds,markers);
            self._renderPrimarySchool(map,bounds,markers);
            self._renderColorBar();
            self._renderFluxBar();
            map.fitBounds(bounds);
        },
        _initMap:function(mapid){
            var self=this
            var options = {
                zoom: 0,
                startPoint: new google.maps.LatLng(0,0),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var stylez = [{
                featureType: "road",
                elementType: "all",
                stylers: [{
                    visibility: 'off'
                }]
            },
            {
                featureType: "poi",
                elementType: "all",
                stylers: [{
                    visibility: 'off'
                }]
            },
            {
                featureType: "transit",
                elementType: "all",
                stylers: [{
                    visibility: 'off'
                }]
            }
            ];
            var map=new google.maps.Map(document.getElementById(mapid),options);
            map.setCenter(options.startPoint);
            var styledMapOptions = {
                map: map,
                name: "Hip-Hop"
            }
            var jayzMapType =  new google.maps.StyledMapType(stylez,styledMapOptions);
            map.mapTypes.set('hiphop', jayzMapType);
            map.setMapTypeId('hiphop');
            return map;
        },
        _renderSecondarySchool:function(map,bounds,markers){
            var self=this;
            var options=self.options;
            var schools=options.data.secondary_s;
            for(var i in schools){
                markers[i]=self._createMarker(map,schools[i].lat,
                    schools[i].lng,
                    {
                        id:i,
                        name:schools[i].name
                    },bounds,options.superiori_icon,schools[i].node_id,'not_source');
            }
            
        },
        _renderPrimarySchool:function(map,bounds,markers){
            var self=this;
            var options=self.options;
            var schools=options.data.primary_s,links=options.links,link=null;

            var fluxes=null,location=null,sep=0,path=null,poly=null,polyOptions=null;
            for(var i in schools){
                links[i]=new Array();
                location=self._createMarker(map,schools[i].lat,
                    schools[i].lng,{
                        id:i,
                        name:schools[i].name
                    },bounds,options.medie_icon,schools[i].node_id,'source');
                fluxes=schools[i].fluxes;
                
                for (var j in fluxes){
                    
                    if (markers.hasOwnProperty(j)){
                        if (fluxes[j]>0){
                            sep=Math.floor((options.palette_colors-1)*distance(location.position,markers[j].position)/options.maxdistance)%(options.palette_colors-1);
                            polyOptions = {
                                path:[location.position,markers[j].position],
                                strokeColor:options.palette[sep].hex,
                                strokeOpacity: 1.0,
                                strokeWeight: Math.floor(options.flux_maxwidth*fluxes[j]/schools[i].outalumns)
                            }
                            link=new google.maps.Polyline(polyOptions);
                            link.setMap(map);
                            links[i].push(link);
                        }
                    }
                }
                              
            }
                  
        },
        _createMarker:function( map,lat, lng, info, bounds,icon,nodeid,type)
        {
            var self=this;
            var links=self.options.links,link=null;
            var point = new google.maps.LatLng(lat, lng);
           
            var marker=new google.maps.Marker({
                position:point,
                map:map,
                icon: icon,
                title:info.name
            });
            google.maps.event.addListener(marker, "click", function() {
                self._renderInfoWindow(marker,map,nodeid);
            });
            if(type=='source'){
                google.maps.event.addListener(marker,'mouseover',function(){
                    var line_options={
                        strokeOpacity:0.0
                    }
                   
                    for(var i in links){
                        if(i!=info.id){
                            for (var j in links[i]){
                                (links[i])[j].setOptions(line_options);
                            }
                        }
                    }
                });
                google.maps.event.addListener(marker,'mouseout',function(){
                    var line_options={
                        strokeOpacity:1.0
                    }
                    for(var i in links){
                        for (var j in links[i]){
                            (links[i])[j].setOptions(line_options);
                        }
                    }
                })

            }

            if (bounds)
            {
                bounds.extend(point);
            }
            return marker;
        },
        _renderColorBar:function(){
            var self=this;
            var options=self.options;
            var palette=self.options.palette;
            var $color_bar=$('<div id="color_bar"></div').insertBefore(self.element);
         
            var color_width=Math.floor($color_bar.outerWidth()/self.options.palette_colors);
            var bar_width=$color_bar.outerWidth();
            for (var i in palette){
           
                $('<div class="gradient"><div class="distance">'+Math.floor(options.maxdistance*i/(options.palette_colors-1))+'km</div></div>').appendTo($color_bar).css({
                    'background':palette[i].hex,
                    'left':bar_width-i*color_width,
                    'width':color_width+'px'
                });
            }
        },
        _renderFluxBar:function(){
            var self=this;
            var options=self.options;
            var $flux_bar=$('<div id="flux_bar"></div>').insertAfter(self.element);
            for (var i=1;i<11;i++){
                $('<div class="percent_bar"><span> '+i*10+'% </span></div>').appendTo($flux_bar).css({
                    'height':Math.floor(self.options.flux_maxwidth*i/10)+'px'
                });
            }
            $('<div class="legend"><img alt="icon_medie" src="'+options.medie_icon+'"/><span>Scuole Medie</span></div>').appendTo($flux_bar);
            $('<div class="legend"><img alt="icon_superiori" src="'+options.superiori_icon+'"/><span>Scuole Superiori</span></div>').appendTo($flux_bar);
        },
        _renderInfoWindow:function(marker,map,nodeid){
            var self=this;
            var infowindows=self.options.infowindows;
            var infowindow=self.options.infowindow;
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
    $.widget("ui.fluxes", fluxes);
    $.ui.fluxes.defaults ={
        mapid:'',
        locations:null,
        icon:'',
        infowindows:new Object(),
        popup_view:'line',
        palette_colors:56,
        palette:colorPalette(56),
        maxdistance:60,
        flux_maxwidth:50,
        links:new Object()
    };
})(jQuery);


