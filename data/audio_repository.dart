import '../models/audio_guide.dart';

abstract class AudioRepository {
  // Fügt einen neuen AudioGuide zur Datenbank hinzu.
  void addAudioGuide(String id, AudioGuide audioGuide);

  // Löscht einen AudioGuide aus der Datenbank.
  void removeAudioGuide(String id);

  // Ruft einen AudioGuide anhand seiner ID ab.
  AudioGuide? getAudioGuideById(String id);

  // Gibt eine Liste aller gespeicherten AudioGuides zurück.
  List<AudioGuide> getAllAudioGuides();
}
