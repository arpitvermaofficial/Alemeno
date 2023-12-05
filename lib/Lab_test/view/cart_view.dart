import 'package:alemeno/Lab_test/view/book_appointmenr.dart';
import 'package:alemeno/Utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import '../model/testModel.dart';
import 'Widgets/datepicker.dart';

class CartView extends StatefulWidget {
  final List<TestModel> allTest;
  CartView({
    Key? key,
    required this.allTest,
  }) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String _textValue = 'Select date';
  int selected_option = -1;
  int total_cost = 0;
  int total_discount = 0;
  @override
  initState() {
    super.initState();
    cost_calculate();
  }

  callback1(newValue) {
    setState(() {
      _textValue = newValue;
    });
  }

  cost_calculate() {
    total_cost = 0;
    total_discount = 0;
    for (int i = 0; i < widget.allTest.length; i++) {
      total_cost = total_cost + int.parse(widget.allTest[i].newPrice);
      total_discount = total_discount +
          (int.parse(widget.allTest[i].oldPrice) -
              int.parse(widget.allTest[i].newPrice));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "My Cart",
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Order Overview",
                style: TextStyle(color: darkblue, fontSize: 20),
              ),
              Container(
                height: size.height * 0.76,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  // scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.allTest.length,
                        itemBuilder: (context, index) => Labcard(
                            widget.allTest[index].name,
                            widget.allTest[index].oldPrice,
                            widget.allTest[index].newPrice,
                            index,
                            context),
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: size.height * 0.02,
                          );
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        height: size.height * 0.1,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: const BoxDecoration(
                          border: Border.fromBorderSide(
                              BorderSide(color: Colors.grey)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              width: size.width * 0.7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: Colors.grey, width: 1)),
                              child: Text(_textValue),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.fromBorderSide(
                              BorderSide(color: Colors.grey)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "M.R.P Total",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "$total_cost",
                                  style: TextStyle(
                                    color: tealcolor,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discount",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "$total_discount",
                                  style: TextStyle(
                                    color: tealcolor,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Amount to be paid",
                                  style: TextStyle(
                                      color: darkblue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "₹ ${total_cost - total_discount}/-",
                                  style: TextStyle(
                                      color: darkblue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Total savings:     ',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '₹ $total_discount/-',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: darkblue)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.fromBorderSide(
                              BorderSide(color: Colors.grey)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Radio(
                                    fillColor: MaterialStateProperty.all<Color>(
                                        darkblue),
                                    value: 1,
                                    groupValue: selected_option,
                                    onChanged: (value) {
                                      setState(() {
                                        selected_option = value!;
                                        print("Button value: $value");
                                      });
                                    }),
                                Text(
                                  "Hard Copy of Reports",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "Reports will be delivered within 3-4 working days. Hard\n copy charges are non-refundable once the reports have\n been dispatched.\n \n ₹150 per person",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (selected_option != -1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                BookApoitment(callback2: this.callback1)));
                  }
                },
                child: Container(
                  height: size.height * 0.06,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: selected_option != -1 ? darkblue : Color(0xffB0B0B0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Shedule",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget Labcard(String test_name, String oldprice, String newprice, int index,
      BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height: 27,
        decoration: const BoxDecoration(
          color: lightblue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        ),
        child: const Text(
          "Pathology tests",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.fromBorderSide(BorderSide(color: Colors.grey)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  test_name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹ $newprice/-",
                      style: TextStyle(
                          color: tealcolor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "$oldprice",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 30,
              width: size.width * 0.3,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: darkblue, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child:  Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.trash,
                    size: 15,
                    color: darkblue,
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        widget.allTest.removeAt(index);
                        cost_calculate();
                      });
                    },
                    child: Text(
                      "Remove",
                      style: TextStyle(color: darkblue, fontSize: 13),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: darkblue, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.file_upload_outlined,
                    size: 15,
                    color: darkblue,
                  ),
                  Text(
                    "Upload prescription (optional)",
                    style: TextStyle(color: darkblue, fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
