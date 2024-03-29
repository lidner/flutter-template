import 'package:animated_qr_code_scanner/AnimatedQRViewController.dart';
import 'package:animated_qr_code_scanner/animated_qr_code_scanner.dart';
import 'package:flutter/material.dart';

import 'myWebView.dart';

class TestPage extends StatelessWidget {
  final AnimatedQRViewController controller = AnimatedQRViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedQRView(
              squareColor: Colors.green.withOpacity(0.25),
              animationDuration: const Duration(milliseconds: 400),
              onScanBeforeAnimation: (String str) {
                print('Callback at the beginning of animation: $str');
              },
              onScan: (String str) async {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => MyWebView(
                      title: 'MS SOS',
                      selectedUrl: '$str',
                    )));
                // await showDialog(
                //   context: context,
                //   builder: (context) => AlertDialog(
                //     title: Text("Callback at the end of animation: $str"),
                //     actions: [
                //       FlatButton(
                //         child: Text('OK'),
                //         onPressed: () {
                //           Navigator.of(context).pop();
                //           Navigator.of(context).pop();
                //           Navigator.of(context).push(
                //             MaterialPageRoute(
                //               builder: (context) => Scaffold(
                //                 body: Align(
                //                   alignment: Alignment.center,
                //                   child: Text("$str"),
                //                 ),
                //               ),
                //             ),
                //           );
                //         },
                //       ),
                //       FlatButton(
                //         child: Text('Rescan'),
                //         onPressed: () {
                //           Navigator.of(context).pop();
                //           controller.resume();
                //         },
                //       ),
                //     ],
                //   ),
                // );
              },
              controller: controller,
            ),
          ),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       FlatButton(
          //         color: Colors.blue,
          //         child: Text('Flash'),
          //         onPressed: () {
          //           controller.toggleFlash();
          //         },
          //       ),
          //       const SizedBox(width: 10),
          //       FlatButton(
          //         color: Colors.blue,
          //         child: Text('Flip'),
          //         onPressed: () {
          //           controller.flipCamera();
          //         },
          //       ),
          //       const SizedBox(width: 10),
          //       FlatButton(
          //         color: Colors.blue,
          //         child: Text('Resume'),
          //         onPressed: () {
          //           controller.resume();
          //         },
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}