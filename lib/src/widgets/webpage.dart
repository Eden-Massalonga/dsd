import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatefulWidget {
  WebPage({this.url, this.descricao});

  final String url, descricao;

  @override
  _WebPageState createState() =>
      _WebPageState(url: this.url, descricao: this.descricao);
}

class _WebPageState extends State<WebPage> {
  _WebPageState({this.url, this.descricao});

  String url, descricao;

  @override
  Widget build(BuildContext context) {
    // WebViewController _controller;
    // print(url);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Web'),
    //   ),
    //   body: WebView(
    //     initialUrl: 'http://www.dsd.uem.mz/',
    //     javascriptMode: JavascriptMode.unrestricted,
    //     onWebViewCreated: (WebViewController webViewController) {
    //       _controller = webViewController;
    //     },
    //   ),
    // );

    return WebviewScaffold(
      url: this.url,
      appBar: AppBar(
        title: Text(this.descricao),
      ),
      displayZoomControls: true,
      withZoom: true,
      hidden: true,
    );
  }
}
