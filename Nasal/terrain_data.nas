# ADD THIS SCRIPT ALONG WITH OUPTUT PROTOCOL "terrain_informations.xml"
# in order to obtain elevation data to compute terrain position
# Author: Matteo Daniele



# properties initialization

setprop("position/terrain_data/GND_1/GND_1_elev-m",0);
#setprop("position/terrain_data/GND_1/GND_1_lat-deg",0);
#setprop("position/terrain_data/GND_1/GND_1_lon-deg",0);
setprop("position/terrain_data/GND_2/GND_2_elev-m",0);
#setprop("position/terrain_data/GND_2/GND_2_lat-deg",0);
#setprop("position/terrain_data/GND_2/GND_2_lon-deg",0);
setprop("position/terrain_data/GND_3/GND_3_elev-m",0);
#setprop("position/terrain_data/GND_3/GND_3_lat-deg",0);
#setprop("position/terrain_data/GND_3/GND_3_lon-deg",0);
setprop("position/terrain_data/GND_4/GND_4_elev-m",0);
#setprop("position/terrain_data/GND_4/GND_4_lat-deg",0);
#setprop("position/terrain_data/GND_4/GND_4_lon-deg",0);

# obtain aircraft position
var pos = geo.aircraft_position();
var geog_infos = geodinfo(pos.lat(), pos.lon());

# extract the elevation of 4 points in 3 arcsec around the aircraft (1/1200 deg, 30.87 m)
# 1 m is circa 0.00002699 deg
# extract the elevation of 4 points corresponding to landing gear distance from ground
# var GND_1 = geodinfo(pos.lat()+1/1200,pos.lon()+1/1200); # FWD LANDING GEAR (DISTANCES FROM AW101_python.mbd)
# var GND_2 = geodinfo(pos.lat()+1/1200,pos.lon()-1/1200); # LEFT LANDING GEAR (DISTANCES FROM AW101_python.mbd)
# var GND_3 = geodinfo(pos.lat()-1/1200,pos.lon()-1/1200); # RIGHT LANDING GEAR (DISTANCES FROM AW101_python.mbd)
# var GND_4 = geodinfo(pos.lat()-1/1200,pos.lon()+1/1200); # TAIL (DISTANCES FROM AW101_python.mbd)
var GND_1 = geodinfo(pos.lat()+4.87/37044,pos.lon()); # FWD LANDING GEAR (DISTANCES FROM AW101_python.mbd)
var GND_2 = geodinfo(pos.lat()-2.125/37044,pos.lon()-1.68/37044); # LEFT LANDING GEAR (DISTANCES FROM AW101_python.mbd)
var GND_3 = geodinfo(pos.lat()-2.125/37044,pos.lon()+1.68/37044); # RIGHT LANDING GEAR (DISTANCES FROM AW101_python.mbd)
var GND_4 = geodinfo(pos.lat()-11.465/37044,pos.lon()); # TAIL (DISTANCES FROM AW101_python.mbd)

#var GND_1_elev = GND_1[0];
#var GND_2_elev = GND_2[0];
#var GND_3_elev = GND_3[0];
#var GND_4_elev = GND_4[0];

#setprop("position/terrain_data/GND_1/GND_1_elev-m",GND_1[0]);
#setprop("position/terrain_data/GND_1/GND_1_lat-deg",pos.lat()+1/1200);
#setprop("position/terrain_data/GND_1/GND_1_lon-deg",pos.lon()+1/1200);
#setprop("position/terrain_data/GND_2/GND_2_elev-m",GND_2[0]);
#setprop("position/terrain_data/GND_2/GND_2_lat-deg",pos.lat()+1/1200);
#setprop("position/terrain_data/GND_2/GND_2_lon-deg",pos.lon()-1/1200);
#setprop("position/terrain_data/GND_3/GND_3_elev-m",GND_3[0]);
#setprop("position/terrain_data/GND_3/GND_3_lat-deg",pos.lat()-1/1200);
#setprop("position/terrain_data/GND_3/GND_3_lon-deg",pos.lon()-1/1200);
#setprop("position/terrain_data/GND_4/GND_4_elev-m",GND_4[0]);
#setprop("position/terrain_data/GND_4/GND_4_lat-deg",pos.lat()-1/1200);
#setprop("position/terrain_data/GND_4/GND_4_lon-deg",pos.lon()+1/1200);


var terrain_data = func()
{

    var alt_ft = getprop("position/altitude-ft");
    var gnd_elev_ft = getprop("position/ground-elev-ft");
    var threshold = setprop("position/terrain_distance_threshold-ft",100);

    #if ((alt_ft - gnd_elev_ft) <= threshold)
    #{
    # obtain aircraft position
    var pos = geo.aircraft_position();
    var geog_infos = geodinfo(pos.lat(), pos.lon());

    # extract the elevation of 4 points in 3 arcsec around the aircraft (1/1200 deg, 30.87 m)
    var GND_1 = geodinfo(pos.lat()+4.87/37044,pos.lon()); # FWD LANDING GEAR (DISTANCES FROM AW101_python.mbd)
    var GND_2 = geodinfo(pos.lat()-2.125/37044,pos.lon()-1.68/37044); # LEFT LANDING GEAR (DISTANCES FROM AW101_python.mbd)
    var GND_3 = geodinfo(pos.lat()-2.125/37044,pos.lon()+1.68/37044); # RIGHT LANDING GEAR (DISTANCES FROM AW101_python.mbd)
    var GND_4 = geodinfo(pos.lat()-11.465/37044,pos.lon()); # TAIL (DISTANCES FROM AW101_python.mbd)


    #var GND_1_elev = GND_1[0];
    #var GND_2_elev = GND_2[0];
    #var GND_3_elev = GND_3[0];
    #var GND_4_elev = GND_4[0];

    setprop("position/terrain_data/GND_1/GND_1_elev-m",GND_1[0]);
    #setprop("position/terrain_data/GND_1/GND_1_lat-deg",pos.lat()+1/1200);
    #setprop("position/terrain_data/GND_1/GND_1_lon-deg",pos.lon()+1/1200);
    setprop("position/terrain_data/GND_2/GND_2_elev-m",GND_2[0]);
    #setprop("position/terrain_data/GND_2/GND_2_lat-deg",pos.lat()+1/1200);
    #setprop("position/terrain_data/GND_2/GND_2_lon-deg",pos.lon()-1/1200);
    setprop("position/terrain_data/GND_3/GND_3_elev-m",GND_3[0]);
    #setprop("position/terrain_data/GND_3/GND_3_lat-deg",pos.lat()-1/1200);
    #setprop("position/terrain_data/GND_3/GND_3_lon-deg",pos.lon()-1/1200);
    setprop("position/terrain_data/GND_4/GND_4_elev-m",GND_4[0]);
    #setprop("position/terrain_data/GND_4/GND_4_lat-deg",pos.lat()-1/1200);
    #setprop("position/terrain_data/GND_4/GND_4_lon-deg",pos.lon()+1/1200);
    #}

}


setlistener("position/latitude-deg",func{terrain_data()});
setlistener("position/longitude-deg",func{terrain_data()});
setlistener("position/altitude-ft",func{terrain_data()});
