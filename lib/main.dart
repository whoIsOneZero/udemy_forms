import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Forms'),
        ),
        body: const MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final keys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keys,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter your name",
              labelText: "Name",
              icon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'This is a required field';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter your password",
              labelText: "Password",
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'This is a required field';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "GitHub link",
              labelText: "GitHub Profile",
              icon: Icon(Icons.link),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'This is a required field';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              onPressed: () {
                if (keys.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form Submitted')));
                }
              },
              child: const Text('Submit'),
            ),
          )
        ],
      ),
    );
  }
}
