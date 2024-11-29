abstract class Endpoints {
  static const String notes = '/notes';
  static String noteById(String id) => '$notes/$id';
}
