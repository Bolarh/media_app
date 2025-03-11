
import 'package:flutter/material.dart';

class NavigationHelper {
  static Widget navigatingBackWithBackIcon(BuildContext context) {
    return BackButton(
      onPressed: () => (Navigator.pop(context)),
      color: Theme.of(context).colorScheme.onSurface,
    );
  }

  static Widget navigatingBackWithBackIconOnDarkBlue(BuildContext context) {
    return BackButton(
      onPressed: () => (Navigator.pop(context)),
    );
  }

  static void navigatingToNextScreen(
      BuildContext context, Widget destinationScreen) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return destinationScreen;
    }));
  }

  static void navigatingBackToPreviousScreen(BuildContext context, Widget destinationScreen) {
    Navigator.of(context).pop(context);
  }

  static void navigatingToNextScreenAndNoReturnToPreviousScreen(
      BuildContext context, Widget destinationScreen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) {
          return destinationScreen;
        }), (route) => false);
  }
}
