import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Sign in",
            style: TextStyle(
              fontSize: 25.0,
            ),),
          backgroundColor: Colors.black,
        ),
        body: LoginPage(),
      ),

    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input){
                if(input.isEmpty){
                  return 'Please type an email';
                }
              },
              onSaved:(input) => _email=input ,
              decoration: InputDecoration(
                labelText: 'Email',

              ),
            ),
            TextFormField(
              validator: (input){
                if(input.length < 6){
                  return 'Password should be of 6 chaarcters';
                }
              },
              onSaved:(input) => _password=input ,
              decoration: InputDecoration(
                labelText: 'Password',

              ),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text('Sign in'),
            )

          ],
        ),
      ),

    );
  }




  Future<void> signIn() async{
    final _form=_formKey.currentState;
    if(_form.validate()){
      _form.save();
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context,MaterialPageRoute(builder: (context)=> Home()));
      }catch(e){
        print(e.message);
      }


    }
  }


}

