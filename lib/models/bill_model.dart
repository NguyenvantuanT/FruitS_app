import 'package:intl/intl.dart';
import 'package:nectar/models/fruit_model.dart';

class InvoiceModel {
  String? id;
  List<FruitModel>? receipts;
  bool isPaid;

  InvoiceModel({
    this.id,
    this.receipts,
    this.isPaid = false,
  });

  String displayDetailedReceipt() {
    double total = 0.0;
    final receipt = StringBuffer();
    receipt.writeln('Đây là hóa đơn chi tiết của bạn.');
    receipt.writeln();
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('------------');
    if (receipts != null) {
      for (FruitModel rec in receipts ?? []) {
        receipt.writeln(
            '${rec.quantity} x ${rec.name} x ${_formatPrice(rec.price)}');
        total += rec.total;
      }
    }
    receipt.writeln('------------');
    receipt.writeln('Tổng giá: ${_formatTotal(total)}');
    receipt
        .writeln('Trạng thái: ${isPaid ? 'Đã thanh toán' : 'Chưa thanh toán'}');

    return receipt.toString();
  }

  String _formatPrice(double? price) {
    return '\$${(price ?? 0.0).toStringAsFixed(2)}';
  }

  String _formatTotal(double total) {
    return '\$${total.toStringAsFixed(2)}';
  }
}

List<InvoiceModel> invoices = [];
