/// @description counts down and flashes at intervals
/// @param length_Of_Each_Flash
/// @param time_Between_Each_Flash_Including flash time
 
var _flashLength = argument0;
var _flashDelay = argument1;
 
var _oldFlashModFloor = floor(flashMod);
 
if (flashMod > 0)
{
    flashMod -= 1*global.timeFactor;
}
 
var _flashModFloor = floor(flashMod);
 
if
(
flashMod > 0
and _oldFlashModFloor != _flashModFloor
and _flashModFloor mod _flashDelay == 0
)
{
    flashTimer = _flashLength;
}
 
if (flashTimer > 0)
{
    flashTimer -= 1*global.timeFactor;
}