import 'dart:convert';

import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:aircraftclosingroom/models/folder.dart';
import 'package:aircraftclosingroom/models/players.dart';
import 'package:aircraftclosingroom/services/userinfo_service.dart';
import 'package:aircraftclosingroom/views/home/documentFolderView.dart';
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
    List<Color> randomColorList = [ThemeProvider.secondaryAccent, ThemeProvider.primaryAccent, ThemeProvider.thirdAccent];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(this.title!),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Text('Closing Details', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: ThemeProvider.secondaryButton,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: _screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Closing ID:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                        Text('$closingID', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                        SizedBox(height: 10),
                        Text('Tail Number:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                        Text('$tailNumber', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                        SizedBox(height: 10),
                        Text('Make:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                        Text('$make', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                        SizedBox(height: 10),
                        Text('Model:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                        Text('$model', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                        SizedBox(height: 10),
                        Text('Serial Number:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                        Text('$sNumber', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                        SizedBox(height: 10),
                        Text('Order Date:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                        Text('$orderDate', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                        SizedBox(height: 10),
                        Text('Agent Name:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                        Text('$agentName', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                        SizedBox(height: 10),
                        Text('Status:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                        Text('$status', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                        SizedBox(height: 10),
                        Text('Part Type:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                        Text('$invObjType', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              Text('Players', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
              SizedBox(height: 10),
              Container(
                child: FutureBuilder(
                    future: _playerList(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data != null) {
                        return Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return closingPlayersList(
                                name: snapshot.data[index].customerName,
                                color: index.toDouble() % 2.0 != 0 ? Colors.white.withOpacity(0) : color,
                                playerRole: snapshot.data[index].playerRole,
                                screenWidth: _screenWidth,
                                closingID: snapshot.data[index].closingID,
                                email: snapshot.data[index].email,
                                companyName: snapshot.data[index].companyName,
                                closingPlayerID: snapshot.data[index].closingPlayerID,
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
            ],
          ),
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

Future<List<Folder>> _documentFolder({playerID: String}) async {
  Uri getURL = Uri.parse('https://aicvirtualclosings.com/api/mobile/PlayerCategories/$playerID/${UserInfo.userSecretKey}');
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
Padding closingPlayersList({context: dynamic, color: Color, name: String, playerRole: String, screenWidth: double, closingID: String, closingPlayerID: String, companyName: String, email: String}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
    child: Container(
      child: InkWell(
        child: Card(
          shadowColor: Colors.black.withOpacity(0),
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(name, style: TextStyle(color: color == Colors.white.withOpacity(0) ? ThemeProvider.secondaryTextColor : ThemeProvider.primaryTextColor)),
                    Text('-- ' + playerRole + ' --', style: TextStyle(color: color == Colors.white.withOpacity(0) ? ThemeProvider.secondaryTextColor : ThemeProvider.primaryTextColor)),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: ThemeProvider.secondaryButton,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: screenWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Name:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                              Text('$name', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                              SizedBox(height: 10),
                              Text('Email:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                              Text('$email', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                              SizedBox(height: 10),
                              Text('companyName:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                              Text('$companyName', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                              SizedBox(height: 10),
                              //this is the document text ('Document')
                              Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Documents', style: TextStyle(color: ThemeProvider.secondaryTextColor))]),
                              FutureBuilder(
                                future: _documentFolder(playerID: closingPlayerID),
                                builder: (BuildContext context, AsyncSnapshot snapshot) {
                                  if (snapshot.data != null) {
                                    return Container(
                                      child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          return playerDocumentList(
                                            escrowCategoryTransactionID: 'ff',
                                            folderName: snapshot.data[index].customLabel,
                                            recieved: snapshot.data[index].received.toString(),
                                            dateRecieved: snapshot.data[index].dateReceived.toString(),
                                            folderID: snapshot.data[index].escrowCategoryTransactionId.toString(),
                                            color: Colors.white,
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      child: Center(
                                        child: Text('Loading player documents....'),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
Padding playerDocumentList({color: Colors, folderName: String, dateRecieved: String, folderID: String, escrowCategoryTransactionID: String, recieved: String}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
    child: Container(
      width: 50,
      height: 90,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Text('Name: ' + folderName, style: TextStyle(color: ThemeProvider.secondaryTextColor, fontWeight: FontWeight.w500)),
            dateRecieved != 'null' ? Icon(Icons.done, color: Colors.green) : Icon(Icons.close, color: Colors.red),
            Spacer(flex: 1),
          ],
        ),
      ),
    ),
  );
}

/*
Text('Document Folders', style: TextStyle(color: Global.secondaryTextColor)),
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
*/
