global.SEVolume += argument0;
global.SEVolume = clamp(global.SEVolume,0,1);

scr_setOptionVariableStrings();
audio_emitter_gain(global.SEemitter, global.SEVolume);
