import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.0,
                  ),
                ),
              )),
          Text(
            "Let's Get Started!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            'Create an account to Q Allure to get all features',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, height: 2),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                label: Text('Nama'),
                hintText: 'Masukkan Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(Icons.person, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                label: Text('Email'),
                hintText: 'Masukkan Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(Icons.email, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                label: Text('Phone'),
                hintText: 'Masukkan No Telepon',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(Icons.phone, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: passwordController,
              obscureText: hidePass,
              decoration: InputDecoration(
                label: Text('Password'),
                hintText: 'Masukkan Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(Icons.lock, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextFormField(
              controller: confirmPasswordController,
              obscureText: hidePass,
              decoration: InputDecoration(
                label: Text('Confirm Password'),
                hintText: 'Konfirmasi Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(Icons.lock, color: Colors.grey),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
          ),
          SizedBox(
            width: 0.10,
          ),
          SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Fitur dalam pengembangan'),
                    action: SnackBarAction(label: 'OK', onPressed: () {}),
                  ),
                );

                var box = Hive.box('userBox');
                box.put('isLogin', true);
              },
              child: Text('CREATE'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Already have an account ?",
                style: TextStyle(color: Colors.black),
              ),
              GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(builder: (context) => LoginScreen());
                    Navigator.push(context, route);
                  },
                  child: Text("Login here",
                      style: TextStyle(
                        color: Colors.blue,
                      )))
            ],
          )
        ],
      ),
    );
  }
}
