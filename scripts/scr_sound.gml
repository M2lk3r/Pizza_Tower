var snd;

snd = argument[irandom(argument_count - 1)];
audio_sound_gain(snd, 1, 5000);
audio_play_sound(snd, 1, false);
