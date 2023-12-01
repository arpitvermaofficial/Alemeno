  import 'package:flutter/material.dart';
  import 'package:flutter_svg/svg.dart';

  import '../../Utils/colors.dart';
  import 'package:intl/intl.dart';

  class Success extends StatelessWidget {
    final DateTime SheduledDateTiime;
    const Success({super.key, required this.SheduledDateTiime});

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Success",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.blue,
                ),
              )
            ],
          ),
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  height: size.height * 0.5,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/success.svg',
                          ),
                          Positioned(
                            top: 50,
                            left: 60,
                            child: SvgPicture.asset(
                              'assets/calendar.svg',
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Lab tests have been\n scheduled successfully, You\n will receive a mail of the same.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                          "${DateFormat.yMMMd().format(SheduledDateTiime).toString()}.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black)),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: size.height * 0.06,
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: darkblue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Back to home",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
    }
  }
