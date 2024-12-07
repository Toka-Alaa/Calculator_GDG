import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    home: Calculator(),
    debugShowCheckedModeBanner: false,
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String txt ='';
  String res = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text("Calculator"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    txt == '' ? 0.toString() : txt,
                    style: const TextStyle(fontSize: 40),),
                  Text(res,style: const TextStyle(fontSize: 40),),
                  Container(width: 50,height: 3,color: Colors.black,)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(text: 'AC', clr: Colors.orange.shade100, ontap: (){
                  setState(() {
                    txt = '';
                    res = '';
                  });
                }),
                Buttons(text: 'DEL', clr: Colors.pink.shade50, ontap: (){
                  setState(() {
                    txt = txt.substring(0, txt.length - 1);
                  });
                }),
                Buttons(text: '%', clr: Colors.pink.shade50, ontap: (){
                  if (txt.isEmpty ||
                      (txt[txt.length - 1] == '*' ||
                          txt[txt.length - 1] == '/' ||
                          txt[txt.length - 1] == '+' ||
                          txt[txt.length - 1] == '%' ||
                          txt[txt.length - 1] == '-')) {
                  } else {
                    setState(() {
                      txt += '%';
                    });
                  }}),
                Buttons(text: '/', clr: Colors.pink.shade50, ontap: (){
                  if (txt.isEmpty ||
                      (txt[txt.length - 1] == '*' ||
                          txt[txt.length - 1] == '/' ||
                          txt[txt.length - 1] == '+' ||
                          txt[txt.length - 1] == '-')) {
                  } else {
                    setState(() {
                      txt += '/';
                    });
                  }}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(text: '7', clr: Colors.grey.shade200, ontap: (){
                  setState(() {
                    txt +='7';
                  });
                }),
                Buttons(text: '8', clr: Colors.grey.shade200, ontap: (){
                  setState(() {
                    txt +='8';
                  });
                }),
                Buttons(text: '9', clr: Colors.grey.shade200, ontap: (){
                  setState(() {
                    txt +='9';
                  });
                }),
                Buttons(text: '*', clr: Colors.pink.shade50, ontap: (){
                  if (txt.isEmpty ||
                      (txt[txt.length - 1] == '*' ||
                          txt[txt.length - 1] == '/' ||
                          txt[txt.length - 1] == '+' ||
                          txt[txt.length - 1] == '-')) {
                  } else {
                    setState(() {
                      txt += '*';
                    });
                  }
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(text: '4', clr: Colors.grey.shade200, ontap: (){
                  setState(() {
                    txt +='4';
                  });
                }),
                Buttons(text: '5', clr: Colors.grey.shade200, ontap: (){
                  setState(() {
                    txt +='5';
                  });
                }),
                Buttons(text: '6', clr: Colors.grey.shade200, ontap: (){
                  setState(() {
                    txt +='6';
                  });}),
                Buttons(text: '-', clr: Colors.pink.shade50, ontap: (){
                  if (txt.isEmpty ||
                      (txt[txt.length - 1] == '*' ||
                          txt[txt.length - 1] == '/' ||
                          txt[txt.length - 1] == '+' ||
                          txt[txt.length - 1] == '-')) {
                  } else {
                    setState(() {
                      txt += '-';
                    });
                  }
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(text: '1', clr: Colors.grey.shade200, ontap: (){
                  setState(() {
                    txt +='1';
                  });
                }),
                Buttons(text: '2', clr: Colors.grey.shade200, ontap: (){
                  setState(() {
                    txt +='2';
                  });
                }),
                Buttons(text: '3', clr: Colors.grey.shade200, ontap: (){
                  setState(() {
                    txt +='3';
                  });
                }),
                Buttons(text: '+', clr: Colors.pink.shade50, ontap: (){
                  if (txt.isEmpty ||
                      (txt[txt.length - 1] == '*' ||
                          txt[txt.length - 1] == '/' ||
                          txt[txt.length - 1] == '+' ||
                          txt[txt.length - 1] == '-')) {
                  } else {
                    setState(() {
                      txt += '+';
                    });
                  }
                }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Buttons(text: '00', clr: Colors.grey.shade200, ontap: (){
                    setState(() {
                      txt +='00';
                    });
                  }),
                  Buttons(text: '.', clr: Colors.grey.shade200, ontap: (){
                    setState(() {
                      txt +='.';
                    });
                  }),
                  Buttons(text: '0', clr: Colors.grey.shade200, ontap: (){
                    setState(() {
                      txt +='0';
                    });
                  }),
                  Buttons(
                    text: '=',
                    clr: Colors.pink.shade50,
                    ontap: () {
                      try {
                        Parser p = Parser();
                        Expression exp = p.parse(txt);
                        String result = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
                        setState(() {
                          res = result;
                        });
                      } catch (e) {
                        setState(() {
                          txt = 'Syntax Error';
                        });
                      }
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String text;
  final Color clr;
  final Function() ontap ;
  const Buttons({super.key, required this.text, required this.clr, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      ontap();
    },
        style: ElevatedButton.styleFrom(
          backgroundColor: clr,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(28),
        ), child: Text(text,style: const TextStyle(color: Colors.black),));
  }
}
