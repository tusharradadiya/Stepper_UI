import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepperui/home/provider/homeprovider.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  HomeProvider? providertrue;
  HomeProvider? providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<HomeProvider>(context, listen: true);
    providerfalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Stepper App"),
        ),
        body: Theme(
          data: ThemeData(
            primarySwatch: Colors.red,
            colorScheme: ColorScheme.light(primary: Colors.red),
          ),
          child: ListView(
            children: [
              Stepper(
                steps: [
                  Step(
                    isActive: true,
                    title: Text("Sign Up"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: providertrue!.txtName,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Full Name",
                            prefixIcon: Icon(Icons.person_outline),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: providertrue!.id,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Email id",
                            prefixIcon: Icon(Icons.email_outlined),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: providertrue!.passwrd,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: providertrue!.cpassword,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${providertrue!.note}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Step(
                    isActive: true,
                    title: Text("Login"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: providertrue!.Uname,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "User Name",
                            prefixIcon: Icon(Icons.person_outline),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        TextField(
                          controller: providertrue!.lastpassword,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            border: UnderlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${providertrue!.note2}",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Step(
                    isActive: true,
                    title: Text("Home"),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name:${providertrue!.txtName.text}"),
                        Text("Email:${providertrue!.id.text}"),
                        Text("Password:${providertrue!.passwrd.text}"),
                      ],
                    ),
                  ),
                ],
                onStepContinue: () {
                  providerfalse!.createnote();

                  if(providertrue!.StepIndex==1){
                    providertrue!.conformation();
                  }
                  if (providertrue!.note == "" &&providertrue!.note2 == "" &&
                      providerfalse!.StepIndex < 2) {
                    providerfalse!
                        .changeStepIndex(providerfalse!.StepIndex + 1);
                  }
                  },
                onStepCancel: () {
                  if (providerfalse!.StepIndex > 0) {
                    providertrue!.changeStepIndex(providertrue!.StepIndex - 1);
                  }
                },
                onStepTapped: (index) => providertrue!.changeStepIndex(index),
                currentStep: providertrue!.StepIndex,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
