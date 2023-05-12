import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendNotificationToAllUsers(String title, String body) async {
  const String serverKey = 'YOUR_SERVER_KEY_HERE';
  const String topic = 'AllUsers';

  final Uri url = Uri.parse('https://fcm.googleapis.com/fcm/send');
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'key=$serverKey',
  };

  final Map<String, dynamic> notification = <String, dynamic>{
    'title': title,
    'body': body,
  };

  final Map<String, dynamic> data = <String, dynamic>{
    'click_action': 'FLUTTER_NOTIFICATION_CLICK',
    'sound': 'default',
  };

  final Map<String, dynamic> message = <String, dynamic>{
    'notification': notification,
    'data': data,
    'topic': topic,
  };

  final http.Response response = await http.post(
    url,
    headers: headers,
    body: jsonEncode(message),
  );

  if (response.statusCode == 200) {
    print('Notification sent successfully');
  } else {
    print('Error sending notification: ${response.body}');
  }
}
