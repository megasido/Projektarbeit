import '../models/audio_guide.dart';
import 'audio_repository.dart';

class MockDatabase implements AudioRepository {
  Map<String, AudioGuide> audioData = {};

  @override
  void addAudioGuide(String id, AudioGuide newAudioGuide) {
    audioData[id] = newAudioGuide;
  }

  @override
  void removeAudioGuide(String id) {
    if (audioData.containsKey(id)) {
      audioData.remove(id);
    } else {
      print('Item with ID $id not found.');
    }
  }

  @override
  AudioGuide? getAudioGuideById(String id) {
    return audioData[id];
  }

  @override
  List<AudioGuide> getAllAudioGuides() {
    return audioData.values.toList();
  }
}
