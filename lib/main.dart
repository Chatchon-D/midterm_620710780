import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomgPage(),
    );
  }
}

class HomgPage extends StatelessWidget {
  HomgPage({Key? key}) : super(key: key);
  var _conL = TextEditingController();
  var _conG = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Text('PIG WEiGHT',style: TextStyle(fontSize: 32.0, color: Colors.pinkAccent,fontWeight: FontWeight.bold)),
              Text('CALCULATOR',style: TextStyle(fontSize: 32.0, color: Colors.pinkAccent,fontWeight: FontWeight.bold)),
              SizedBox(height: 35),
              Image.asset('assets/images/pig.png', width: 250.0),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('LENGTH',style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('(cm)',style: TextStyle(fontWeight: FontWeight.bold)),
                            TextField(
                              textAlign: TextAlign.center,
                              controller: _conL,
                              decoration: InputDecoration(
                                hintText: 'Enter length',
                              ),
                            ),

                          ],
                        ),

                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('GIRTH',style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('(cm)',style: TextStyle(fontWeight: FontWeight.bold)),
                            TextField(
                              textAlign: TextAlign.center,
                              controller: _conG,
                              decoration: InputDecoration(
                                hintText: 'Enter length',
                              ),
                            ),

                          ],
                        ),

                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: ElevatedButton(
                  child: Text('CALCULATE'),
                  onPressed: () {
                    var lengthC = _conL.text;
                    var girthC = _conG.text;
                    double? length = double.tryParse(lengthC);
                    double? girth = double.tryParse(girthC);
                    if(length==null||girth==null){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('ERROR'),
                            content: Text('Invalid input'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );

                    }
                    else {
                      double weight = (girth/100) * (girth/100) * (length/100) * 69.3;
                      double price = 112.50 * weight;
                      double minWeight = 0.97 * weight;
                      double maxWeight = 1.03 * weight;
                      double minPrice = 0.97*price;
                      double maxPrice = 1.03*price;
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Row(
                              children: [
                                Image.asset(
                                    'assets/images/ic_pig.png', width: 40.0),
                                Text('RESULT'),
                              ],
                            ),
                            content: Text('Weight :${minWeight.round()} - ${maxWeight.round()} kg\nPrice: ${minPrice.round()} - ${maxPrice.round()} Baht'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
