import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:coba1/FadeAnimation.dart';



void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    )
);

class HomePage extends StatelessWidget {

  String _valGender;
  String _valFriends;
  List _listTime = ["Pagi", "Malam"];
  List _myDay = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Schedule"),
          backgroundColor:Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DropdownButton(
              padding: EdgeInsets.all(10),
              hint: Text("Select the day"),
              value: _valFriends,
              items: _myDay.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _valFriends = value;  //Untuk memberitahu _valFriends bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                });
              },
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Course name",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Class",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 15,),
            DropdownButton(
              padding: EdgeInsets.all(10),
              hint: Text("Select the Time"),
              value: _valGender,
              items: _listTime.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _valGender = value;  //Untuk memberitahu _valGender bahwa isi nya akan diubah sesuai dengan value yang kita pilih
                });
              },
            ),
            FadeAnimation(1.6, Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.orange[900]
              ),
              child: Center(
                child: Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            )),

          ],
        ),
      ),
    );
  }
}
