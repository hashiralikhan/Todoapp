import 'package:flutter/material.dart';
import 'package:todo/add.dart';import 'dart:js_util';


class TodoMain extends StatefulWidget {
  const TodoMain({super.key});

  @override
  State<TodoMain> createState() => _TodoMainState();
}

class _TodoMainState extends State<TodoMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
       appBar: AppBar(
        
        title: const Text("Todo App",style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),),
              actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add,size: 30,),
            tooltip: 'Comment Icon',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Add();
              },));
            },
          ), //IconButton
           
        ], 
              
              backgroundColor: Colors.orangeAccent,
      ),
      
    );
  }
}
