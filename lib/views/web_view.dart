import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  int selectedindex = 0;
  final List<String> webviewList = [
    "https://app.moduxexchange.com/",
    "https://app.moduxexchange.com/rate/",
    "https://app.moduxexchange.com/chat/",
    "https://app.moduxexchange.com/support/",
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
                  label: "Rate"),
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
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            showUnselectedLabels: false,
            onTap: (i) {
              controller.loadUrl(webviewList[i]);
              setState(() {
                selectedindex = i;
              });
            },
          ),
          body: WebView(
            initialUrl: webviewList[selectedindex],
            initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (c) {
              controller = c;
            },
          )),
    );
  }
}
