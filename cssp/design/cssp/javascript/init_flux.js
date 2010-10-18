$(document).ready(function() {
   
   var popup_view=$('#config_gmap p[title="popup_view"]').text();
   var $map=$('#mapid');
   var superiori_icon=$('#config_flussi p[title="superiori_icon"]').text();
   var medie_icon=$('#config_flussi p[title="medie_icon"]').text();

  // var locations=jQuery.parseJSON($('#config_gmap p[title="locations"]').text());


   $map.fluxes({
        superiori_icon:superiori_icon,
        medie_icon:medie_icon,
        mapid:'mapid',
        data:{
            secondary_s:{
                   UDTF01301V:{
                       node_id:982,
                       name:'Iti Malignani 2000',
                       lat:45.8248684,
                       lng:13.3436517
                   },
                   UDPS01301R:{
                       node_id:1378,
                       name:'Liceo Scientifico A. Einstein',
                       lat:45.8127352,
                       lng:13.3425063
                   },
                   UDSD01000P:{
                       node_id:973,
                       name:'Isa G.Sello',
                       lat:46.0649418,
                       lng:13.2307247
                   },
                   UDRI013012:{
                       node_id:1380,
                       name:'Ipsia Malignani 2000 San Giorgio',
                       lat:45.8297037,
                       lng:13.2100185
                   },
                   UDRC013019:{
                       node_id:1000,
                       name:'Ipssct Mattei Palmanova',
                       lat:45.91125,
                       lng: 13.32253
                   },
                   UDTD01301L:{
                       node_id:1000,
                       name:'Itc Einaudi Palmanova',
                       lat:45.91125,
                       lng: 13.32253
                   },
                   UDPM010009:{
                       node_id:1000,
                       name:'Liceo Socio Psico Pedagogico C. Percoto',
                       lat:46.0667624,
                       lng: 13.2288583
                   },
                   UDPS010008:{
                       node_id:1000,
                       name:'Liceo Scientifico Marinelli Udine',
                       lat:46.0685103834396,
                       lng: 13.222955263541637
                   },
                   UDTF01000A:{
                        node_id:1000,
                       name:'Iti Malignani',
                       lat:46.0688100390304,
                       lng: 13.22191048734536
                   },
                   GORIZIA_ITI:{
                       node_id:1000,
                       name:'Iti Gorizia',
                       lat:45.9413046,
                       lng:13.6215457
                   },
                   GORIZIA_LICEO:{
                       node_id:1000,
                       name:'Liceo Gorizia',
                       lat:45.93613752271455,
                       lng:13.620747475644919
                   }

            },
            primary_s:{
                UDMM01800A:{
                    node_id:951,
                    name:'Scuola Media G. Randaccio',
                    lat:45.8281338,
                    lng:13.3334701,
                    outalumns:160,
                    fluxes:{
                        UDTF01301V:27,
                        UDPS01301R:31,
                        UDSD01000P:6,
                        UDRI013012:5,
                        UDRC013019:9,
                        UDTD01301L:8,
                        UDPM010009:8,
                        UDPS010008:28,
                        UDTF01000A:1,
                        GORIZIA_ITI:4,
                        GORIZIA_LICEO:28

                    }
                },
                UDMM05800R:{
                    node_id:957,
                    name:'Scuola Media N. Sauro',
                    lat:45.831624,
                    lng:13.2040702,
                    outalumns:101,
                    fluxes:{
                        UDTF01301V:21,
                        UDPS01301R:4,
                        UDSD01000P:8,
                        UDRI013012:2,
                        UDRC013019:2,
                        UDTD01301L:7,
                        UDPM010009:14,
                        UDPS010008:4,
                        UDTF01000A:4,
                        GORIZIA_ITI:1,
                        GORIZIA_LICEO:0
                    }
                },
                UDMM81101G:{
                    node_id:990,
                    name:'IC Palazzolo',
                    lat:45.804892,
                    lng:13.082962,
                    outalumns:91,
                    fluxes:{
                        UDTF01301V:4,
                        UDPS01301R:2,
                        UDSD01000P:2,
                        UDRI013012:3,
                        UDRC013019:3,
                        UDTD01301L:4,
                        UDPM010009:7,
                        UDPS010008:10,
                        UDTF01000A:7,
                        GORIZIA_ITI:1,
                        GORIZIA_LICEO:0
                    }
                },
                UDIC821005:{
                    node_id:990,
                    name:'IC Aiello',
                    lat:45.8717323,
                    lng:13.3618138,
                    outalumns:57,
                    fluxes:{
                        UDTF01301V:3,
                        UDPS01301R:11,
                        UDSD01000P:6,
                        UDRI013012:0,
                        UDRC013019:2,
                        UDTD01301L:1,
                        UDPM010009:3,
                        UDPS010008:1,
                        UDTF01000A:1,
                        GORIZIA_ITI:2,
                        GORIZIA_LICEO:11
                    }
                },
                    UDMM83301C:{
                    node_id:990,
                    name:'IC Palmanova',
                    lat:45.901221,
                    lng:13.309571,
                    outalumns:69,
                    fluxes:{
                        UDTF01301V:8,
                        UDPS01301R:2,
                        UDSD01000P:5,
                        UDRI013012:0,
                        UDRC013019:2,
                        UDTD01301L:1,
                        UDPM010009:6,
                        UDPS010008:16,
                        UDTF01000A:5,
                        GORIZIA_ITI:1,
                        GORIZIA_LICEO:3
                    }
                }
            }
        }
       });
});
