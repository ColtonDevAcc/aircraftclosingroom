import 'dart:convert';
import 'dart:math';
import 'package:aircraftclosingroom/core/themeProvider.dart';
import 'package:aircraftclosingroom/models/ClosingList.dart';
import 'package:aircraftclosingroom/services/userinfo_service.dart';
import 'package:aircraftclosingroom/views/home/closingCardView.dart';
import 'package:aircraftclosingroom/widgets/FeaturedCardWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ScrollController _controller = ScrollController();

    double screenHeight = MediaQuery.of(context).size.height.toDouble();
    double screenWidth = MediaQuery.of(context).size.height.toDouble();
    List<Color> randomColorList = [ThemeProvider.secondaryAccent, ThemeProvider.primaryAccent, ThemeProvider.thirdAccent];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        largeFeaturedCardWidget(screenHeight: screenHeight / 2, screenWidth: screenWidth / 3.5, title: '${UserInfo.customerName}\'s Closings', useAsAppBar: false, displayImage: true),
        //column that displays header text 'objectives/browse'
        Column(
          children: [
            SizedBox(height: 2),
            Text('Objectives', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500, color: ThemeProvider.secondaryTextColor)),
            SizedBox(height: 2),
            Text('Browse', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: ThemeProvider.secondaryTextColor)),
          ],
        ),
        Spacer(flex: 1),
        Container(
          //height of the cards. I dont know why the cards dont correlate with the defined height and width of the
          //variables provided in the custom widget
          height: 185,
          child: FutureBuilder(
            future: _closingList(),
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
                      return closingCardsWidget(
                        transparent: false,
                        context: context,
                        featuredPicture: snapshot.data[index].objType.toString() == 'Airframe' ? AssetImage('assets/images/airframe.png') : AssetImage('assets/images/Aircraft_Jet_Engine.png'),
                        color: randomColorList[Random().nextInt(3)],
                        title: snapshot.data[index].objType.toString() + " " + snapshot.data[index].sNumber.toString(),
                        closingID: snapshot.data[index].closingID,
                        tailNumber: snapshot.data[index].tailNumber,
                        make: snapshot.data[index].make,
                        model: snapshot.data[index].model,
                        sNumber: snapshot.data[index].sNumber,
                        orderDate: snapshot.data[index].orderDate,
                        agentName: snapshot.data[index].agentName,
                        status: snapshot.data[index].status,
                        invObjType: snapshot.data[index].objType,
                      );
                    },
                  ),
                );
              } else {
                return Container(
                  child: Center(
                    child: Container(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(ThemeProvider.primaryColor),
                        backgroundColor: ThemeProvider.secondaryAccent,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
        Spacer(flex: 1)
      ],
    );
  }
}

Future<List<ClosingList>> _closingList() async {
  Uri getURL = Uri.parse('https://aicvirtualclosings.com/api/mobile/closings/${UserInfo.userSecretKey}');
  var data = await http.get(getURL);
  var jsonData = json.decode(data.body);
  List<ClosingList> closingList = [];

  for (var closing in jsonData) {
    ClosingList closingListNew = ClosingList(
      closing['ClosingID'],
      closing['TailNumber'],
      closing['Make'],
      closing['Model'],
      closing['SN'],
      closing['OrderDate'],
      closing['AgentName'],
      closing['Status'],
      closing['InvObjType'],
    );
    closingList.add(closingListNew);
  }

  return closingList;
}

Padding closingCardsWidget({context: dynamic, color: Colors, transparent: bool, title: String, featuredPicture: AssetImage, closingID: int, tailNumber: String, make: String, model: String, sNumber: String, orderDate: String, agentName: String, status: String, invObjType: String}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
    child: Container(
      width: transparent ? 40 : 163,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClosingCardView(
                closingID: closingID,
                tailNumber: tailNumber,
                make: make,
                model: model,
                sNumber: sNumber,
                orderDate: orderDate,
                agentName: agentName,
                status: status,
                invObjType: invObjType,
                title: title,
                color: color,
              ),
            ),
          );
        },
        child: Card(
          elevation: transparent ? 0.0 : 2.0,
          shadowColor: transparent ? Colors.white.withOpacity(0) : Colors.black,
          color: transparent ? Colors.white.withOpacity(0) : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(flex: 2),
              Container(
                height: 80,
                decoration: transparent
                    ? null
                    : BoxDecoration(
                        image: DecorationImage(
                          image: featuredPicture,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
              ),
              Spacer(flex: 1),
              Text(title, style: TextStyle(color: transparent ? Colors.white.withOpacity(0) : Colors.white, fontWeight: FontWeight.w500)),
              Spacer(flex: 2)
            ],
          ),
        ),
      ),
    ),
  );
}
