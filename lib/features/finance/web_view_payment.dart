import 'package:flutter/material.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPayment extends StatefulWidget {
  final String url;

  const WebViewPayment({super.key, required this.url});

  @override
  State<WebViewPayment> createState() => _WebViewPaymentState();
}

class _WebViewPaymentState extends State<WebViewPayment> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            if (mounted) {
              setState(() => _isLoading = false);
            }
          },
          onNavigationRequest: (NavigationRequest nav) {
            final url = nav.url;
            debugPrint("➡️ Đang điều hướng: $url");

            // Kiểm tra URL callback từ VNPay hoặc Server
            if (url.contains("vnpay-return") ||
                url.contains("payment-return")) {
              _handlePaymentResult(url);
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  void _handlePaymentResult(String url) {
    final uri = Uri.parse(url);
    // Giả sử server trả về query param 'vnp_ResponseCode' hoặc 'status'
    final responseCode = uri.queryParameters["vnp_ResponseCode"];
    final status = uri.queryParameters["status"];

    bool isSuccess = responseCode == "00" || status == "SUCCESS";

    if (mounted) {
      // Trả kết quả về màn hình trước đó
      Navigator.of(context).pop(isSuccess);

      // Hiển thị thông báo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(isSuccess
              ? "Thanh toán thành công!"
              : "Thanh toán thất bại hoặc đã bị hủy."),
          backgroundColor: isSuccess ? Colors.green : Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const AppText(
      //     "Thanh toán VNPay",
      //     style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: Colors.black),
      // ),
      body: Stack(
        children: [
          // WebView chính
          WebViewWidget(controller: _controller),

          // Hiển thị loading khi trang chưa tải xong
          if (_isLoading)
            Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF154EE7)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
