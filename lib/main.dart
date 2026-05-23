import 'package:flutter/material.dart';

void main() {
  runApp(EarnApp());
}

class EarnApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earn App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int coins = 0;

  void earnCoins() {
    setState(() {
      coins += 10;
    });
  }

  void withdrawCoins() {
    if (coins >= 100) {
      setState(() {
        coins -= 100;
      });
      showMessage("Withdrawal successful!");
    } else {
      showMessage("Not enough coins");
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Earn App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Coins",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 10),

            Text(
              "$coins",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            SizedBox(height: 40),

            ElevatedButton(
              onPressed: earnCoins,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
              ),
              child: Text(
                "Earn Coins",
                style: TextStyle(fontSize: 18),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: withdrawCoins,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Colors.orange,
              ),
              child: Text(
                "Withdraw (100 Coins)",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
