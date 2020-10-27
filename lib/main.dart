import 'package:flutter/material.dart';
import 'package:font_dynamic_change_sample/font_change_view_model.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

/*
* フォントの動的変更
* https://github.com/flutter/flutter/issues/17910#issuecomment-445184463
* */

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => FontChangeViewModel(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FontChangeViewModel>(context);

    return MaterialApp(
      title: "フォントの動的変更",
      theme: ThemeData(
        brightness: Brightness.dark,
        //nullの場合はデフォルトフォント
        fontFamily: viewModel.fontFamily,
      ),
      home: HomeScreen(),
    );
  }
}
