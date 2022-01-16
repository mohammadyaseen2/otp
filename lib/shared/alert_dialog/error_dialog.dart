part of 'dialog.dart';

mixin _ErrorDialog {
  static get({
    required context,
    required error,
  }) =>
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            title: const Text('Error', style: TextStyle(color: Colors.red)),
            content: Text(error, style: Theme.of(context).textTheme.bodyText1!),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
}
