/// @description scr_capAnimationAtImageNumber
var _imageNumber = sprite_get_number(sprite_index) - 1;
 
if (image_index > _imageNumber)
{
    image_index = _imageNumber;
    imageSpeed = 0;
}