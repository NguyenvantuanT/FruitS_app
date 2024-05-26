import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_payment_method_box.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/models/address_model.dart';
import 'package:nectar/page/payment_page.dart';
import 'package:nectar/themes/colors.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  AddressModel? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppTabBar(text: 'Payment Method'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: paymentMedhods.length,
              itemBuilder: (context, index) {
                final paymentMedhod = paymentMedhods[index];
                return AppPaymentMethodBox(
                  paymentMethod: paymentMedhod,
                  selectedMethod: _selectedMethod,
                  onChanged: (AddressModel? value) =>
                      setState(() => _selectedMethod = value),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(bottom: 40),
            child: AppButton(
              text: 'Next',
              bgColor: AppColor.green,
              onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) =>const PaymentPage())),
            ),
          )
        ],
      ),
    );
  }
}
