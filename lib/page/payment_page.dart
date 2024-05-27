import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_payment_box.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/models/bill_model.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/page/choose_address_page.dart';
import 'package:nectar/page/order_accepted_page.dart';
import 'package:nectar/page/payment_method_page.dart';
import 'package:nectar/themes/colors.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0)
            .copyWith(top: 20, bottom: 50),
        child: Column(children: [
          AppPayment(
            text: 'Choose Address',
            icon: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChooseAddressPage())),
          ),
          const SizedBox(height: 20),
          AppPayment(
            text: 'Payment Method',
            icon: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PaymentMethodPage())),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(color: AppColor.grey),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 3.0),
                      blurRadius: 6.0)
                ]),
            child: Text(displayCartReceipt()),
          ),
          const Spacer(),
          AppButton(
            text: 'Pay',
            bgColor: AppColor.green,
            onTap: () {
              if (cartFruits.isNotEmpty) {
              final invoice = invoices.firstWhere((element) => element.isPaid == false);
                invoice.isPaid = true;
                setState(() => cartFruits.clear());
                Route route = MaterialPageRoute(  
                    builder: (context) => const OrderAcceptedPage());
                Navigator.push(context, route);
                return;
              }
            },
          )
        ]),
      ),
    );
  }
}
