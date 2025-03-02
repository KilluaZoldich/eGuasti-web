import 'dart:html' as html;

class WebNotificationHelper {
  Future<bool> checkPermission() async {
    // Check if notifications are supported in this browser
    if (html.Notification.supported) {
      // Check current permission state
      final permission = html.Notification.permission;
      return permission == 'granted';
    }
    return false;
  }

  Future<bool> requestPermission() async {
    if (!html.Notification.supported) return false;
    
    try {
      final permission = await html.Notification.requestPermission();
      return permission == 'granted';
    } catch (e) {
      print('Error requesting notification permission: $e');
      return false;
    }
  }

  Future<void> notifyOutage(int id, String title, String text) async {
    if (!html.Notification.supported) return;
    
    final hasPermission = await checkPermission();
    if (!hasPermission) {
      final granted = await requestPermission();
      if (!granted) return;
    }
    
    try {
      html.Notification(title, body: text);
    } catch (e) {
      print('Error showing notification: $e');
    }
  }
}