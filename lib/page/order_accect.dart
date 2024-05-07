import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/page/root_page.dart';

class OrderAccepted extends StatefulWidget {
  const OrderAccepted({super.key});

  @override
  State<OrderAccepted> createState() => _OrderAcceptedState();
}

class _OrderAcceptedState extends State<OrderAccepted> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          "assets/images/place_order.png",
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
            left: 20,
            bottom: 60,
            right: 20,
            child: Column(
              children: [
                const AppButton(text: "Track Order"),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RootPage()),
                        (route) => false),
                    child: const Text(
                      "Back to Home",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            )),
      ]),
    );
  }
}
