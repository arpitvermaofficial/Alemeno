import 'package:flutter/material.dart';
import 'package:alemeno/Utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test_card extends StatefulWidget {
  Function callback;
  final String test_name;
  final String oldprice;
  final String newprice;
  final String tests;
  Test_card({
    required this.callback,
    Key? key, required this.test_name, required this.oldprice, required this.newprice, required this.tests,
  }) : super(key: key);

  @override
  State<Test_card> createState() => _Test_cardState();
}

class _Test_cardState extends State<Test_card> {
  @override
  bool pressed = false;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 27,
          decoration: BoxDecoration(
            color: lightblue,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          ),
          child: Center(
              child: Text(
            widget.test_name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Includes ${widget.tests} tests",
                    style: TextStyle(color: lightblue, fontSize: 15),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: tealcolor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: SvgPicture.asset(
                      'assets/shield.svg',
                      height: 15,
                      width: 15,
                    ),
                  )
                ],
              ),
              Text(
                "Get reports in 24 hours",
                style: const TextStyle(fontSize: 10),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text(
                    "\u{20B9} ${widget.newprice}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: darkblue),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("${widget.oldprice}",
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 11)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (!pressed) {
                    pressed = !pressed;
                    widget.callback(1);
                  }
                },
                child: Container(
                  height: 30,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: pressed ? tealcolor : darkblue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      pressed ? "Added to Cart" : "Add to Cart",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 30,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: darkblue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "View Details",
                    style: TextStyle(color: darkblue),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
