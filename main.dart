import 'data/audio_repository.dart';
import 'data/mock_database.dart';
import 'models/audio_guide.dart';

void main() {
  AudioRepository mockDatabase = MockDatabase();

  // Hinzufügen Ihres ersten AudioGuides zur Datenbank
  AudioGuide firstAudioGuide = AudioGuide(
      title: "Tour of the Louvre",
      description: "A guided tour through the famous Louvre museum.",
      audioPath: "/audio/louvre_tour.mp3");
  mockDatabase.addAudioGuide("01", firstAudioGuide);

  // Hinzufügen Ihres zweiten AudioGuides in die Datenbank
  AudioGuide secondAudioGuide = AudioGuide(
      title: "Eiffel Tower Facts",
      description: "Interesting facts about the Eiffel Tower.",
      audioPath: "/audio/eiffel_tower_facts.mp3");
  mockDatabase.addAudioGuide("02", secondAudioGuide);

  // Alle AudioGuides erhalten
  List<AudioGuide> allAudioGuides = mockDatabase.getAllAudioGuides();
  print("All Audio Guides:");
  for (var audioGuide in allAudioGuides) {
    print(
        "Title: ${audioGuide.title}, Description: ${audioGuide.description}, Audio Path: ${audioGuide.audioPath}");
  }

  // Einen bestimmten AudioGuide erhalten
  AudioGuide? audioGuide = mockDatabase.getAudioGuideById("01");
  if (audioGuide != null) {
    print("\nAudio Guide with ID '01':");
    print(
        "Title: ${audioGuide.title}, Description: ${audioGuide.description}, Audio Path: ${audioGuide.audioPath}");
  }

  // Einen AudioGuide löschen
  mockDatabase.removeAudioGuide("02");
  print("\nAfter removing audio guide with ID '02':");
  allAudioGuides = mockDatabase.getAllAudioGuides();
  for (var audioGuide in allAudioGuides) {
    print(
        "Title: ${audioGuide.title}, Description: ${audioGuide.description}, Audio Path: ${audioGuide.audioPath}");
  }

  // Aktualisieren eines AudioGuides (Hinzufügen und Überschreiben eines AudioGuides)
  AudioGuide updatedAudioGuide = AudioGuide(
      title: "Updated Tour of the Louvre",
      description: "An updated guided tour through the famous Louvre museum.",
      audioPath: "/audio/updated_louvre_tour.mp3");
  mockDatabase.addAudioGuide("01", updatedAudioGuide);
  audioGuide = mockDatabase.getAudioGuideById("01");
  if (audioGuide != null) {
    print("\nAfter updating audio guide with ID '01':");
    print(
        "Title: ${audioGuide.title}, Description: ${audioGuide.description}, Audio Path: ${audioGuide.audioPath}");
  }
}
