import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
       // backgroundColor: Colors.greenAccent,
        backgroundColor: Color.fromRGBO(38, 50, 56, 1),
        body: LoginScreen()
      )
    );
  }
}
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String password = "admin";
  String animationtype = "idle";
  final passwordcontroller = TextEditingController();
  final focuspasswordnode = FocusNode();

@override
void initState() { // so that to create a lisener to check the user is focusing on password or not
    // TODO: implement initState
    focuspasswordnode.addListener((){
      if(focuspasswordnode.hasFocus) {
      setState(() {
        animationtype="test";
      });
      } else {
        setState(() {
          
          animationtype="idle";
        });
      }
    

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
         //vertical spacing
        SizedBox(
          height: 60,
          width: 200,
        ),
        Center(
          child: Container(    //for teaddy 
            width: 300,
            height: 300,
            child: CircleAvatar(
              child: ClipOval(child: 
             new  FlareActor("assets/teddy_test.flr",alignment: Alignment.center,animation:animationtype,fit:BoxFit.contain,))
                
              ,
              backgroundColor: Colors.pinkAccent,
            ),
          ),
          
        ),
        SizedBox( //verical
          height: 80,
          width: 10,

        ),
        //for text fields 
        Container(
          height: 140,
          width: 350,
          decoration: BoxDecoration(borderRadius:BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
           ),
           child: Column(
             children: <Widget>[
               TextFormField(decoration: InputDecoration(
                 border: InputBorder.none,
                 hintText: "username",
                 contentPadding: EdgeInsets.all(20)),),

               Divider(),

               TextFormField(decoration: InputDecoration(border:
                InputBorder.none,
                hintText: "password",
                contentPadding: EdgeInsets.all(20)),
                controller: passwordcontroller,
                focusNode:focuspasswordnode,
                obscureText: true,
                ) ,
           
             ],
           ),
        ),
        Container(
          width: 350,
          height: 70,
          padding: EdgeInsets.all(20),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius:  new BorderRadius.all(Radius.circular(18)),
              side: BorderSide(color: Colors.transparent),
              
            ),
            color: Colors.pink ,
            child: Text("Submit",style: TextStyle(color: Colors.white),),
            
            onPressed: (){
if(passwordcontroller.text.compareTo(password)==0) {
  setState(() {
    animationtype="success";
    
  });
} else 
 setState(() {
   animationtype="fail";
   
 });

            },
            ),
        )
      
      
      ],
    
    );
  
      
  
    
  }
} 
    


