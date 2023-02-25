
import 'package:finance_app/data/utlity.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';


class suggestion extends StatefulWidget {
  const suggestion({super.key});

  @override
  State<suggestion> createState() => _suggestionState();
  
}

class _suggestionState extends State<suggestion> {
  double Spent() {
    return double.parse((-expenses()/income()).toStringAsFixed(2));
  }
  List<String> investment_tips = [
    "Recurring D's gives 6-7% annual interest",
    "Money Market Acc gives 5-9% annual interest",
    "Debt Instrument gives 7-11% annual interest",
    "Bank FD's gives 5-8% annual interest",
    "Mutual Funds	gives 8-13% annual interest",
    "Corporate D's	gives 7-8% annual interest"
  ];
  List<String> saving_tips = [
    "Keep a track of your expenses",
    "Set a budget and stick to it",
    "Save a portion of your income",
    "Find ways to cut spending",
    "Set savings goals",
    "Pay off your debts"
  ];
  List<String> extreme_saving_tips = [
    "Save some Emergency Fund",
    "Avoid using credit cards",
    "Avoid using loans",
    "Avoid impulse buying",
    "Determine your financial priorities",
    "Make saving automatic"
  ];

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
                    Container(
                      child:CircularPercentIndicator(
                        radius: 105.0,
                        lineWidth: 15.0,
                        animation: true,
                        animationDuration: 2500,
                        curve: Curves.linear,
                        percent: Spent(),
                        animateFromLastPercent: true,
                        center: new Text("Spent\n${Spent()*100}%",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        progressColor: Colors.red,
                        backgroundColor: Color(0xff368983),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spent()<0.5?Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline_rounded,
                                color: Colors.green,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0),
                                    blurRadius: 5,
                                  ),],
                                size: 40,
                              ),
                              Column(
                                children: [
                                  Text("Your Income and expenses are",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )),
                                  Text("balanced, Keep it up",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ],
                              ),
                            ],
                          ):Spent()<0.8?Row(
                            children: [
                              Icon(
                                Icons.warning_rounded,
                                color: Color.fromARGB(255, 255, 236, 61),
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(0, 0),
                                    blurRadius: 5,
                                  ),],
                                size: 40,
                                ),
                              Column(
                                children: [
                                  Text("You Spent more than 50%",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )),
                                  Text("of your income",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ))
                                ],
                              ),
                            ],
                          ):Row(
                            children: [
                              Icon(
                                Icons.warning_rounded,
                                color: Colors.red,
                                size: 40,
                                ),
                              Column(
                                children: [
                                  Text("You are spending too much",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )),
                                  Text("Try to Save more",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ]
                      )
                    )
                  ]
              ),
              SizedBox(height: 20),
              Spent()<0.5?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Here are some investment tips,",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      )),
                      SizedBox(height: 5),
                      Text(investment_tips[Random().nextInt(investment_tips.length)],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      )),
                    ],
              ):Spent()<0.8?Column(
                children: [
                      Text("Here are some Saving tips,",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      )),
                      SizedBox(height: 5),
                      Text(saving_tips[Random().nextInt(saving_tips.length)],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      )),
                    ],
              ):Column(
                children: [
                      Text("Here are some tips you should consider,",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      )),
                      SizedBox(height: 5),
                      Text(extreme_saving_tips[Random().nextInt(extreme_saving_tips.length)],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      )),
                    ],
            ),
        ]
      )
    ); 
  }
}
