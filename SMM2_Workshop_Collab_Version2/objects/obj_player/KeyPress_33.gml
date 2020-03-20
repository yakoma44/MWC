//testing time factor
global.timeFactor += .5
if(global.timeFactor > 2)
{
    global.timeFactor = 2
}
show_message(string(global.timeFactor))
