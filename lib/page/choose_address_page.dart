import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_choose_address_box.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/models/address_model.dart';
import 'package:nectar/themes/colors.dart';

class ChooseAddressPage extends StatefulWidget {
  const ChooseAddressPage({super.key});

  @override
  State<ChooseAddressPage> createState() => _ChooseAddressPageState();
}

class _ChooseAddressPageState extends State<ChooseAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppTabBar(text: 'Choose Address'),
      body: Column(children: [
        Expanded(
          child: ListView.separated(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20.0),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: address.length,
            itemBuilder: (context, index) {
              final add = address.reversed.toList()[index];
              return AppChooseAddress(
                address: add,
                onTap: () =>
                    setState(() => add.isDone = !(add.isDone ?? false)),
              );
            },
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 30.0).copyWith(bottom: 30),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: AppButton(
                  text: 'New Address',
                  bgColor: pyColor,
                  onTap: () {
                    // AddressModel newAddress = AddressModel(adddress: );
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: AppButton(
                  text: 'Next',
                  bgColor: pyColor,
                  onTap: () {},
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

void _newAddress() {}
