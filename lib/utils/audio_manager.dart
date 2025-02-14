import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  final AudioPlayer _musicPlayer = AudioPlayer(); // For background music
  final AudioPlayer _soundEffectPlayer = AudioPlayer(); // For sound effects
  bool _isMusicPlaying = true; // Track music toggle state
  bool _isSoundEnabled = true; // Track sound toggle state
  bool _isVibrationEnabled = true; // Track vibration toggle state

  factory AudioManager() {
    return _instance;
  }

  AudioManager._internal() {
    initialize(); // Load saved states when initialized
  }

  // ✅ Initialize AudioManager (public method)
  Future<void> initialize() async {
    await _loadMusicState(); // Load music state
    await _loadSoundState(); // Load sound state
    await _loadVibrationState(); // Load vibration state
  }

  // ✅ Play background music (only if music is enabled)
  Future<void> playBackgroundMusic() async {
    if (_isMusicPlaying) {
      await _musicPlayer.setReleaseMode(ReleaseMode.loop);
      await _musicPlayer.play(AssetSource('music/backgroundMusic.mp3'));
    }
  }

  // ✅ Stop background music
  Future<void> stopMusic() async {
    await _musicPlayer.stop();
  }

  // ✅ Play sound effect (only if sound is enabled)
  Future<void> playSoundEffect() async {
    if (_isSoundEnabled) {
      await _soundEffectPlayer.play(AssetSource('music/bubblePop.mp3'));
    }
  }

  // ✅ Toggle music state
  Future<void> toggleMusic(bool isEnabled) async {
    _isMusicPlaying = isEnabled;
    await _saveMusicState(isEnabled);

    if (_isMusicPlaying) {
      await playBackgroundMusic();
    } else {
      await stopMusic();
    }
  }

  // ✅ Toggle sound state
  Future<void> toggleSound(bool isEnabled) async {
    _isSoundEnabled = isEnabled;
    await _saveSoundState(isEnabled);
  }

  // ✅ Toggle vibration state
  Future<void> toggleVibration(bool isEnabled) async {
    _isVibrationEnabled = isEnabled;
    await _saveVibrationState(isEnabled);

    if (_isVibrationEnabled) {
      // Trigger a small vibration to indicate it's enabled
      Vibration.vibrate(duration: 100);
    }
  }

  // ✅ Check if music is enabled
  bool isMusicEnabled() {
    return _isMusicPlaying;
  }

  // ✅ Check if sound is enabled
  bool isSoundEnabled() {
    return _isSoundEnabled;
  }

  // ✅ Check if vibration is enabled
  bool isVibrationEnabled() {
    return _isVibrationEnabled;
  }

  // ✅ Trigger vibration (if enabled)
  Future<void> triggerVibration() async {
    if (_isVibrationEnabled) {
      await Vibration.vibrate(duration: 100); // Vibrate for 100ms
    }
  }

  // ✅ Load music state from SharedPreferences
  Future<void> _loadMusicState() async {
    final prefs = await SharedPreferences.getInstance();
    _isMusicPlaying = prefs.getBool('isMusicPlaying') ?? true; // Default to true
  }

  // ✅ Load sound state from SharedPreferences
  Future<void> _loadSoundState() async {
    final prefs = await SharedPreferences.getInstance();
    _isSoundEnabled = prefs.getBool('isSoundEnabled') ?? true; // Default to true
  }

  // ✅ Load vibration state from SharedPreferences
  Future<void> _loadVibrationState() async {
    final prefs = await SharedPreferences.getInstance();
    _isVibrationEnabled = prefs.getBool('isVibrationEnabled') ?? true; // Default to true
  }

  // ✅ Save music state to SharedPreferences
  Future<void> _saveMusicState(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMusicPlaying', isEnabled);
  }

  // ✅ Save sound state to SharedPreferences
  Future<void> _saveSoundState(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSoundEnabled', isEnabled);
  }

  // ✅ Save vibration state to SharedPreferences
  Future<void> _saveVibrationState(bool isEnabled) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isVibrationEnabled', isEnabled);
  }
}