class Closing {
  Closing(this.closingNumber, this.participants);

  final int closingNumber;
  final List<dynamic> participants;

  Closing.fromJson(Map<String, dynamic> json)
      : closingNumber = json['ClosingNumber'],
        participants = json['Participants'];

  Map<String, dynamic> toJson() {
    return {
      'ClosingNumber': closingNumber,
      'Participants': participants,
    };
  }
}
