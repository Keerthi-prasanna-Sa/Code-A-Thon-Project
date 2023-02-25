import 'package:flutter/material.dart';
import 'package:finance_app/data/utlity.dart';


class setBudget extends StatefulWidget {
  final Function(int) callback;

  setBudget({required this.callback});

  @override
  State<setBudget> createState() => _setBudgetState();
}

class _setBudgetState extends State<setBudget> {
  var Spent = double.parse((-expenses()/income()).toStringAsFixed(2));
  RangeValues values = RangeValues(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff368983),
        title: Text(
                'Budget',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Set your budget by draging the slider",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Color(0xff368983),
                inactiveTrackColor: Color(0x14f368983),
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 8.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Color(0xff368983),
                overlayColor: Color(0xff368983).withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Color(0xff368983),
                inactiveTickMarkColor: Color(0xff368983),
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Color(0xff368983),
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: RangeSlider(
                values: values,
                min: 0,
                max: income().toDouble(),
                divisions: 100,
                activeColor: Color(0xff368983),
                labels: RangeLabels(
                  values.start.round().toString(),
                  values.end.round().toString(),
                ),
                onChanged: (values) {
                  setState(() {
                    this.values = values;
                });
                 }
              ),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                Text("Your budget will be set as: " + values.end.toStringAsFixed(0),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {
                  setState(() {
                    int end_Value = values.end.toInt();
                    widget.callback(end_Value);
                    Navigator.of(context).pop();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff368983),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Text("Set Budget"))
              ],
            ),
          ]
        )
      )
    );
  }
}
