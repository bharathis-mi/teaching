import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '', email = '', password = '', confirmpassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onSaved: (val) {
                  name = val!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Should not be Empty";
                  }
                  return null;
                },
              ),
              TextFormField(
                validator: (value) {
                  if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(value!)) {
                    return 'Enter validate email';
                  }
                  return null;
                },
                onSaved: (val) {
                  email = val!;
                },
                decoration: const InputDecoration(hintText: 'Enter email'),
              ),
              TextFormField(
                onSaved: (val) {
                  password = val!;
                },
              ),
              TextFormField(
                onSaved: (val) {
                  confirmpassword = val!;
                },
              ),
              FilledButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackbar('S'),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackbar('F'),
                      );
                    }
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  SnackBar customSnackbar(String status) {
    return SnackBar(
      backgroundColor:
          status == 'S' ? Colors.green.shade900 : Colors.red.shade900,
      content:
          Text(status == 'S' ? "Successfully Validated" : " Validation Failed"),
      behavior: SnackBarBehavior.floating,
    );
  }
}
