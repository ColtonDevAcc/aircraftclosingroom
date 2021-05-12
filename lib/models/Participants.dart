class Participants {
  Participants(this.name, this.role, this.status, this.idDocument,
      this.document1, this.document2);

  final String name;
  final String role;
  final int status;
  final String idDocument;
  final String document1;
  final String document2;

  Participants.fromJson(Map<String, dynamic> json)
      : name = json['Name'],
        role = json['Role'],
        status = json['Status'],
        idDocument = json['IdDocument'],
        document1 = json['Document1'],
        document2 = json['Document2'];

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Role': role,
      'Status': status,
      'IdDocument': idDocument,
      'Document1': document1,
      'Document2': document2
    };
  }
}
