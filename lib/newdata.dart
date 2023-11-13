import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
class NewData extends StatefulWidget {
const NewData({Key? key}) : super(key: key);
@override
_NewDataState createState() => _NewDataState();
}
class _NewDataState extends State<NewData> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController salary = TextEditingController(); 

  void addData() {
    var url = Uri.parse('http://192.168.5.121/restapi/crudp5/create.php');
    http.post(url, body: {
      "name": name.text,
      "address": address.text,
      "salary": salary.text, // Include salary field
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Set the background color to white
          border: Border.all(color: Colors.green), // Green outline
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: AppBar(
          title: const Center(child: Text("Add New Employee", style: TextStyle(color: Colors.black))), // Set text color to black
          backgroundColor: Colors.transparent, // Make the AppBar background transparent
          elevation: 0, // Remove shadow
          automaticallyImplyLeading: true, // Show back button if available
        ),
      ),
    ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: name,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
                hintText: 'Enter Name',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.title),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 5,
              controller: address,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Address',
                hintText: 'Enter Address',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.home),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField( // New TextFormField for salary
              controller: salary,
              autofocus: true,
              keyboardType: TextInputType.number, // Set keyboard type to number
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Salary',
                hintText: 'Enter Salary',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.attach_money),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              child: const Text("Add Data"),
              color: Colors.green,
              onPressed: () {
                addData();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => const Home()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
