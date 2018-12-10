# This code is written in NASAL and it is used to manage some of the properties of the AW 101 model for flightgear, in order to avoid to overload  MBDyn with useless calculations
# Author: Matteo Daniele

#---------------------------------------------- landing gear ----------------------------------------------
setprop("/controls/gear/gear-down",1);
setprop("gear/gear[1]/position-norm",0);
setprop("gear/gear[2]/position-norm",0);
var gear_status = func()
{
    if (getprop("/controls/gear/gear-down") == 1)
    {
    interpolate("gear/gear[1]/position-norm", 1.0, 4);  # interpolate to 1.0 in 2 seconds
    interpolate("gear/gear[2]/position-norm", 1.0, 4);  # interpolate to 1.0 in 2 seconds
    
    }
    else
    {
    interpolate("gear/gear[1]/position-norm", 0.0, 4);  # interpolate to 0.0 in 2 seconds
    interpolate("gear/gear[2]/position-norm", 0.0, 4);  # interpolate to 0.0 in 2 seconds
    }
}

# setlistener checks the gear status
setlistener("/controls/gear/gear-down", func{gear_status()});

#_________________useful for multiplayer animation___________________________________________________
setprop("/rotors/main/rpm/",0);
setprop("/rotors/tail/rpm/",0);


#---------------------------------------------- pilot & copilot controls ----------------------------------------------

#__________________collective_______________________________________________________________________

# collective set to minimum at the beginning
setprop("controls/flight/throttle",-1.0);

#__________________cyclic_______________________________________________________________________

# cyclic set to center at the beginning
setprop("controls/flight/aileron",0.0);
setprop("controls/flight/elevator",0.0);

#__________________pedals_______________________________________________________________________

# pedals set to center at the beginning
setprop("controls/flight/rudder",0.0);
# no brakes applied at the beginning
setprop("controls/gear/brake-left",-1.0);
setprop("controls/gear/brake-right",-1.0);

#--------------------------------------------- doors ----------------------------

#__________________starboard (right) door________________________________________

setprop("AW_101/doors/starboard_door_translate",0.0);
setprop("AW_101/doors/starboard_door_slide",0.0);

#__________________port (left) door________________________________________

setprop("AW_101/doors/port_door_translate",0.0);
setprop("AW_101/doors/port_door_slide",0.0);

#__________________back door________________________________________

setprop("AW_101/doors/back_door_pos_norm",0.0);

#__________________main rotor________________________________________

setprop("rotors/main/blade_1/pitch-deg",0.5);
setprop("rotors/main/blade_2/pitch-deg",0.5);
setprop("rotors/main/blade_3/pitch-deg",0.5);
setprop("rotors/main/blade_4/pitch-deg",0.5);
setprop("rotors/main/blade_5/pitch-deg",0.5);


setprop("rotors/main/blade_1/flap-deg",-9.0);
setprop("rotors/main/blade_2/flap-deg",-9.0);
setprop("rotors/main/blade_3/flap-deg",-9.0);
setprop("rotors/main/blade_4/flap-deg",-9.0);
setprop("rotors/main/blade_5/flap-deg",-9.0);

setprop("rotors/main/blade_1/lag-deg",0.0);
setprop("rotors/main/blade_2/lag-deg",0.0);
setprop("rotors/main/blade_3/lag-deg",0.0);
setprop("rotors/main/blade_4/lag-deg",0.0);
setprop("rotors/main/blade_5/lag-deg",0.0);

#__________________tail rotor________________________________________

setprop("rotors/tail/pitch-deg",0.0);
