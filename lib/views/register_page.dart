import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:socius/views/email_verify.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _pass1 = TextEditingController();
  final TextEditingController _pass2 = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final User user;

  void validate() {
    if (_key.currentState!.validate()) {
      print('form validated');
      _auth
          .createUserWithEmailAndPassword(
              email: _emailcontroller.text.trim(), password: _pass1.text)
          .then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EmailVerify(
                        email: _emailcontroller.text,
                      ))))
          .catchError(
            (e) => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('error'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                content: Text(e.message),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('ok'))
                ],
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg/bg.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SafeArea(
                    child: Text('Registraion',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60),
                  child: TextFormField(
                    controller: _namecontroller,
                    validator: RequiredValidator(errorText: '  required'),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                      ),
                      labelText: ' First Name',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                      ),
                      labelText: ' Last Name',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60),
                  child: TextFormField(
                    controller: _emailcontroller,
                    validator: MultiValidator([
                      RequiredValidator(errorText: '      required'),
                      EmailValidator(errorText: '        enter valid email')
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                      ),
                      labelText: ' Email',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60),
                  child: TextFormField(
                    validator:
                        MinLengthValidator(5, errorText: 'minium length 6'),
                    obscureText: true,
                    controller: _pass1,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                      ),
                      labelText: ' Enter Password',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '    required';
                      }
                      if (value != _pass1.text) {
                        return '  password does not match';
                      }
                    },
                    obscureText: true,
                    controller: _pass2,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                      ),
                      labelText: ' Re-Enter Password',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white30, width: 2)),
                  child: TextButton(
                    onPressed: validate,
                    child: const Text('Proceed'),
                    style: TextButton.styleFrom(
                        primary: Colors.white54, shape: const CircleBorder()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
