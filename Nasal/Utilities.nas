#--------------------------------------------------------------------
# Author: Matteo Daniele
# June 2018
# Attila Frame Simulator
# Politecnico di Milano
#--------------------------------------------------------------------

# This file contains useful functions to simplify the code debug

#--------------------------------------------------------------------
# Round double precision number with the desired precision level
#--------------------------------------------------------------------
# Utils = []
Utils = {
    roundWithDesiredPrecision : func(propertyValue,decimals)
    {
        var factor = math.pow(10.0,decimals);
        return factor*math.round(propertyValue/factor);
    }
};

#var roundWithDesiredPrecision = func(propertyValue,decimals)
#{
#    var factor = math.pow(10,decimals);
#    return factor*math.round(propertyValue/factor);
#}