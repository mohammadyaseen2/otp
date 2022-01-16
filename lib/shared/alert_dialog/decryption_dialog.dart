part of 'dialog.dart';

mixin _DecryptionDialog {
  static get({
    required context,
    required plainText,
  }) =>
      showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          titleTextStyle: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
          title: Text(
            'Success Decryption',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
          content: SizedBox(
            width: 350,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: MyTextFormField(
                    validator: (value) {},
                    maxLines: 4,
                    label: 'Plain Text',
                    controller: TextEditingController()..text = plainText,
                    borderRadius: 5,
                    readOnly: true,
                    labelStyle: const TextStyle(color: primaryColor),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _copy(text: plainText, msg: 'Plain text is copied !');
                    },
                    icon: const Icon(Icons.copy_rounded, color: primaryColor))
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Back'),
              child: const Text('Back'),
            ),
          ],
        ),
      );
}
