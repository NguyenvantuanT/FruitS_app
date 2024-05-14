import 'package:flutter/material.dart';
import 'package:nectar/models/address_model.dart';

class AppPaymentMethodBox extends StatelessWidget {
  const AppPaymentMethodBox({
    super.key,
    this.onTap,
    required this.paymentMethods,
  });
  final Function()? onTap;
  final AddressModel paymentMethods;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 6.0)
            ]),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            paymentMethods.adddress ?? "",
            style: const TextStyle(fontSize: 16),
          ),
          Container(
            color: Colors.white,
            child: Icon(
              (paymentMethods.isDone ?? false) ? Icons.circle_rounded : Icons.circle_outlined,
              color: Colors.red,
            ),
          )
        ]),
      ),
    );
  }
}
