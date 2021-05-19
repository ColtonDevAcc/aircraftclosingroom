class LogInUser {
  final int customerID;
  final String customerName;
  final String companyName;
  final String email;
  final String photoIdRequired;
  final String photoIdOnFile;
  String? playerID;

  LogInUser(this.customerID, this.customerName, this.companyName, this.email, this.photoIdRequired, this.photoIdOnFile, this.playerID);

  LogInUser.fromJson(Map<String, dynamic> json)
      : customerID = json['CustomerID'],
        customerName = json['CustomerName'],
        companyName = json['CompanyName'],
        email = json['Email'],
        photoIdRequired = json['PhotoIdRequired'],
        photoIdOnFile = json['PhotoIdOnFile'];

  Map<String, dynamic> toJson() {
    return {
      'CustomerID': customerID,
      'CustomerName': customerName,
      'CompanyName': companyName,
      'Email': email,
      'PhotoIdRequired': photoIdRequired,
      'PhotoIdOnFile': photoIdOnFile,
    };
  }
}
