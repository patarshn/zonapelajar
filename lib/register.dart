import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:zonapelajar/add_schedule.dart';
import 'package:zonapelajar/login.dart';
void main() => runApp(new MaterialApp(
  home: new Register(),
  debugShowCheckedModeBanner: false,
));

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => new _RegisterState();
}

class _RegisterState extends State<Register> {
 String nama, email, password;
 final _key = new GlobalKey<FormState>();

 bool _secureText = true;

 showHide() {
   setState(() {
     _secureText = !_secureText;
   });
 }
 check() {
   final form = _key.currentState;
   if (form.validate()) {
     form.save();
     login();
   }
 }
 login() async {
   final response = await http.post("https://panel.serarinne.my.id/zonapelajar/register.php",
       body: {"nama": nama, "email": email, "password": password});
   String status = response.body;
   if (status == "1") {
     _showDialog("Berhasil Mendaftar...");
   } else if (status == "0") {
     _showDialog("Email Sudah Digunakan....");
   } else {
     _showDialog("Terjadi Kesalahan, Silahkan Ulangi Lagi...");
   }
 }

 void _showDialog (String message) {
    showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  backgroundColor: Colors.deepPurple,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  content: Text(message, style: TextStyle(color: Colors.white),),
                  actions: <Widget>[
                    new FlatButton(
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Close", style: new TextStyle(color: Colors.deepPurple)),
                  ],
                ),
                onPressed: () {
                        Navigator.of(context).pop();
                      },
              ),
                  ],
                );
              }
          );
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body:SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(255, 50,57,67),
              alignment: Alignment.center,
              child:
              Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(color: Color(0xFF323943)),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child:Column(
                children: <Widget>[
                  Image.asset('assets/waifu.png', width: 200.0, height: 200.0,),
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)
                      )
                    ),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _key,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert nama";
                                  }
                                },
                                onSaved: (e) => nama = e,
                                decoration: InputDecoration(
                                  labelText: "Nama Lengkap",
                                ),
                              ),
                              TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert email";
                                  }
                                },
                                onSaved: (e) => email = e,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                ),
                              ),
                              TextFormField(
                                obscureText: _secureText,
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert password";
                                  }
                                },
                                onSaved: (e) => password = e,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: IconButton(
                                    onPressed: showHide,
                                    icon: Icon(_secureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                              ),
                             /* MaterialButton(
                                onPressed: () {
                                  check();
                                },
                                child: Text("Daftar"),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                        return new Login();
                                  }));
                                },
                                child: Text("Login"),
                              ),*/
                              SizedBox(height: 60,),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: RaisedButton(
                                  color: Color(0xFFF7AF39),
                                  child: Text("SIGN UP", style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                                  onPressed: () {
                                    check();
                                  },
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  //Text("Don't have any account?",style: TextStyle(fontFamily: 'Velera', fontSize: 12.0,color: Colors.black)),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                            return new Login();
                                      }));
                                    },
                                    child: RichText(
                                      text: new TextSpan(
                                        style: new TextStyle(fontFamily: 'Velera', fontSize: 12.0,color: Colors.black),
                                        children: <TextSpan>[
                                          new TextSpan(text: "Already have an account? ",),
                                          new TextSpan(text: 'LOGIN', style: new TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF7AF39)),),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
                  )
                ],
              ),
              /*child:Column(
                children: <Widget>[
                  Image.asset('assets/waifu.png', width: 200.0, height: 200.0,),
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0)
                      )
                    ),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _key,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert nama";
                                  }
                                },
                                onSaved: (e) => nama = e,
                                decoration: InputDecoration(
                                  labelText: "Nama Lengkap",
                                ),
                              ),
                              TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert email";
                                  }
                                },
                                onSaved: (e) => email = e,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                ),
                              ),
                              TextFormField(
                                obscureText: _secureText,
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Please insert password";
                                  }
                                },
                                onSaved: (e) => password = e,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: IconButton(
                                    onPressed: showHide,
                                    icon: Icon(_secureText
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  check();
                                },
                                child: Text("Daftar"),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                                        return new Login();
                                  }));
                                },
                                child: Text("Login"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),*/
            ),
          ),
        ),
      ),
    );
  }
}
