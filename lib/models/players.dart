class Players {
  final int? closingID;
  final int? closingPlayerID;
  final int? customerID;
  final String? customerName;
  final String? companyName;
  final String? email;
  final String? trackerDisplayAlias;
  final String? playerRole;
  final String? playerRoleDescription;
  final String? orderStatus;
  final String? itsMe;

  Players(this.closingID, this.closingPlayerID, this.customerID, this.customerName, this.companyName, this.email, this.trackerDisplayAlias, this.playerRole, this.playerRoleDescription, this.orderStatus, this.itsMe);

  Players.fromJson(Map<String, dynamic> json)
      : closingID = json['ClosingID'],
        closingPlayerID = json['ClosingPlayerID'],
        customerID = json['CustomerID'],
        customerName = json['CustomerName'],
        companyName = json['CompanyName'],
        email = json['Email'],
        trackerDisplayAlias = json['TrackerDisplayAlias'],
        playerRole = json['PlayerRole'],
        playerRoleDescription = json['PlayerRoleDescription'],
        orderStatus = json['OrderStatus'],
        itsMe = json['ItsMe'];

  Map<String, dynamic> toJson() {
    return {
      'ClosingID': closingID,
      'ClosingPlayerID': closingPlayerID,
      'CustomerID': customerID,
      'CustomerName': customerName,
      'CompanyName': companyName,
      'Email': email,
      'TrackerDisplayAlias': trackerDisplayAlias,
      'PlayerRole': playerRole,
      'PlayerRoleDescription': playerRoleDescription,
      'OrderStatus': orderStatus,
      'ItsMe': itsMe,
    };
  }
}
