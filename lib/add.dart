import 'package:flutter/material.dart';
import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController fatherController = TextEditingController();

  final TextEditingController ageController = TextEditingController();
    final TextEditingController qualificationController = TextEditingController();

 void regester() async {
    final String name = nameController.text;
    final String father = fatherController.text;
    final dynamic age = ageController.text;
    final String qualification=qualificationController.text;
    try {
     // FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
     // final UserCredential credential = await firebaseAuth
       //   .createUserWithEmailAndPassword(email: email, password: password);
      await firestore.collection('data').add({
        'name': name,
        'email': father,
        'age':age,
        'qualification':qualification
      });
      
    } catch (e) {
       print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create list",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body:  SingleChildScrollView(
        child: Column(children: [
         const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter Your Information",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
         const SizedBox(
                height: 10,
              ),
          Padding(
            padding:const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name',
                      hintText: 'Enter Your Name'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: fatherController,
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Father Name',
                      hintText: 'Parent Name'),
                ),
               const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: ageController,
                  decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Your Age',
                      hintText: ' Your Age'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: qualificationController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Qualification',
                      hintText: 'Enter Your Qualification'),
                ),
                SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: regester,
                child: const Text("Submit"),
              )
              
              ],
            ),
          ),
          
        ]),
      ),
    );
  }
}
