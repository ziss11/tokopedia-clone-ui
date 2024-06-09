import 'package:flutter/material.dart';
import 'package:tokopedia_clone_ui/common/app_colors.dart';
import 'package:tokopedia_clone_ui/presentation/pages/main_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tokopedia App Clone UI',
      theme: ThemeData(
        fontFamily: 'OpenSauceOne',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
