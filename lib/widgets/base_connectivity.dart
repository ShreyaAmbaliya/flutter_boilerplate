import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import 'no_internet.dart';

// A base widget to checked internet connectivity

class BaseConnectivity extends StatefulWidget {
  final Widget child;

  const BaseConnectivity({Key? key, required this.child}) : super(key: key);

  @override
  _BaseConnectivityState createState() => _BaseConnectivityState();
}

bool connected = true;

class _BaseConnectivityState extends State<BaseConnectivity> {
  bool wasOffline = false;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget builderChild,
      ) {
        connected = connectivity != ConnectivityResult.none;
        if (!connected && !wasOffline) {
          wasOffline = true;
        } else if (connected && wasOffline) {
          wasOffline = false;
        }
        return connected ? widget.child : NoInternet();
      },
      child: Container(),
    );
  }
}
