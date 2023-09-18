import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingCustomService {
  Future<void> onMessageReceived(RemoteMessage message) async {
    print(
        "Notificação recebida em segundo plano: ${message.notification?.title}");

    // Adicione código aqui para lidar com a notificação em segundo plano.
  }
}
