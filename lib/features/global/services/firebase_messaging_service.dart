import 'package:breathe_app/features/global/services/local_notifications_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  // Private constructor for singleton pattern
  FirebaseMessagingService._internal();

  // Singleton instance
  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._internal();

  // Factory constructor to provide singleton instance
  factory FirebaseMessagingService.instance() => _instance;

  // Reference to local notifications service for displaying notifications
  LocalNotificationsService? _localNotificationsService;

  /// Initialize Firebase Messaging and sets up all message listeners
  Future<void> init({
    required LocalNotificationsService localNotificationsService,
  }) async {
    try {
      // Init local notifications service
      _localNotificationsService = localNotificationsService;

      // Request user permission for notifications first
      await _requestPermission();

      // Handle FCM token with retry logic
      await _handlePushNotificationsToken();

      // Register handler for background messages (app terminated)
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      // Listen for messages when the app is in foreground
      FirebaseMessaging.onMessage.listen(_onForegroundMessage);

      // Listen for notification taps when the app is in background but not terminated
      FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

      // Check for initial message that opened the app from terminated state
      final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        _onMessageOpenedApp(initialMessage);
      }
    } catch (e) {
      print('Error initializing Firebase Messaging: $e');
      // You might want to retry initialization or show user-friendly message
    }
  }

  /// Retrieves and manages the FCM token for push notifications with retry logic
  Future<void> _handlePushNotificationsToken() async {
    int maxRetries = 3;
    int currentAttempt = 0;
    
    while (currentAttempt < maxRetries) {
      try {
        // Add a small delay before attempting to get token
        if (currentAttempt > 0) {
          await Future.delayed(Duration(seconds: currentAttempt * 2));
        }
        
        // Get the FCM token for the device
        final token = await FirebaseMessaging.instance.getToken();
        
        if (token != null) {
          print('Push notifications token: $token');
          // TODO: Send token to your server for targeting this device
          break; // Success, exit retry loop
        } else {
          print('FCM token is null, attempt ${currentAttempt + 1}');
        }
      } catch (e) {
        currentAttempt++;
        print('Error getting FCM token (attempt $currentAttempt): $e');
        
        if (currentAttempt >= maxRetries) {
          print('Failed to get FCM token after $maxRetries attempts');
          // You might want to schedule a retry later or notify the user
          return;
        }
      }
    }

    // Listen for token refresh events
    FirebaseMessaging.instance.onTokenRefresh
        .listen((fcmToken) {
          print('FCM token refreshed: $fcmToken');
          // TODO: Send updated token to your server
        })
        .onError((error) {
          print('Error refreshing FCM token: $error');
        });
  }

  /// Requests notification permission from the user
  Future<void> _requestPermission() async {
    try {
      // Request permission for alerts, badges, and sounds
      final result = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      // Log the user's permission decision
      print('User granted permission: ${result.authorizationStatus}');
      
      // Handle different permission states
      switch (result.authorizationStatus) {
        case AuthorizationStatus.authorized:
          print('User granted permission');
          break;
        case AuthorizationStatus.provisional:
          print('User granted provisional permission');
          break;
        case AuthorizationStatus.denied:
          print('User denied permission');
          break;
        case AuthorizationStatus.notDetermined:
          print('Permission not determined');
          break;
      }
    } catch (e) {
      print('Error requesting permission: $e');
    }
  }

  /// Handles messages received while the app is in the foreground
  void _onForegroundMessage(RemoteMessage message) {
    try {
      print('Foreground message received: ${message.data.toString()}');
      final notificationData = message.notification;
      if (notificationData != null) {
        // Display a local notification using the service
        _localNotificationsService?.showNotification(
          notificationData.title,
          notificationData.body,
          message.data.toString(),
        );
      }
    } catch (e) {
      print('Error handling foreground message: $e');
    }
  }

  /// Handles notification taps when app is opened from the background or terminated state
  void _onMessageOpenedApp(RemoteMessage message) {
    try {
      print('Notification caused the app to open: ${message.data.toString()}');
      // TODO: Add navigation or specific handling based on message data
    } catch (e) {
      print('Error handling message opened app: $e');
    }
  }

  /// Check if Firebase Messaging is available on this device
  Future<bool> isAvailable() async {
    try {
      await FirebaseMessaging.instance.getToken(vapidKey: null);
      return true;
    } catch (e) {
      print('Firebase Messaging not available: $e');
      return false;
    }
  }
}

/// Background message handler (must be top-level function or static)
/// Handles messages when the app is fully terminated
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    print('Background message received: ${message.data.toString()}');
    // Handle background message logic here
  } catch (e) {
    print('Error handling background message: $e');
  }
}