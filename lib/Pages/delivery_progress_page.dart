import 'package:delivery/Extras/receipt.dart';
import 'package:delivery/Extras/sign_in_button.dart';
import 'package:delivery/Pages/home_page.dart';
import 'package:delivery/model/restaurant.dart';
import 'package:delivery/services/Database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  // get access to database
  FirestoreService db = FirestoreService();
@override
void initState() {
  super.initState();
  

  // if we get to this page , submit the order to firestore database
  String receipt = context.read<Restaurant>().displayReceipt();
  db.saveOrderToDatabase(receipt);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in Progress..."),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt(),
            // Spacer(),
            MyButton(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
              text: "Go back",
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
