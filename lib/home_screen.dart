import 'package:flutter/material.dart';
import 'package:font_dynamic_change_sample/font_change_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: () => _changeFont(),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("となりの客はよく柿喰う客だ")
          ],
        ),
      ),
    );
  }

  _changeFont() {
    final viewModel = Provider.of<FontChangeViewModel>(context, listen: false);
    viewModel.changeFont();

  }
}
