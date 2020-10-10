import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:io';

AudioCache cache;
AudioPlayer player;

playSound() async {
  AudioPlayer audioPlayer = AudioPlayer();
  Directory dirToSave = await getApplicationDocumentsDirectory();
  String filePath = "${dirToSave.path}/line_a_7.mp3";
  await audioPlayer.play(filePath, isLocal: true);
}

playLocal() async {
  print("playLocal");
  AudioPlayer audioPlayer = AudioPlayer();
  int result = await audioPlayer.play("assets/line_a_7.mp3", isLocal: true);
}

playAudio(audioFilename) async {
  print("playAudio3");

  player = await cache.play(audioFilename);
}

stopAudio() {
  print("player $player");
  player.stop();
}
// AudioCache cache = AudioCache();
// AudioPlayer player = await cache.play('alert_tone.mp3');

// // ...

// player.stop();
