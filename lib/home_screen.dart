import 'dart:io';
import 'package:google_paymet_integration/paymet_config.dart';
import 'package:pay/pay.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String os = Platform.operatingSystem;

  var applePayButton = ApplePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(defaultApplePay),
      paymentItems: const [
        PaymentItem(
            label: 'Item 1',
            amount: '200',
            status: PaymentItemStatus.final_price),
        PaymentItem(
            label: 'Item 3',
            amount: '200',
            status: PaymentItemStatus.final_price),
        PaymentItem(
            label: 'Item 4',
            amount: '200',
            status: PaymentItemStatus.final_price),
      ],
      style: ApplePayButtonStyle.black,
      type: ApplePayButtonType.buy,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: (result) => debugPrint(' Payment Result $result'),
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
  );

  var googlePayButton = GooglePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(defaultGooglePay),
      paymentItems: const [
        PaymentItem(
            label: 'Item 1',
            amount: '200',
            status: PaymentItemStatus.final_price),
        PaymentItem(
            label: 'Item 3',
            amount: '200',
            status: PaymentItemStatus.final_price),
        PaymentItem(
            label: 'Item 4',
            amount: '200',
            status: PaymentItemStatus.final_price),
      ],
      type: GooglePayButtonType.buy,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: (result) => debugPrint(' Payment Result $result'),
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(child: Platform.isIOS ? applePayButton : googlePayButton),
      ),
    );
  }
}
