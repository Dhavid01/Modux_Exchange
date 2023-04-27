import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  int selectedindex = 0;
  final List<String> webviewList = [
    "https://app.moduxexchange.com",
    "https://app.moduxexchange.com/rate/",
    "https://app.moduxexchange.com/chat/",
    "https://api.whatsapp.com/send?phone=2348149969567&text=Hello%20Modux%20Exchange,%20I%20Havet%20a%20complain%20about",
    "https://app.moduxexchange.com/profile/",
  ];
  late WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                  label: "Rate,"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  label: "Chat"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.headphones,
                    color: Colors.white,
                  ),
                  label: "Contact us"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_pin,
                    color: Colors.white,
                  ),
                  label: "Profile"),
            ],
            currentIndex: selectedindex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            onTap: (i) {
              controller.loadUrl(webviewList[i]);
              setState(() {
                selectedindex;
                controller;
              });
            },
          ),
          body: WebView(
            initialUrl: webviewList[selectedindex],
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (c) {
              controller = c;
            },
          )),
    );
  }
}
