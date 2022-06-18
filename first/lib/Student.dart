class Student {
  int? id;
  String? name;
  String? lastName;
  int? grade;

  Student(String name, String lastName, int grade) {
    this.name = name;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withId(int id, String name, String lastName, int grade) {
    this.id = id;
    this.name = name;
    this.lastName = lastName;
    this.grade = grade;
  }

  String? get getName => this.name;

  void set setName(String name) => this.name = name;

  String? get getStatus {
    if (this.grade! >= 50) {
      return 'GEÇTİ';
    } else {
      return 'KALDI';
    }
  }





}
