import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:socius/views/home_page.dart';

class EmailVerify extends StatefulWidget {
  final String email;

  const EmailVerify({Key? key, required this.email}) : super(key: key);

  @override
  _EmailVerifyState createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();

  void sendOtp() async {
    var res = await EmailAuth(sessionName: 'TEST SESSION')
        .sendOtp(recipientMail: _emailcontroller.text);
    if (res) {
      
      print('otp send');
    }
  }

  Future verifyOtp() async{
    var res = EmailAuth(sessionName: 'TEST SESSION').validateOtp(
        recipientMail: _emailcontroller.text, userOtp: _otpcontroller.text);
    if (res) {
     return  Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      print('error');
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 200,
                    child: Image.asset('assets/bg/appLogo.png')),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Please Verify Your Email',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: TextFormField(
                  controller: _emailcontroller,
                  
                  decoration: InputDecoration(
                    suffix: TextButton(
                        onPressed: () => sendOtp(),
                        child: const Text('Send OTP')),
                    border: const UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white60),
                child: TextFormField(
                  controller: _otpcontroller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                    ),
                    labelText: ' OTP',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.black38,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white30, width: 2)),
                child: TextButton(
                  onPressed: () => verifyOtp(),
                  child: const Text('Verify'),
                  style: TextButton.styleFrom(
                      primary: Colors.white54, shape: const CircleBorder()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
