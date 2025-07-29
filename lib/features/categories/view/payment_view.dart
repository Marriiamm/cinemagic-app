// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_splashh/core/widgets/buttons.dart';

import '../../../core/utils/app_styles.dart';
import '../../../core/utils/constants.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20, color: white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Payment Method', style: AppStyles.styleSemiBold18),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 12),
            RadioButton(cardNum: "4522 **** **** ****", paymentWay: 'Paypal'),
            const SizedBox(height: 12),
            RadioButton(cardNum: "4582 **** **** ****", paymentWay: 'Stripe'),
            const SizedBox(height: 12),
            RadioButton(cardNum: "5267 **** **** ****", paymentWay: 'paymob'),
            Spacer(),
            CustomButton(buttonLabel: "Pay"),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key,
    required this.cardNum,
    required this.paymentWay,
  });

  final String cardNum;
  final String paymentWay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white54),
      ),
      child: ListTile(
        title: Text(cardNum, style: AppStyles.styleSemiBold14White),
        leading: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          height: 35,
          width: 70,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(width: 1.5, color: red),
          ),
          child: Text(paymentWay, style: AppStyles.styleSemiBold11),
        ),
        onTap: () {},
        trailing: Radio<int>(
          activeColor: red,
          value: 1,
          groupValue: 1,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
