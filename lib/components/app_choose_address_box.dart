import 'package:flutter/material.dart';
import 'package:nectar/components/app_text_stytle.dart';
import 'package:nectar/models/address_model.dart';
import 'package:nectar/themes/colors.dart';

class AppChooseAddress extends StatelessWidget {
  const AppChooseAddress({
    super.key,
    required this.address,
    this.onChanged,
    this.selectedAddress,
  });

  final AddressModel address;
  final AddressModel? selectedAddress;
  final Function(AddressModel?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 3.0),
                blurRadius: 6.0)
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextStyle(
              text: address.adddress ?? '',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textColor: AppColor.brown,
            ),
            Radio(
              value: address,
              groupValue: selectedAddress,
              onChanged: onChanged,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColor.red;
                  }
                  return AppColor.grey.withOpacity(0.5);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        AppTextStyle(
          text: address.name ?? '',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          textColor: AppColor.grey,
        ),
        const SizedBox(height: 8),
        AppTextStyle(
          text: address.local ?? '',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          textColor: AppColor.grey,
        ),
      ]),
    );
  }
}
