import 'home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Text('Login', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            Expanded(
                child: Image.asset(
              'images/undraw_Specs_re_546x.png',
              height: 1000,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  label: Text('Username'),
                  hintText: 'Masukkan username',
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
                controller: passwordController,
                obscureText: hidePass,
                decoration: InputDecoration(
                  label: Text('Password'),
                  hintText: 'Masukkan password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  suffixIcon: IconButton(
                    onPressed: () {
                      print('hide pass = $hidePass');
                      setState(() {
                        hidePass = !hidePass;
                      });
                    },
                    icon: Icon(hidePass ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 280,
                child: Text(
                  'Forgot Password?',
                  textAlign: TextAlign.right,
                ),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Dalam pengembangan'),
                  ),
                );
              },
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (userNameController.text == 'user_uts' && passwordController.text == "pass_uts") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('berhasil login'),
                      ),
                    );

                    var box = Hive.box('userBox');
                    box.put('isLogin', true);

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('username atau password salah'),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Or Connect Using',
                textAlign: TextAlign.center,
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SizedBox(
                  height: 40,
                  width: 130,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Fitur dalam pengembangan'),
                        action: SnackBarAction(label: 'OK', onPressed: () {}),
                      ));
                    },
                    icon: Icon(Icons.facebook),
                    label: Text('Facebook'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                    ),
                  )),
              SizedBox(
                  height: 40,
                  width: 130,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Fitur dalam pengembangan'),
                        action: SnackBarAction(label: 'OK', onPressed: () {}),
                      ));
                    },
                    icon: Icon(Icons.facebook),
                    label: Text('Google'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[400],
                    ),
                  )),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an Account ?",
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                    onTap: () {
                      Route route = MaterialPageRoute(builder: (context) => SignUp());
                      Navigator.push(context, route);
                    },
                    child: Text("Sign Up",
                        style: TextStyle(
                          color: Colors.blue,
                        )))
              ],
            )
          ],
        ));
  }
}
