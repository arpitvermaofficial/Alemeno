import 'package:alemeno/Lab_test/view/success.dart';
import 'package:flutter/material.dart';
import 'package:alemeno/Lab_test/view/Widgets/datepicker.dart';
import 'package:alemeno/Utils/colors.dart';
import 'package:intl/intl.dart';

class BookApoitment extends StatefulWidget {
  Function callback2;

  var textValue;

  BookApoitment({
    this.textValue,
    required this.callback2,
    Key? key,
  }) : super(key: key);

  @override
  State<BookApoitment> createState() => _BookApoitmentState();
}

class _BookApoitmentState extends State<BookApoitment> {
  String _textValue = 'Old Value';
  bool date_selected = false;
  int selected_time_slot = -1;
  callback3(
    newValue,
  ) {
    if(selected_time_slot != -1 && date_selected==true)
    setState(() {
      _textValue = newValue;

      widget.callback2(_textValue);
    });
  }

  callback4(newValue) {
    if(selected_time_slot != -1 && date_selected==true)
    setState(() {
      date_selected = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.black,),),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Book Appointment",
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              height: size.height * 0.45,
              child: DayPickerPage(
                  callback4: this.callback3, callback5: this.callback4),
            ),
            Text(
              "Select Time",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: size.height * 0.23,
              child: GridView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected_time_slot = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: selected_time_slot == index
                            ? darkblue
                            : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.fromBorderSide(
                            BorderSide(color: darkblue, width: 2)),
                      ),
                      child: Text(
                        "${index + 8 < 10 ? "0" : index + 8 - 10 < 3 ? "" : "0"}${index + 8 > 12 ? index + 8 - 12 : index + 8}:00 ${index + 8 > 12 ? "PM" : "AM"}",
                        style: TextStyle(
                          color: selected_time_slot == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 10,
                    // mainAxisExtent: 200,
                    childAspectRatio: 2.8),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            GestureDetector(
              onTap: () {
                if (selected_time_slot!=-1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Success( SheduledDateTiime:  DateFormat('d/M/y').parse(_textValue),)));
                }
              },
              child: Container(
                height: size.height * 0.06,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: selected_time_slot != -1 && date_selected==true ?   darkblue:Color(0xffB0B0B0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    date_selected == false ? "Next" : "Confirm",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
