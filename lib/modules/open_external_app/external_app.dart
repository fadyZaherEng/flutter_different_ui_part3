import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';

class OpenExternalAppScreen extends StatelessWidget {
  const OpenExternalAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          width: 150,
          child: Column(
            children:
            [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () async {
                    var openAppResult = await LaunchApp.openApp(
                      androidPackageName: 'com.instagram.android',
                      iosUrlScheme: 'pulsesecure://',
                      appStoreLink:
                      'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041',
                    );
                    print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
                    // Enter thr package name of the App you want to open and for iOS add the URLscheme to the Info.plist file.
                    // The second arguments decide wether the app redirects PlayStore or AppStore.
                    // For testing purpose you can enter com.instagram.android
                  },
                  child: const Center(
                    child: Text(
                      "Open",
                      textAlign: TextAlign.center,
                    ),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () async {
                    var isAppInstalledResult = await LaunchApp.isAppInstalled(
                      androidPackageName: 'com.instagram.android',
                      iosUrlScheme: 'pulsesecure://',
                      // openStore: false
                    );
                    print(
                        'isAppInstalledResult => $isAppInstalledResult ${isAppInstalledResult.runtimeType}');
                  },
                  child: const Center(
                    child: Text(
                      "Is app installed?",
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

