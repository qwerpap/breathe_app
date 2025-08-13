import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TrackingRepository {
  static const String _sentKey = 'hasSentTrackingData'; //shared prefs

  TrackingRepository();

  //данные отправлятся только 1 раз
  Future<bool> hasSentData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_sentKey) ?? false;
  }

  //данные отправлятся только 1 раз
  Future<void> markDataSent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_sentKey, true);
  }

  Future<bool> isTrackerLinkValid(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      return response.statusCode >= 200 && response.statusCode < 400;
    } catch (e) {
      return false;
    }
  }

  //SUPABASE//SUPABASE//SUPABASE//SUPABASE//SUPABASE//SUPABASE//SUPABASE//SUPABASE
  //SUPABASE//SUPABASE//SUPABASE//SUPABASE//SUPABASE//SUPABASE//SUPABASE//SUPABASE
  Future<bool> sendTrackingData(Map<String, String> data) async {
    try {
      final supabase = Supabase.instance.client;


      // EXAMPLE EXAMPLE EXAMPLE
      // Предполагаем, что у вас есть таблица 'tracking_data' в Supabase
      final response = await supabase
          .from('tracking_data')
          .insert({
            'analytics_id': data['analyticsId'],
            'notification_token': data['notificationToken'],
            'app_name': data['appName'],
            'tracker_token': data['trackerToken'],
            'created_at': DateTime.now().toIso8601String(),
          });

      return response.error == null;
    } catch (e) {
      print('Ошибка отправки данных в Supabase: $e');
      return false;
    }
  }
}
