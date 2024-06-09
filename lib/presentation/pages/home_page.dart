import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tokopedia_clone_ui/common/app_colors.dart';
import 'package:tokopedia_clone_ui/presentation/widgets/app_textfield.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Stack(
        children: [
          Image.asset('assets/images/appbar_bg.png'),
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: AppTextField(
                      hintText: 'Cari di Tokopedia',
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 8,
                        ),
                        child: ImageIcon(
                          AssetImage(
                            'assets/icons/ic_magnifying_glass.png',
                          ),
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: () {},
                    child: const ImageIcon(
                      AssetImage('assets/icons/ic_envelope.png'),
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: const ImageIcon(
                      AssetImage('assets/icons/ic_bell.png'),
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: const ImageIcon(
                      AssetImage('assets/icons/ic_cart.png'),
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: const ImageIcon(
                      AssetImage('assets/icons/ic_more.png'),
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Center(
                child: Text('Home Page'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
