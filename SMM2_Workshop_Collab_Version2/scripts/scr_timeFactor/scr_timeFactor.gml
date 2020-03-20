/// @description scr_timeFactor(startingValue, addedValue, mode);
/// @param startingValue
/// @param addedValue
/// @param mode

//http://fauxoperativegames.com/a-comprehensive-guide-to-time-dilation/

var startingValue = argument0
var addedValue = argument1
var mode = argument2

switch(mode)
{

    case "linear":
           return startingValue + (addedValue*global.timeFactor);

    case "absolute":
           return startingValue*global.timeFactor;

    case "non-linear":
           //for acceleration in movement:
               //var newPosition += scr_timeFactor(velocity, acceleration, "non-linear"); //don't overwrite your velocity
               //var velocity = scr_timeFactor(velocity, acceleration, "linear"); //make sure this comes after you update the position
           return (global.timeFactor*startingValue) + (0.5*(global.timeFactor*global.timeFactor) * addedValue);

}

//if you don't pass in a valid mode, you get zero
return 0
