import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(8.0),
        ),
        Text(
          'Nama: Arfan Jauhari',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        Text(
          'NIM: 190103180',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        Container(
          padding: EdgeInsets.all(210.0),
        ),
        SizedBox(
          width: 250,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              var box = Hive.box('userBox').clear();

              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            },
            child: Text('Logout'),
          ),
        ),
      ]),
    );
  }
}
