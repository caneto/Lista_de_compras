import 'package:shared_preferences/shared_preferences.dart';

class DailyPopupService {
  static const String _lastShownKey = 'daily_popup_last_shown_date';

  /// Checks if the popup should be shown today.
  /// Returns true if it hasn't been shown today.
  Future<bool> shouldShowPopup() async {
    final prefs = await SharedPreferences.getInstance();
    final String? lastShownString = prefs.getString(_lastShownKey);

    if (lastShownString == null) {
      // Never shown before
      return true;
    }

    final DateTime lastShownDate = DateTime.parse(lastShownString);
    final DateTime now = DateTime.now();

    // Check if the day, month, and year are the same
    final bool isSameDay =
        lastShownDate.year == now.year &&
        lastShownDate.month == now.month &&
        lastShownDate.day == now.day;

    return !isSameDay;
  }

  /// Marks the popup as shown for today.
  Future<void> markPopupAsShown() async {
    final prefs = await SharedPreferences.getInstance();
    final DateTime now = DateTime.now();
    await prefs.setString(_lastShownKey, now.toIso8601String());
  }
}
