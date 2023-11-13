import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
class Edit extends StatefulWidget {
final List list;
final int index;
Edit({Key? key, required this.list, required this.index}) : super(key: key);
@override
_EditState createState() => _EditState();
}
class _EditState extends State<Edit> {
  late TextEditingController name;
  late TextEditingController address;
  late TextEditingController salary;

  void editData() {
    var url = Uri.parse('http://192.168.5.121/restapi/crudp5/edit.php');
    http.post(url, body: {
      'id': widget.list[widget.index]['id'],
      'name': name.text, // Send 'name' field data
      'address': address.text, // Send 'address' field data
      'salary': salary.text, // Send 'salary' field data
    });
  }

  @override
  void initState() {
    name = TextEditingController(text: widget.list[widget.index]['name']);
    address = TextEditingController(text: widget.list[widget.index]['address']);
    salary = TextEditingController(text: widget.list[widget.index]['salary']); // Initialize salary controller
    super.initState();
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
          title: const Center(child: Text("Edit Data", style: TextStyle(color: Colors.black))), // Set text color to black
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
                labelText: 'Enter Name', // Rename label
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
                labelText: 'Enter Address', // Rename label
                hintText: 'Enter Address',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.text_snippet_outlined),
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
                labelText: 'Enter Salary', // Rename label
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
              child: const Text("Edit Data"),
              color: Colors.green,
              onPressed: () {
                editData();
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
