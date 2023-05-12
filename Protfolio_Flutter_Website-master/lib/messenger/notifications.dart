import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

showfirebasnotifications(BuildContext context) {
  FirebaseMessaging.onMessage.listen((event) {
    showflutternotifications(event, context);
  });
}

void showflutternotifications(RemoteMessage message, BuildContext context) {
  RemoteNotification? notification = message.notification;
  shownotification(
      context, notification!.title.toString(), notification.body.toString());
}

shownotification(BuildContext context, String texts, String description) {
  ElegantNotification.info(title: Text(texts), description: Text(description))
      .show(context);
}

errornotification(String errorMessage, BuildContext context) {
  //shownotification(context, error, error);
  ElegantNotification.error(
          animation: AnimationType.fromBottom,
          notificationPosition: NotificationPosition.bottomCenter,
          title: const Text("Error"),
          description: Text(errorMessage))
      .show(context);
}

void showfluttererrorNotification(BuildContext context, String errormessage) {
  errornotification(errormessage, context);
}
