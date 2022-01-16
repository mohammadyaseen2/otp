part of 'dialog.dart';

mixin _EncryptionDialog {
  static get({
    required context,
    required key,
    required cipherText,
  }) =>
      showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Theme.of(context).backgroundColor,
          titleTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
          title: const Text(
            'Success Encryption',
          ),
          content: SizedBox(
            width: 500,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MyTextFormField(
                            validator: (value) {},
                            maxLines: 4,
                            label: 'Cipher Text',
                            controller: TextEditingController()
                              ..text = cipherText,
                            borderRadius: 5,
                            readOnly: true,
                            labelStyle: const TextStyle(color: primaryColor),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _copy(
                                  text: cipherText,
                                  msg: 'Cipher text is copied !');
                            },
                            icon: const Icon(Icons.copy_rounded,
                                color: primaryColor))
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: MyTextFormField(
                            validator: (value) {},
                            readOnly: true,
                            maxLines: 4,
                            label: 'Key',
                            controller: TextEditingController()..text = key,
                            labelStyle: const TextStyle(color: primaryColor),
                            borderRadius: 5,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _copy(text: key, msg: 'Key is copied !');
                            },
                            icon: const Icon(Icons.copy_rounded,
                                color: primaryColor))
                      ],
                    ),
                  ],
                ),
              ),
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
