import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/views/home/view.dart';
import 'package:phone_auth/views/login/controller.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = LoginController();
  late ConfirmationResult result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Form(
            key: controller.formKey,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Phone Number'
              ),
              controller: controller.phoneController,
              validator: (value) => value!.isEmpty ? 'Empty!' : null,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            child: Text('GO!'),
            onPressed: ()async{
              setState(() => controller.isLoading = true);
              await controller.login();

              // if(success) {
              //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView(),));
              // }else{
              //   ScaffoldMessenger.of(controller.formKey.currentContext!).showSnackBar(SnackBar(content: Text('Failed to login!')));
              // }
              setState(() => controller.isLoading = false);
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Pin Code'
            ),
            controller: controller.pinCodeController,
            validator: (value) => value!.isEmpty ? 'Empty!' : null,
          ),
          ElevatedButton(
            child: Text('Verify!'),
            onPressed: ()async{
              setState(() => controller.isLoading = true);
              await controller.verify();

              // if(success) {
              //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView(),));
              // }else{
              //   ScaffoldMessenger.of(controller.formKey.currentContext!).showSnackBar(SnackBar(content: Text('Failed to login!')));
              // }
              setState(() => controller.isLoading = false);
            },
          ),
        ],
      ),
    );
  }
}
