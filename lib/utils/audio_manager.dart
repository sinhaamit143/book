import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  final AudioPlayer _audioPlayer = AudioPlayer();

  factory AudioManager() {
    return _instance;
  }

  AudioManager._internal();

  Future<void> playBackgroundMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('music/backgroundMusic.mp3'));
  }

  Future<void> stopMusic() async {
    await _audioPlayer.stop();
  }
}
