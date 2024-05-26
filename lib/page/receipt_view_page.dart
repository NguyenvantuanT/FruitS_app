import 'package:flutter/material.dart';
import 'package:nectar/components/app_tab_bar.dart';
import 'package:nectar/models/bill_model.dart';
import 'package:nectar/models/fruit_model.dart';
import 'package:nectar/themes/colors.dart';

class ReceiptViewPage extends StatefulWidget {
  const ReceiptViewPage({super.key});

  @override
  State<ReceiptViewPage> createState() => _ReceiptViewPageState();
}

class _ReceiptViewPageState extends State<ReceiptViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: const AppTabBar(
        text: "Receipt",
        color: AppColor.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 30).copyWith( top: 10,bottom: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (_,__) =>
                  const Padding(padding: EdgeInsets.all(10)),
              itemCount: invoices.length,
              itemBuilder: (context, index) {
                final invoice = invoices[index];
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
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
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            invoice.isPaid ? null: setState(() {
                              invoices.removeWhere((element) => element.id == invoice.id);
                              cartFruits.clear();
                            });
                          },
                          behavior: HitTestBehavior.translucent,
                            child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.delete))),
                        Text(invoice.displayDetailedReceipt()),
                      ],
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
