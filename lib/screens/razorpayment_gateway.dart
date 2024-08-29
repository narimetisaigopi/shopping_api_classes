import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopping_api_classes/screens/products_screen.dart';
class RazorpaymentGateway extends StatefulWidget {
  const RazorpaymentGateway({super.key});

  @override
  State<RazorpaymentGateway> createState() => _RazorpaymentGatewayState();
}

class _RazorpaymentGatewayState extends State<RazorpaymentGateway> {
  Razorpay _razorpay = Razorpay();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              var options = {
                'key': 'rzp_test_SHO15jj5fCGbi2',
                'amount': 100,
                'name': 'Acme Corp.',
                'description': 'Fine T-Shirt',
                'prefill': {
                  'contact': '8888888888',
                  'email': 'test@razorpay.com'
                }
              };
              _razorpay.open(options);
            },
            child: Text("Pay now")),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    
    // Do something when payment succeeds
    print("_handlePaymentSuccess ${response.data.toString()}");
 Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductsScreen()),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("_handlePaymentError ${response.message.toString()}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
}
