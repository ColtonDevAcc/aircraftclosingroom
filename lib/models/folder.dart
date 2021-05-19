class Folder {
  Folder(this.escrowCategoryTransactionsId, this.customLabel, this.name, this.received, this.dateReceived);

  final int? escrowCategoryTransactionsId;
  final String? name;
  final bool? received;
  final String? dateReceived;
  final String? customLabel;

  Folder.fromJson(Map<String, dynamic> json)
      : escrowCategoryTransactionsId = json['EscrowCategoryTransactionsId'],
        name = json['Name'],
        received = json['Received'],
        dateReceived = json['DateReceived'],
        customLabel = json['CustomLabel'];

  Map<String, dynamic> toJson() {
    return {
      'EscrowCategoryTransactionsId': escrowCategoryTransactionsId,
      'Name': name,
      'Received': received,
      'DateReceived': dateReceived,
      'CustomLabel': customLabel,
    };
  }
}

class FolderContents {
  FolderContents(
    this.documentId,
    this.status,
    this.date,
    this.fileType,
  );

  final int? documentId;
  final String? status;
  final String? date;
  final String? fileType;

  FolderContents.fromJson(Map<String, dynamic> json)
      : documentId = json['DocumentID'],
        status = json['Status'],
        date = json['Date'],
        fileType = json['FileType'];

  Map<String, dynamic> toJson() {
    return {
      'DocumentID': documentId,
      'Status': status,
      'Date': date,
      'FileType': fileType,
    };
  }
}
