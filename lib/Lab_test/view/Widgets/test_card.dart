import 'package:flutter/material.dart';
import 'package:alemeno/Utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test_card extends StatelessWidget {
  const Test_card({super.key});

  @override
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
          child: const Center(
              child: Text(
            "Thyroid Profile",
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
                    "Includes 3 tests",
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
                    "\u{20B9} 200",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, color: darkblue),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("300",
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 11)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: darkblue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
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
