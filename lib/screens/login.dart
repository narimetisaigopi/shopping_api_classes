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
          margin:const EdgeInsets.only(top:40.0,left: 20.0,right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Image.asset("images/login.png"),
        Center(child: Text("Sign In",style: AppWidget.semiBoldTextFeildStyle(),)),
      const  SizedBox(height: 20,),
        Text("Please enter the Details bellow to Continue",style: AppWidget.lightTextFeildStyle(),),
      const  SizedBox(height: 40,),
        Text("Email",style: AppWidget.semiBoldTextFeildStyle(),),
    const    SizedBox(
          height: 20,
        ),
        Container(
          padding:const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(color:const Color(0xFFf4f5f9),borderRadius: BorderRadius.circular(10)),
          child:const TextField(
            decoration: InputDecoration(border: InputBorder.none,hintText: "Email"),
        
          ),
        ),
        
        
    const    SizedBox(height: 40,),
        Text("Password",style: AppWidget.semiBoldTextFeildStyle(),),
      const  SizedBox(
          height: 20,
        ),
        Container(
          padding:const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(color:const Color(0xFFf4f5f9),borderRadius: BorderRadius.circular(10)),
          child:const TextField(
            decoration: InputDecoration(border: InputBorder.none,hintText: "Password"),
        
          ),
        ),
      const  SizedBox(
          height: 20,
        ),
       const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Forgot Password",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.w500),),
          ],
        ),
    const    SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width/2,
            padding:const EdgeInsets.all(20),
            decoration: BoxDecoration(
        color: Colors.green,borderRadius: BorderRadius.circular(10),),
        child:const Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
           ),
        ),
     const   SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Dont Have an Account?",style:AppWidget.lightTextFeildStyle(),),
             GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Signup()));
              },
              
              child:const Text("SignUp",style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.w500),)),
          ],
        )
            ],
          ),
        ),
      ),
    );
  }
}