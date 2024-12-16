import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void superPrint(var content, {var title = 'Super Print'}) {
  String callerFrame = '';

  if (kDebugMode) {
    try {
      final stackTrace = StackTrace.current;
      final frames = stackTrace.toString().split("\n");
      callerFrame = frames[1];
    } catch (e1) {
      debugPrint(e1.toString(), wrapWidth: 1024);
    }

    DateTime dateTime = DateTime.now();
    String dateTimeString =
        '${dateTime.hour} : ${dateTime.minute} : ${dateTime.second}.${dateTime.millisecond}';
    debugPrint('', wrapWidth: 1024);
    debugPrint(
        '- ${title.toString()} - ${callerFrame.split('(').last.replaceAll(')', '')}',
        wrapWidth: 1024);
    debugPrint('____________________________');
    try {
      debugPrint(
          const JsonEncoder.withIndent('  ')
              .convert(const JsonDecoder().convert(content)),
          wrapWidth: 1024);
    } catch (e1) {
      try {
        debugPrint(
            const JsonEncoder.withIndent('  ')
                .convert(const JsonDecoder().convert(jsonEncode(content))),
            wrapWidth: 1024);
      } catch (e1) {
        debugPrint(content.toString());
        // saveLogFromException(e1,e2);;
      }
      // saveLogFromException(e1,e2);;
    }
    debugPrint('____________________________ $dateTimeString');
  }
}

class AppFunctions {

  void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void vibrateNow() {
    try {
      HapticFeedback.selectionClick();
    } catch (_) {}
  }

  bool xBlocProvided<T>(BuildContext context) {
    try {
      context.read<T>();
      return true;
    } catch (e) {
      return false;
    }
  }

}
