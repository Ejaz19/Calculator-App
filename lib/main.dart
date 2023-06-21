import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'colors.dart';
 void main(){
  runApp(MaterialApp(
    home: CalciApp(),
  ));
 }
  class CalciApp extends StatefulWidget {
  const CalciApp({super.key});

  @override
  State<CalciApp> createState() => _CalciAppState();
}

class _CalciAppState extends State<CalciApp> {
  //variables
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';

  onButtonClick(value){
    //if value is AC
    if(value == "AC"){
       input = '';
       output = '';
}
    else if(value == ">"){
      if(input.isNotEmpty)
      input = input.substring(0,input.length - 1);
    }
    else if(value == "="){
      if(input.isNotEmpty){
      var userInput = input;
      userInput = input.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
      if(output.endsWith(".0")){
        output = output.substring(output.length-2);
      }
      input = output;
    }
    }
    else{
      input = input + value;
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
       children: [
        Expanded(child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.0),
         
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
                  Text(
                  input,
                 style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                 ),
                 ),
                 const SizedBox(height: 20,),
                 Text(
                  output,
                 style: TextStyle(
                  fontSize: 23,
                  color: Colors.white.withOpacity(0.7),
                 ),
                 ),
          ],
        ),
        ),),



        
        Row(
          children: [
            button(text: "AC", tColor: orangeColor,buttonBgColor: orangeColor),
            button(text: ">", tColor: orangeColor,buttonBgColor: buttonColor),
            button(text: "%"),
            button(text: "/"),
          ],
        ),
         Row(
          children: [
            button(text: "7"),
            button(text: "8"),
            button(text: "9"),
            button(text: "x"),
          ],
        ),
         Row(
          children: [
            button(text: "4"),
            button(text: "5"),
            button(text: "6"),
            button(text: "-"),
          ],
        ),
         Row(
          children: [
            button(text: "1"),
            button(text: "2"),
            button(text: "3"),
            button(text: "+"),
          ],
        ),
         Row(
          children: [
            button(text: "EJAZ"),
            button(text: "0"),
            button(text: "."),
            button(text: "=",buttonBgColor: orangeColor),
          ],
        ),
       ],
      ),
    );
  }
  Widget button(
    {
      text, tColor = Colors.white, buttonBgColor = buttonColor
    }
  ){
    return Expanded(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.all(8.0),
                  primary: buttonColor,
                 ),
                  onPressed: () => onButtonClick(text), 
                          child: Text(text
                          ,style: 
                          TextStyle(
                            fontSize: 18,
                            color: tColor,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          ),
              ),
              );
  }
}
