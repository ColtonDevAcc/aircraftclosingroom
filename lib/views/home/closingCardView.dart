import 'dart:convert';
import 'dart:math';

import 'package:aircraftclosingroom/core/global.dart';
import 'package:aircraftclosingroom/models/folder.dart';
import 'package:aircraftclosingroom/models/players.dart';
import 'package:aircraftclosingroom/services/userinfo_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ClosingCardView extends StatelessWidget {
  final int? closingID;
  final String? tailNumber;
  final String? make;
  final String? model;
  final String? sNumber;
  final String? orderDate;
  final String? agentName;
  final String? status;
  final String? invObjType;
  final String? title;
  final Color? color;

  const ClosingCardView({Key? key, this.color, this.title, this.closingID, this.tailNumber, this.make, this.model, this.sNumber, this.orderDate, this.agentName, this.status, this.invObjType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    ScrollController _controller = ScrollController();
    List<Color> randomColorList = [Global.secondaryAccent, Global.primaryAccent, Global.thirdAccent];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(this.title!),
      ),
      body: Column(
        children: [
          Text('Closing Details', style: TextStyle(color: Global.secondaryTextColor)),
          Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Global.secondaryButton,
              child: Container(
                margin: EdgeInsets.all(10),
                width: _screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Closing ID:', style: TextStyle(color: Global.secondaryTextColor)),
                    Text('$closingID', style: TextStyle(color: Global.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Tail Number:', style: TextStyle(color: Global.secondaryTextColor)),
                    Text('$tailNumber', style: TextStyle(color: Global.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Make:', style: TextStyle(color: Global.secondaryTextColor)),
                    Text('$make', style: TextStyle(color: Global.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Model:', style: TextStyle(color: Global.secondaryTextColor)),
                    Text('$model', style: TextStyle(color: Global.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Serial Number:', style: TextStyle(color: Global.secondaryTextColor)),
                    Text('$sNumber', style: TextStyle(color: Global.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Order Date:', style: TextStyle(color: Global.secondaryTextColor)),
                    Text('$orderDate', style: TextStyle(color: Global.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Agent Name:', style: TextStyle(color: Global.secondaryTextColor)),
                    Text('$agentName', style: TextStyle(color: Global.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Status:', style: TextStyle(color: Global.secondaryTextColor)),
                    Text('$status', style: TextStyle(color: Global.bodyTextColor)),
                    SizedBox(height: 10),
                    Text('Part Type:', style: TextStyle(color: Global.secondaryTextColor)),
                    Text('$invObjType', style: TextStyle(color: Global.bodyTextColor)),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 185,
            child: FutureBuilder(
                future: _playerList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      height: 185,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return closingPlayersList(
                            name: snapshot.data[index].customerName,
                            color: color,
                            playerRole: snapshot.data[index].playerRole,
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        child: Text('loading player list...'),
                      ),
                    );
                  }
                } // else here ,
                ),
          ),
          Container(
            height: 90,
            child: FutureBuilder(
                future: _documentFolder(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    return Container(
                      height: 185,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return documentList(
                            color: color,
                            folderName: snapshot.data[index].customLabel.toString(),
                            dateRecieved: snapshot.data[index].dateReceived.toString(),
                            folderID: snapshot.data[index].escrowCategoryTransactionId.toString(),
                            context: context,
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Container(
                        child: Text('loading document folder list...'),
                      ),
                    );
                  }
                } // else here ,
                ),
          )
        ],
      ),
    );
  }

  Future<List<Players>> _playerList() async {
    Uri getURL = Uri.parse('https://aicvirtualclosings.com/api/mobile/closingplayers/${this.closingID}/${UserInfo.userSecretKey}');
    var data = await http.get(getURL);
    var jsonData = json.decode(data.body);
    List<Players> playerList = [];

    for (var player in jsonData) {
      Players newPlayer = Players(
        player['ClosingID'],
        player['ClosingPlayerID'],
        player['CustomerID'],
        player['CustomerName'],
        player['CompanyName'],
        player['Email'],
        player['TrackerDisplayAlias'],
        player['PlayerRole'],
        player['PlayerRoleDescription'],
        player['OrderStatus'],
        player['ItsMe'],
      );
      playerList.add(newPlayer);
    }

    return playerList;
  }
}

Future<List<Folder>> _documentFolder() async {
  Uri getURL = Uri.parse('https://aicvirtualclosings.com/api/mobile/PlayerCategories/${UserInfo.customerID}/${UserInfo.userSecretKey}');
  var data = await http.get(getURL);
  var jsonData = json.decode(data.body);
  List<Folder> documentFolderList = [];

  for (var documentFolder in jsonData) {
    Folder newDocumentFolder = Folder(
      documentFolder['EscrowCategoryTransactionsId'],
      documentFolder['Name'],
      documentFolder['CustomLabel'],
      documentFolder['Received'],
      documentFolder['DateReceived'],
    );
    documentFolderList.add(newDocumentFolder);
  }
  print('loaded folders :)');
  return documentFolderList;
}

//=============================================
//player profiles
//=============================================
Padding closingPlayersList({context: dynamic, color: Color, name: String, playerRole: String}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
    child: Container(
      width: 150,
      child: InkWell(
        child: Card(
          elevation: 2.0,
          shadowColor: Colors.black,
          color: color == Global.primaryAccent ? Global.secondaryAccent : Global.secondaryAccent,
          shape: CircleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(name, style: TextStyle(color: Global.primaryTextColor)),
                    Text('-- ' + playerRole + ' --', style: TextStyle(color: Global.primaryTextColor)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

//=============================================
//document folders
//=============================================
Padding documentList({context: dynamic, color: Colors, folderName: String, dateRecieved: String, folderID: String}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
    child: Container(
      width: 300,
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 2.0,
          shadowColor: Colors.black,
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(flex: 1),
              Text(folderName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
              Text('Date recived: ' + dateRecieved),
              Text('Folder id: ' + folderID),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    ),
  );
}
