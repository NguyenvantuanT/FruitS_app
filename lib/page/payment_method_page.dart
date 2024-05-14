import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_payment_method_box.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/models/address_model.dart';
import 'package:nectar/themes/colors.dart';

class AppPaymentMethodPage extends StatefulWidget {
  const AppPaymentMethodPage({super.key});

  @override
  State<AppPaymentMethodPage> createState() => _AppPaymentMethodPageState();
}

class _AppPaymentMethodPageState extends State<AppPaymentMethodPage> {
  bool check = false;
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
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: paymentMedhods.length,
            itemBuilder: (context, index) {
              final paymentMedhod = paymentMedhods[index];
              return AppPaymentMethodBox(
                paymentMethods: paymentMedhod,
                onTap: () => setState(() =>
                    paymentMedhod.isDone = !(paymentMedhod.isDone ?? false)),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(bottom: 40),
            child: AppButton(
              text: 'Next',
              bgColor: pyColor,
            ),
          )
        ],
      ),
    );
  }
}
