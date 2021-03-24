import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real_texas_state/app.dart';
import 'package:real_texas_state/components/my_appBar.dart';

class MyLoginPage extends StatefulWidget {
  @override
  MyLoginPageState createState() => MyLoginPageState();
}

class MyLoginPageState extends State<MyLoginPage> {
  final auth = FirebaseAuth.instance;
  bool _isHidden = true;
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        title: 'Login Page',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          appBar: MyAppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Log In / Sign Up",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    icon: Icon(Icons.email),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    icon: Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                          _isHidden ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Builder(
                    builder: (context) => ElevatedButton(
                      child: Text('Sign In'),
                      onPressed: () {
                        auth.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => new MyApp(email: _email),
                          ),
                        );
                      },
                    ),
                  ),
                  Builder(
                    builder: (context) => ElevatedButton(
                      child: Text('Sign Up'),
                      onPressed: () {
                        auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => new MyApp(email: _email),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
