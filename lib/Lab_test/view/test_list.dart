
import 'package:alemeno/Lab_test/model/services/get_tests.dart';
import 'package:alemeno/Lab_test/view/Widgets/test_card.dart';
import 'package:alemeno/Lab_test/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:alemeno/Utils/colors.dart';
import 'package:flutter_svg/svg.dart';

import '../model/testModel.dart';
import '../model/test_data.dart';

class LabTests extends StatefulWidget {
  const LabTests({super.key});

  @override
  State<LabTests> createState() => _LabTestsState();
}

class _LabTestsState extends State<LabTests> {
  List<TestModel> list_of_tests = [];
  List<TestModel> cart_tests =[];
  final GetTests getTests=GetTests();
  @override
  void initState() {
    // TODO: implement initState
    fetchAllTest();
    super.initState();
  }
  void fetchAllTest() {
    list_of_tests=getTests.getAllProducts();;
    setState(() {

    });
  }
  @override
  int product_count=0;
  addToCart(int newvalue) {
    setState(() {
      product_count+=1;
      cart_tests.add(list_of_tests[newvalue]);
    });
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Logo',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(0),
              child: Stack(
                children: [
                  if(product_count!=0)
                   Positioned(
                    top: 15,
                    child: CircleAvatar(
                      maxRadius: 8,
                      backgroundColor: tealcolor,
                      child: Text(
                        "$product_count",
                        style: const TextStyle(
                            color: darkblue,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartView(allTest: cart_tests,)));
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: darkblue,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      "Popular lab tests",
                      style: TextStyle(
                        color: darkblue,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.16,
                    ),
                    const Text(
                      "View more",
                      style: TextStyle(
                          color: darkblue,
                          fontSize: 13,
                          decoration: TextDecoration.underline),
                    ),
                    IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_outlined,
                          color: darkblue,
                          size: 11,
                        ))
                  ],
                ),
                Container(
                  height: size.height * 0.5,
                  child: GridView.builder(
                    itemCount: list_of_tests.length,
                    itemBuilder: (context, index) {
                      return Test_card(callback: this.addToCart,test_name: list_of_tests[index].name,oldprice: list_of_tests[index].oldPrice ,newprice:list_of_tests[index].newPrice,tests:list_of_tests[index].tests,index: index,);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        // mainAxisExtent: 200,
                        childAspectRatio: 0.87),
                  ),
                ),
                const Text(
                  "Popular packages",
                  style: TextStyle(
                    color: darkblue,
                    fontSize: 20,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: const Border.fromBorderSide(
                        BorderSide(
                          color: Color(0xffE5E5E5),
                        ),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: size.height*0.05,
                              width: size.height*0.05,
                              decoration: BoxDecoration(
                                color: const Color(0x1A2F80ED),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                'assets/medicine.svg',
                              ),
                            ),
                            Container(
                              width: size.width * 0.16,
                              decoration: BoxDecoration(
                                color: tealcolor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/shield.svg',
                                  ),
                                  SizedBox(
                                    width:  size.width*0.02,
                                  ),
                                  const Text(
                                    "Safe",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height*0.01,
                        ),
                        const Text(
                          "Full body checkup",
                          style: TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                        const Text(
                            "Includes 92 tests \n " +
                                "\u2022 Blood Glucose Fasting \n " +
                                "\u2022 Liver Function Test",
                            style: TextStyle(
                                fontSize: 13, color: Color(0xff6C87AE))),
                        const Text(
                          "View more",
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff6C87AE),
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(
                          height:  size.height*0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "\u{20B9} 2000/-",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: tealcolor,
                                  fontSize: 20),
                            ),
                            Container(
                              height:  size.height*0.04,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  border: Border.all(color: darkblue)),
                              child: Center(
                                child: Text(
                                  "Add to Cart",
                                  style: const TextStyle(
                                      color: darkblue,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ))
              ]),
        ));
  }
}
