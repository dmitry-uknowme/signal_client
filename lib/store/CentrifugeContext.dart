// ignore_for_file: prefer_function_declarations_over_variables

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:centrifuge/centrifuge.dart' as centrifuge;

class CentrifugeContext with ChangeNotifier {
  // const CentrifugeContext():listentWidget(),super()

  int _data = 0;
  int get data => _data;

  late centrifuge.Client client;
  final url = 'ws://192.168.31.244:8877/connection/websocket';

  final onEvent = (dynamic event) {
    print('client> $event');
  };

  Future<void> init() async {
    // try {
    client = centrifuge.createClient(url);

    // State changes.
    client.connecting.listen(onEvent);
    client.connected.listen(onEvent);
    client.disconnected.listen(onEvent);

    // Handle async errors.
    client.error.listen(onEvent);

    // Server-side subscriptions.
    client.subscribing.listen(onEvent);
    client.subscribed.listen(onEvent);
    client.unsubscribed.listen(onEvent);
    client.publication.listen(onEvent);
    client.join.listen(onEvent);
    client.leave.listen(onEvent);

    final subscription = client.newSubscription('weight');

    final onSubscriptionEvent = (centrifuge.PublicationEvent event) async {
      Uint8List charCodes = event.data as Uint8List;
      String jsonString = String.fromCharCodes(charCodes);
      Map<String, dynamic> object = json.decode(jsonString.trim());
      int weight = object['value'];
      _data = weight;
      notifyListeners();
    };

    // subscription.subscribing.listen(onSubscriptionEvent);
    // subscription.subscribed.listen(onSubscriptionEvent);
    // subscription.unsubscribed.listen(onSubscriptionEvent);

    // Messages.
    subscription.publication.listen(onSubscriptionEvent);
    // subscription.join.listen(onSubscriptionEvent);
    // subscription.leave.listen(onSubscriptionEvent);

    // Handle subscription async errors.
    // subscription.error.listen(onSubscriptionEvent);

    await subscription.subscribe();

    await client.connect();
  }

  // /// Makes `Counter` readable inside the devtools by listing all of its properties
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IntProperty('count', count));
  // }
}
