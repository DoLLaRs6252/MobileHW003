import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Pin_page extends StatefulWidget {
  const Pin_page({Key? key}) : super(key: key);

  @override
  State<Pin_page> createState() => _Pin_pageState();
}

class _Pin_pageState extends State<Pin_page> {
  var numberlist = ["_", "_", "_", "_", "_", "_"]; // รายการที่ใช้เก็บเลข PIN
  var pin = ""; // เก็บค่า PIN ที่ผู้ใช้กด

  // สร้าง Widget ของรายการผลไม้แต่ละรายการ
  Widget buildItem({
    required String label,
    required String label2,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onPressed, // เรียก onPressed เมื่อคลิกที่รายการ
        child: Container(
          width: 80.0,
          height: 80.0,
          
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromARGB(255, 47, 47, 47),
              width: 1.0,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  label2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // รายการของรายการผลไม้แต่ละชุด
    var itemList = [
      buildItem(
        label: "1",
        label2: "one",
        onPressed: () => updatePin("1"),
      ),
      buildItem(
        label: "2",
        label2: "two",
        onPressed: () => updatePin("2"),
      ),
      buildItem(
        label: "3",
        label2: "three",
        onPressed: () => updatePin("3"),
      ),
    ];
    var itemList2 = [
      buildItem(
        label: "4",
        label2: "four",
        onPressed: () => updatePin("4"),
      ),
      buildItem(
        label: "5",
        label2: "five",
        onPressed: () => updatePin("5"),
      ),
      buildItem(
        label: "6",
        label2: "six",
        onPressed: () => updatePin("6"),
      ),
    ];
    var itemList3 = [
      buildItem(
        label: "7",
        label2: "seven",
        onPressed: () => updatePin("7"),
      ),
      buildItem(
        label: "8",
        label2: "eight",
        onPressed: () => updatePin("8"),
      ),
      buildItem(
        label: "9",
        label2: "nine",
        onPressed: () => updatePin("9"),
      ),
    ];

    // สร้างรายการอื่นๆ เช่นเดียวกัน

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Icon(Icons.security, size: 100.0),
                        ),
                        Text(
                          "Pin Login",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          numberlist.join(), // แสดง PIN ที่ผู้ใช้กด
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromARGB(255, 47, 47, 47),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: itemList,
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: itemList2,
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: itemList3,
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => clearPin(),
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(Icons.close),
                                ),
                              ),
                              Container(
                                child: buildItem(
                                  label: "0",
                                  label2: "zero",
                                  onPressed: () => updatePin("0"),
                                ),
                              ),
                              InkWell(
                                onTap: () => deleteLastDigit(),
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(10),
                                  
                                  child: Icon(Icons.backspace),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันเพื่ออัปเดตค่า PIN เมื่อผู้ใช้กดรายการผลไม้
  void updatePin(String digit) {
    setState(() {
      if (pin.length < 6) {
        pin += digit;
        numberlist[pin.length - 1] = digit;
      }
    });
  }

  void clearPin() {
    setState(() {
      pin = "";
      numberlist = ["_", "_", "_", "_", "_", "_"];
    });
  }

  void deleteLastDigit() {
    setState(() {
      if (pin.isNotEmpty) {
        pin = pin.substring(0, pin.length - 1);
        numberlist[pin.length] = "_";
      }
    });
  }
}
