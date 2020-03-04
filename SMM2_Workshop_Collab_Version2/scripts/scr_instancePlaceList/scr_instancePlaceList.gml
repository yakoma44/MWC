/// @description scr_instancePlaceList returns a list containing all of the colliding instances.
/// @param objectType
 
var _objectType = argument0;
var _list = ds_list_create();
 
var _numberOfObjects = instance_number(_objectType);
 
for (var i = 0; i < _numberOfObjects; i++)
{
    var _obj = instance_find(_objectType, i);
   
    if scr_isValidInstance(_obj)
    {
            if place_meeting(x,y, _obj)
            {
                ds_list_add(_list, _obj.id);
            }
    }
}
 
return _list;