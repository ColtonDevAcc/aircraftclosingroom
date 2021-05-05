class PlayerDocs {
  PlayerDocs(
    this.escrowCategoryTransactionId,
    this.name,
    this.received,
    this.dateReceived,
    this.documentID,
    this.status,
    this.date,
    this.fileType,
  );

  final int escrowCategoryTransactionId;
  final String name;
  final bool received;
  final String dateReceived;
  final int documentID;
  final String status;
  final String date;
  final String fileType;

  PlayerDocs.fromJson(Map<String, dynamic> json)
      : escrowCategoryTransactionId = json['EscrowCategoryTransactionId'],
        name = json['Name'],
        received = json['Received'],
        dateReceived = json['DateReceived'],
        documentID = json['DocumentID'],
        status = json['Status'],
        date = json['Date'],
        fileType = json['FileType'];

  Map<String, dynamic> toJson() {
    return {
      'EscrowCategoryTransactionId': escrowCategoryTransactionId,
      'Name': name,
      'Received': received,
      'DateReceived': dateReceived,
      'DocumentID': documentID,
      'Status': status,
      'Date': date,
      'FileType': fileType,
    };
  }
}
