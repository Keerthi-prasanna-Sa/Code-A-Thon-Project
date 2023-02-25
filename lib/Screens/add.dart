import 'package:flutter/material.dart';
import 'package:finance_app/data/model/add_date.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  final box = Hive.box<Add_data>('data');
  DateTime date = new DateTime.now();
  String? selctedItem;
  String? selctedItemi;
  final TextEditingController expalin_C = TextEditingController();
  FocusNode ex = FocusNode();
  final TextEditingController amount_c = TextEditingController();
  FocusNode amount_ = FocusNode();
  final List<String> _item = [
    "Food",
    "Transfers",
    "Transportation",
    "Education",
    "Gift",
    "Entertainment",
    "Health",
    "Others",
  ];
  final List<String> _itemei = [
    'Income',
    "Expense",
  ];
  @override
  void initState() {
    super.initState();
    ex.addListener(() {
      setState(() {});
    });
    amount_.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Transaction',
        style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
        ),
        backgroundColor: Color(0xff368983),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            background_container(context),
            Positioned(
              top: 30,
              child: main_container(),
            ),
          ],
        ),
      ),
    );
  }

  Container main_container() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 5, color: Color(0xff368983)),
        color: Colors.white,
      ),
      height: 520,
      width: 360,
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                        Icons.batch_prediction_rounded,
                        color: Color(0xff368983),
                      ),
              name(),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                        Icons.article_rounded,
                        color: Color(0xff368983),
                      ),
              explain(),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                        Icons.currency_rupee_rounded,
                        color: Color(0xff368983),
                      ),
              amount(),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                        Icons.swap_vert_rounded,
                        color: Color(0xff368983),
                      ),
              How(),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                        Icons.calendar_today_rounded,
                        color: Color(0xff368983),
                      ),
              date_time(),
            ],
          ),
          SizedBox(height: 30),
          save(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector(
      onTap: () {
        var add = Add_data(
            selctedItemi!, amount_c.text, date, expalin_C.text, selctedItem!);
        box.add(add);
        Navigator.of(context).pop();
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff368983),
        ),
        width: 120,
        height: 50,
        child: Text(
          'Save',
          style: TextStyle(
            fontFamily: 'f',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffC5C5C5))),
      width: 280,
      height: 50,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100));
          if (newDate == Null) return;
          setState(() {
            date = newDate!;
          });
        },
        child: Text(
          'Date : ${date.year} / ${date.day} / ${date.month}',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  SizedBox How() {
    return SizedBox(
      height: 50,
      width: 280,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Color(0xffC5C5C5),
          ),
        ),
        child: DropdownButton<String>(
          value: selctedItemi,
          onChanged: ((value) {
            setState(() {
              selctedItemi = value!;
            });
          }),
          items: _itemei
              .map((e) => DropdownMenuItem(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(
                            e,
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    value: e,
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _itemei
              .map((e) => Row(
                    children: [Text(e)],
                  ))
              .toList(),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'How',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  SizedBox amount() {
    return SizedBox(
      height: 50,
      width: 280,
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amount_,
        controller: amount_c,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Amount',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xff368983))),
        ),
      ),
    );
  }

  SizedBox explain() {
    return SizedBox(
      height: 50,
      width: 280,
      child: TextField(
        focusNode: ex,
        controller: expalin_C,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Description',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xff368983))),
        ),
      ),
    );
  }

  SizedBox name() {
    return SizedBox(
      height: 50,
      width: 280,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Color(0xffC5C5C5),
          ),
        ),
        child: DropdownButton<String>(
          value: selctedItem,
          onChanged: ((value) {
            setState(() {
              selctedItem = value!;
            });
          }),
          items: _item
              .map((e) => DropdownMenuItem(
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset('images/${e}.png',
                            width: 30,
                            height: 30,),
                          ),
                          SizedBox(width: 10),
                          Text(
                            e,
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    value: e,
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => _item
              .map((e) => Row(
                    children: [
                      Container(
                        child: Image.asset('images/${e}.png',
                        width: 30,
                        height: 30,),
                      ),
                      SizedBox(width: 10),
                      Text(e)
                    ],
                  ))
              .toList(),
          hint: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Category',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }

  Column background_container(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Color(0xff368983),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        )
      ]
    );
  }
}
