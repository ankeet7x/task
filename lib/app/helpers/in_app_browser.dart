import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

openWebPage(String link) async {
  FlutterWebBrowser.openWebPage(
    url: link,
    customTabsOptions: const CustomTabsOptions(
      colorScheme: CustomTabsColorScheme.dark,
      defaultColorSchemeParams: CustomTabsColorSchemeParams(
        toolbarColor: Colors.white,
        secondaryToolbarColor: Colors.white,
        navigationBarColor: Colors.black,
      ),
      shareState: CustomTabsShareState.on,
      instantAppsEnabled: true,
      showTitle: true,
      urlBarHidingEnabled: true,
    ),
    safariVCOptions: const SafariViewControllerOptions(
      barCollapsingEnabled: true,
      preferredBarTintColor: Colors.white,
      preferredControlTintColor: Colors.black,
      dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      modalPresentationCapturesStatusBarAppearance: true,
    ),
  );
}
