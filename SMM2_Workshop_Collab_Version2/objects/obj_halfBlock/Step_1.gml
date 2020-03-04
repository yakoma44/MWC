/// @description Insert description here
// You can write your code in this editor
if(x<positionFrom || x>positionTo)
{
	dir *=-1;		
}
x += platformSpeed * dir;
momentum=platformSpeed*dir;