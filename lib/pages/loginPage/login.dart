import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:real_texas_state/app.dart';
import 'package:real_texas_state/components/my_appBar.dart';
import 'package:real_texas_state/pages/loginPage/reset.dart';
import 'package:real_texas_state/pages/loginPage/verify.dart';

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
                      onPressed: () =>
                          _signIn(_email, _password, auth, context),
                    ),
                  ),
                  Builder(
                    builder: (context) => ElevatedButton(
                        child: Text("Sign Up"),
                        onPressed: () =>
                            _signup(_email, _password, auth, context)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) => Center(
                      child: TextButton(
                        child:
                            Text('Forgot Your Password? Click here to reset'),
                        onPressed: () => _reset(context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://tinyurl.com/5ev474vn"),
                  ),
                ),
              ),
              Spacer(),
              Text("© 2021 Texas Real State")
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

_reset(context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => ResetScreen()),
  );
}

_signIn(String _email, String _password, FirebaseAuth auth, context) async {
  try {
    await auth.signInWithEmailAndPassword(email: _email, password: _password);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => new MyApp(email: _email)));
  } on FirebaseAuthException catch (error) {
    showToast(
      error.message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.center,
      animDuration: Duration(seconds: 2),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }
}

_signup(String _email, String _password, FirebaseAuth auth, context) async {
  try {
    await auth.createUserWithEmailAndPassword(
        email: _email, password: _password);

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => new VerifyScreen(email: _email)));
  } on FirebaseAuthException catch (error) {
    showToast(
      error.message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.center,
      animDuration: Duration(seconds: 2),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }
}
