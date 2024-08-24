import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_api_classes/screens/signup.dart';
import 'package:shopping_api_classes/widget/support_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top:40.0,left: 20.0,right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Image.asset("images/login.png"),
        Center(child: Text("Sign In",style: AppWidget.semiBoldTextFeildStyle(),)),
        SizedBox(height: 20,),
        Text("Please enter the Details bellow to Continue",style: AppWidget.lightTextFeildStyle(),),
        SizedBox(height: 40,),
        Text("Email",style: AppWidget.semiBoldTextFeildStyle(),),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(color: Color(0xFFf4f5f9),borderRadius: BorderRadius.circular(10)),
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none,hintText: "Email"),
        
          ),
        ),
        
        
        SizedBox(height: 40,),
        Text("Password",style: AppWidget.semiBoldTextFeildStyle(),),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(color: Color(0xFFf4f5f9),borderRadius: BorderRadius.circular(10)),
          child: TextField(
            decoration: InputDecoration(border: InputBorder.none,hintText: "Password"),
        
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Forgot Password",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.w500),),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width/2,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
        color: Colors.green,borderRadius: BorderRadius.circular(10),),
        child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
           ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dont Have an Account?",style:AppWidget.lightTextFeildStyle(),),
             GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
              },
              
              child: Text("SignUp",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        )
            ],
          ),
        ),
      ),
    );
  }
}