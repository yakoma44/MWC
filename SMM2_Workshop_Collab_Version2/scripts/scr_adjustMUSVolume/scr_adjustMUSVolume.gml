global.MUSVolume += argument0;
global.MUSVolume = clamp(global.MUSVolume,0,1);

scr_setOptionVariableStrings();
audio_emitter_gain(global.MUSemitter, global.MUSVolume);
