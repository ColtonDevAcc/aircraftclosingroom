import 'package:flutter/cupertino.dart';

class ClosingCardView extends StatefulWidget {
  @override
  _ClosingCardViewState createState() => _ClosingCardViewState();
}

class _ClosingCardViewState extends State<ClosingCardView> {
  int _currentStep = 0;

  onTapped(int step) {
    setState(() {
      _currentStep = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
