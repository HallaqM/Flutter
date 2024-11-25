class Studant {
  String name;
  String id;
  List<dynamic> marks;
  Studant({required this.name, required this.id, required this.marks});

  String toString() {
    String marks = "";
    this.marks.forEach(
          (element) => marks += "$element /",
        );

    return "name: " + this.name + " id: " + this.id + " marks: " + marks;
  }

  factory Studant.fj(Map<String, dynamic> data) {
    return Studant(name: data["name"], id: data["id"], marks: data["marks"] );
  }
}
