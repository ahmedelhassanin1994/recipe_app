
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_project/core/common/app_settings/app_settings.dart';
import 'package:mvvm_project/core/common/data/model/WebViewArgment.dart';
import 'package:mvvm_project/core/resources/constants/color_manager.dart';
import 'package:mvvm_project/core/resources/constants/value_manager.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
class WebView_Screen extends StatefulWidget{

  WebViewArgment? webViewArgment;

  WebView_Screen({this.webViewArgment});

  @override
  _WebView_Screen createState() => _WebView_Screen();
}


class _WebView_Screen extends State<WebView_Screen> {



  late final WebViewController _controller;
  bool isLoading = true;
  int selectedIndex = 1;


  @override
  void initState() {
    // TODO: implement initState
  late final PlatformWebViewControllerCreationParams params;
  if (WebViewPlatform.instance is WebKitWebViewPlatform) {
    params = WebKitWebViewControllerCreationParams(
      allowsInlineMediaPlayback: true,
      mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
    );
  } else {
    params = const PlatformWebViewControllerCreationParams();
  }
  final token = Provider
      .of<AppSettings>(context, listen: false)
      .token_payment;
  Map<String, String> headers = {"Cookie": "$token"};

  final WebViewController controller =
  WebViewController.fromPlatformCreationParams(params);
  // #enddocregion platform_features

  controller
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          if (progress == 100) {
            selectedIndex = 0;
            setState(() {

            });
          }
          debugPrint('WebView is loading (progress : $progress%)');
        },
        onPageStarted: (String url) {
          debugPrint('Page started loading: $url');
        },
        onPageFinished: (String url) {
          debugPrint('Page finished loading: $url');
        },
        onWebResourceError: (WebResourceError error) {
          debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
        },
        onNavigationRequest: (NavigationRequest request) {
          // if (request.url.startsWith('https://www.youtube.com/')) {
          //   debugPrint('blocking navigation to ${request.url}');
          //   return NavigationDecision.prevent;
          // }
          // debugPrint('allowing navigation to ${request.url}');
           return NavigationDecision.navigate;
        },
        onUrlChange: (UrlChange change) {
          // debugPrint('url change to ${change.url}');
        },
      ),
    )
    ..addJavaScriptChannel(
      'Toaster',
      onMessageReceived: (JavaScriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    )
    ..loadRequest(Uri.parse('${widget.webViewArgment!.url}'),headers:headers,method: LoadRequestMethod.post,);

  // #docregion platform_features
  if (controller.platform is AndroidWebViewController) {
    AndroidWebViewController.enableDebugging(true);
    (controller.platform as AndroidWebViewController)
        .setMediaPlaybackRequiresUserGesture(false);
  }
  // #enddocregion platform_features

  _controller = controller;
}

  @override
  Widget build(BuildContext context) {
    /// is Mobile or Web

    // TODO: implement build
   return SafeArea(child:
   Scaffold(
     appBar: AppBar(
       backgroundColor: ColorManager.select,
       elevation: 0.0,
       centerTitle: true,
       title: Text(
         widget.webViewArgment!.tittle ?? '',
         style: Theme.of(context)
             .textTheme
             .titleLarge!
             .copyWith(fontWeight: FontWeight.w600),
       ),
       leadingWidth: AppSize.s30.w,

       actions: [

         IconButton(
           onPressed: () async {

             Navigator.of(context).pop();
           },
           icon:  Icon(Icons.close,color: ColorManager.primary,),
         ),
       ],
       leading: Builder(
         builder: (buildContext) {
           return Row(
             children: [

               IconButton(
                 icon:  Icon(Icons.arrow_back_ios,color: ColorManager.primary,),
                 onPressed: () {
                   if (Navigator.canPop(context)) {
                     Navigator.of(context).pop();
                   }
                 },
               ),

               IconButton(
                 onPressed: () {
                   _controller.canGoBack();
                 },
                 icon:  Icon(Icons.arrow_forward_ios,color: ColorManager.primary,),
               ),
             ],
           );
         },
       ),
     ),
   body: IndexedStack(
     index: selectedIndex,
    children: [
       WebViewWidget(controller: _controller,
       ),
      Center(
        child: CircularProgressIndicator(color: ColorManager.primary,),
      )
   ],
    )));
  }

}