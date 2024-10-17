import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(CurrencyConverter());
}
class CurrencyConverter extends StatefulWidget{
  @override
  _CurrencyConverterState createState()=> _CurrencyConverterState();
}


class _CurrencyConverterState extends State<CurrencyConverter> {
  // const CurrencyConverter({super.key});
  final TextEditingController controller = TextEditingController();
  Map<String,double> conversion = {"USD":84.05,"YEN":0.56,"EUR": 91.38,"SGD": 64.03,"SAR":22.38};
  String selected = "USD";
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Currency Converter',style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            ),
            backgroundColor: const Color.fromRGBO(16, 126, 143, 1),
            ),

          backgroundColor: const Color.fromRGBO(16, 126, 143, 1),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text("${result.toStringAsFixed(2)} ${"₹"}", style: const TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),),
                Container(
                  padding: const EdgeInsets.all(6),
                  child:  TextField(
                    controller: controller,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration:const InputDecoration(
                      hintText: 'Please enter the amount',
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      prefixIcon: Icon(Icons.monetization_on),
                      prefixIconColor: Colors.black54,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                    keyboardType:const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                ),
                
                Row(
                  children:[ Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 170),
                      margin: const EdgeInsets.all(8.0),
                      // padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 150),
                      decoration: BoxDecoration(
                        border:Border.all(
                          width: 1,
                        ),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: DropdownButton<String>(
                        value: selected,
                        items: conversion.keys.map((String Currency){
                          return DropdownMenuItem<String>(
                            value: Currency,
                            child: Text(Currency),
                          );
                        }).toList(),
                        onChanged: (String? newvalue){
                          setState(() {
                            selected = newvalue!;
                          });
                        },
                        style:const TextStyle(color:Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                        dropdownColor: Colors.white,
                      ),
                    ),
                  ),
      ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10,vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if(controller.text.isNotEmpty)
                          {
                            result = double.parse(controller.text) * conversion[selected]!;
                          }
                        else{
                          result = 0;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      backgroundColor: Colors.orangeAccent,
                      minimumSize: const Size(double.infinity,13),
                      shape: RoundedRectangleBorder(
                        borderRadius:  BorderRadius.circular(5),
                      ),
                      elevation: 10,
                    ),
                    child: const Text(
                      "Convert",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
