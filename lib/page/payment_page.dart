import 'package:flutter/material.dart';
import 'package:nectar/components/app_payment_box.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/page/choose_address_page.dart';
import 'package:nectar/page/payment_method_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppTabBar(text: 'Payment'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 20),
        child: Column(children: [
          AppPayment(
            text: 'Choose Address',
            icon: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseAddressPage())),
          ),
          const SizedBox(height: 20),
          AppPayment(
            text: 'Payment Method',
            icon: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AppPaymentMethodPage())),
          ),
        ]),
      ),
    );
  }
}
