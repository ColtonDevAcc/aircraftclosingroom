import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DocumentFolderView extends StatelessWidget {
  final String? escrowCategoryTransactionId;
  final String? name;
  final String? dateRecieved;
  final String? customLabel;
  final Color? color;

  const DocumentFolderView({Key? key, this.escrowCategoryTransactionId, this.name, this.dateRecieved, this.customLabel, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    ScrollController _controller = ScrollController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: Text(customLabel.toString()),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Text('Folder Details', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
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
                      Text('Escrow category transaction ID:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                      Text('$escrowCategoryTransactionId', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                      SizedBox(height: 10),
                      Text('Folder name:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                      Text('$name', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                      SizedBox(height: 10),
                      Text('Date Recieved:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                      Text('$dateRecieved', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                      SizedBox(height: 10),
                      Text('Custom Label:', style: TextStyle(color: ThemeProvider.secondaryTextColor)),
                      Text('$customLabel', style: TextStyle(color: ThemeProvider.bodyTextColor)),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
