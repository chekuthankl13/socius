import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socius/views/home_page.dart';
import 'package:socius/views/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final User user;

  void validate() {
    _auth
        .signInWithEmailAndPassword(
            email: _emailcontroller.text.trim(),
            password: _passwordcontroller.text)
        .then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          ),
        )
        .catchError(
          (e) => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('error'),
              content: Text(e.message),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('ok'))
              ],
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg/bg.png'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 300,
                    child: Image.asset('assets/bg/appLogo.png')),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 80,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white24),
                child: TextFormField(
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                    ),
                    labelText: '  Email',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white24),
                child: TextFormField(
                  obscureText: true,
                  controller: _passwordcontroller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                    ),
                    labelText: ' Password',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white30, width: 2)),
                  child: TextButton(
                    onPressed: validate,
                    child: const Text('Login'),
                    style: TextButton.styleFrom(
                        primary: Colors.white54, shape: const CircleBorder()),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()));
                  },
                  child: const Text('register'))
            ],
          ),
        ),
      ),
    );
  }
}
