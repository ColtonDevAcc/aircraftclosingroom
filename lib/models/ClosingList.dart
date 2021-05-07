class ClosingList {
  final int closingID;
  final String tailNumber;
  final String make;
  final String model;
  final String sNumber;
  final String orderDate;
  final String agentName;
  final String status;
  final String objType;

  ClosingList(this.closingID, this.tailNumber, this.make, this.model, this.sNumber, this.orderDate, this.agentName, this.status, this.objType);

  ClosingList.fromJson(Map<String, dynamic> json)
      : closingID = json['ClosingID'],
        tailNumber = json['TailNumber'],
        make = json['Make'],
        model = json['Model'],
        sNumber = json['SN'],
        orderDate = json['OrderDate'],
        agentName = json['AgentName'],
        status = json['Status'],
        objType = json['InvObjType'];

  Map<String, dynamic> toJson() {
    return {
      'ClosingID': closingID,
      'TailNumber': tailNumber,
      'Make': make,
      'Model': model,
      'SN': sNumber,
      'OrderDate': orderDate,
      'AgentName': agentName,
      'Status': status,
      'InvObjType': objType,
    };
  }
}
