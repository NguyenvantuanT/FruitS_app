import 'package:flutter/material.dart';
import 'package:nectar/components/app_button.dart';
import 'package:nectar/components/app_choose_address_box.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/components/app_text_form_field.dart';
import 'package:nectar/models/address_model.dart';
import 'package:nectar/page/payment_method_page.dart';
import 'package:nectar/themes/colors.dart';

class ChooseAddressPage extends StatefulWidget {
  const ChooseAddressPage({super.key});

  @override
  State<ChooseAddressPage> createState() => _ChooseAddressPageState();
}

enum SingingCharacter { lafayette, jefferson }

class _ChooseAddressPageState extends State<ChooseAddressPage> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController localController = TextEditingController();
  AddressModel? _selectedAddress;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppTabBar(text: 'Choose Address'),
      body: Column(children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(top: 20.0, bottom: 20),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: address.length,
            itemBuilder: (context, index) {
              final add = address.reversed.toList()[index];
              return AppChooseAddress(
                address: add,
                selectedAddress: _selectedAddress,
                onChanged: (AddressModel? value) => setState(
                  () => _selectedAddress = value,
                ),
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
                  bgColor: AppColor.green,
                  onTap: () => _newAddress(context),
                ),
              ),
              Flexible(
                flex: 1,
                child: AppButton(
                  text: 'Next',
                  bgColor: AppColor.green,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentMethodPage())),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  void _newAddress(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Your Address 🏠'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    AppTextFormField(
                      controller: addressController,
                      hintText: 'Address',
                      textInputAction: TextInputAction.next,
                    ),
                    AppTextFormField(
                      controller: nameController,
                      hintText: 'Name',
                      textInputAction: TextInputAction.next,
                    ),
                    AppTextFormField(
                      controller: localController,
                      hintText: 'Local',
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
              ),
              actions: [
                AppButton(
                  text: 'Save',
                  bgColor:  AppColor.green,
                  onTap: () {
                    AddressModel newAddress = AddressModel(
                        adddress: addressController.text.trim(),
                        name: nameController.text.trim(),
                        local: localController.text.trim());
                    address.add(newAddress);
                    setState(() {});
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
