import 'package:duszamobile2020/generated/l10n.dart';
import 'package:duszamobile2020/repository/preference_repository.dart';
import 'package:duszamobile2020/cubits/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LanguageChanger extends StatefulWidget {
  @override
  _LanguageChangerState createState() => _LanguageChangerState();
}

class _LanguageChangerState extends State<LanguageChanger> {
  void _onLanguageChange(BuildContext context, String val) async {
    print("language changed to: $val");
    await setCurrentLocale(val);
    BlocProvider.of<LocaleCubit>(context).nextLocale(val);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, String>(
      builder: (context, locale) {
        print("LOCALE: $locale");
        return DropdownButton(
          onChanged: (val) => _onLanguageChange(context, val),
          value: locale,
          items: [
            DropdownMenuItem(
              child: Text("Magyar"),
              value: "hu",
            ),
            DropdownMenuItem(
              child: Text("English"),
              value: "en",
            )
          ],
        );
      },
    );
  }
}
