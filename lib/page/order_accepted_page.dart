import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/page/root_page.dart';
import 'package:nectar/themes/colors.dart';

class OrderAcceptedPage extends StatelessWidget {
  const OrderAcceptedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/place_order.png'),
          Positioned(
            bottom: 40,
            right: 20,
            left: 20,
            child: Column(
              children: [
                AppButton(
                  bgColor: AppColor.green,
                  text: 'Track Orders',
                  onTap: () {},
                ),
                TextButton(onPressed: (){
                  Route route = MaterialPageRoute(builder: (context) => const RootPage());
                  Navigator.push(context, route);
                }, child: const Text('Back To Home' , style: TextStyle(color: Colors.black),))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
