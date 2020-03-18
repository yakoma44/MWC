if(x<positionFrom || x>positionTo)
{
	dir *=-1;		
}
x += platformSpeed * dir;
momentum=platformSpeed*dir;

