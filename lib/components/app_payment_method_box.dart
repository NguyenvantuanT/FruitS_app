import 'package:flutter/material.dart';
import 'package:nectar/models/address_model.dart';

class AppPaymentMethodBox extends StatelessWidget {
  const AppPaymentMethodBox({
    super.key,
    required this.paymentMethod,
    this.selectedMethod,
    this.onChanged,
  });
  final AddressModel paymentMethod;
  final AddressModel? selectedMethod;
  final Function(AddressModel?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          paymentMethod.adddress ?? "",
          style: const TextStyle(fontSize: 16),
        ),
        Radio(
          value: paymentMethod,
          groupValue: selectedMethod,
          onChanged: onChanged,
          fillColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.red;
              }
              return Colors.grey.withOpacity(0.5);
            },
          ),
        ),
      ]),
    );
  }
}
