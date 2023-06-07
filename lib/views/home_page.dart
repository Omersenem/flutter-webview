import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  SafeArea(
        child:
        Column(

          children: [

            Expanded(

              child: WebView(
                  allowsInlineMediaPlayback: true,
                  debuggingEnabled: false,
                  initialMediaPlaybackPolicy:
                  AutoMediaPlaybackPolicy.always_allow,

                initialUrl: "http://youtube.com",
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: {
                  JavascriptChannel(
                    name: "flutter",
                    onMessageReceived: (JavascriptMessage message) {
                      if (message.message == "onSubscribeClick") {
                        print("onSubscribeClick");
                      }
                    },
                  )
                },

              ),
            ),
          ],
        ),
      )
    );
  }
}