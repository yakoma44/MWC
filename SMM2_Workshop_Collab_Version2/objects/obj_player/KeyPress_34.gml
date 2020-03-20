//testing time factor
global.timeFactor -= .5
if(global.timeFactor < 0)
{
    global.timeFactor = 0
}
show_message(string(global.timeFactor))
