import 'package:flutter/widgets.dart';
import 'package:manage/dialogs/generic_dialog.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog(
      context: context,
      title: 'Log Out',
      content: 'Are you sure you want to log out',
      optionalBuilder: () => {
            'Cancel': false,
            'Log Out': true,
          }).then((value) => value ?? false);
}
