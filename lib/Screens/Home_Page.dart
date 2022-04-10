import 'package:flutter/material.dart';
class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final Weight_Controller = TextEditingController();
  final Height_Controller = TextEditingController();

  double Result_BMI = 0;
  String Result_Text = '';
  Color Result_Color = Colors.black;
  double Width_Good = 100;
  double Width_Bad = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "BMi من",
          textDirection: TextDirection.rtl,
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(
                    height: 26,
                  ),
                  Container(
                    child: TextFormField(
                      controller: Height_Controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "قد",
                        hintStyle: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      controller: Weight_Controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "وزن شما",
                        hintStyle: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (Weight_Controller.text == null ||
                        Weight_Controller.text == '' ||
                        Height_Controller.text == null ||
                        Height_Controller.text == '') {
                      Result_Text = "قد و وزن را وارد کنید !";
                      Result_Color = Colors.orangeAccent;
                    } else {
                      final Wight = double.parse(Weight_Controller.text);
                      final Height = double.parse(Height_Controller.text);

                      Result_BMI = Wight / (Height * Height);

                      if (Result_BMI > 25) {
                        Result_Text = "شما اضافه وزن دارید !";
                        Result_Color = Colors.red;
                      } else if (Result_BMI >= 18.5 && Result_BMI <= 25) {
                        Result_Text = "وزن شما عالی است !";
                        Result_Color = Colors.green;
                      } else {
                        Result_Text = "وزن شما کم است !";
                        Result_Color = Colors.red;
                      }
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    double.infinity,
                    38,
                  ),
                ),
                child: Text("محاسبه"),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              "شاخص توده بدنی : " + Result_BMI.toStringAsFixed(2),
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              Result_Text,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Result_Color,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
