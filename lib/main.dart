import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';



void main() {
  runApp(MaterialApp(
  home:Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState()=> _HomeState();
}
class _HomeState extends State<Home>{
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _result=0.0;
  String _bmi = "";
  void Calculate(){
   setState((){
    int age = int.parse(_ageController.text);
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    if((_ageController.toString().isNotEmpty && age>0)||(_heightController.toString().isNotEmpty && height>0)||(_weightController.toString().isNotEmpty && weight>0)){
      _result = (703*weight)/pow(height*12,2);
    }
    if (_result>=25.0 && _result<29.9){
      _bmi = "Overweight";
    }
    else if(_result >=18.5 && _result <25.0){
      _bmi = "Healthy";
    }
    else if(_result >= 29.9){
      _bmi = "Obese";
    }
    else {
      _bmi = "UnderWeight";
    }
   });  
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("BMI",style:TextStyle(
          fontSize:35.0,
          fontWeight:FontWeight.bold,
          color:Colors.white
        )),
        backgroundColor:Colors.deepOrangeAccent,
 centerTitle:true,
),
body:Container(
  alignment: Alignment.center,
     child:Column(
      children:<Widget>[
        TextField(
        controller: _ageController,  
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
        labelText:"Age",
        hintText: "Enter your age",
          icon: Icon(Icons.person_outline)
        ),
      ),
      TextField(
       controller: _heightController, 
       keyboardType:TextInputType.number,
       decoration: InputDecoration(
         labelText: "Height",
         hintText:"Enter your height in feet",
         icon:Icon(Icons.insert_chart)
         
        ),     
      ),
      TextField(
       controller: _weightController, 
       keyboardType:TextInputType.number,
       decoration: InputDecoration(
         labelText: "Weight",
         hintText:"Enter your weight in feet",
         icon:Icon(Icons.line_weight)
       
      
      ),
     ),
     Padding(
       padding:EdgeInsets.all(10.0),
       child:RaisedButton(
         child:Text(
           "Calculate",style:TextStyle(
             fontWeight:FontWeight.bold,
             color:Colors.white
           ),
         ),
         color:Colors.blueAccent,
         onPressed:Calculate,
       ),
     ),
     Center(
       child:Text("Your BMI is ${_result.toStringAsFixed(1)}",style:TextStyle(
         fontWeight:FontWeight.bold,
         fontSize:25.0,
         color:Colors.red
       
       ))
     
     ),
      Center(
        child:Text("${_bmi}",style:TextStyle(
          fontSize:25.0,
          fontWeight:FontWeight.bold,
          color:Colors.orangeAccent,
        ))
      
      )  
   ],
   ),
  ),
 );      
}
}


