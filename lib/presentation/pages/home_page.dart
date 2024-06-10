import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tokopedia_clone_ui/common/app_colors.dart';
import 'package:tokopedia_clone_ui/presentation/widgets/app_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int carouselIndex = 0;
  int carouselDuration = 10;

  late AnimationController indicatorController;

  @override
  void initState() {
    indicatorController = AnimationController(
      vsync: this,
      duration: Duration(seconds: carouselDuration),
    )..addListener(() {
        setState(() {});
      });
    indicatorController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    indicatorController.dispose();
    super.dispose();
  }

  Widget quickInfoItem({
    required BuildContext context,
    required Widget icon,
    required String title,
    required String desc,
    TextStyle? titleTextStyle,
    TextStyle? descTextStyle,
  }) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleTextStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 2),
            Text(
              desc,
              style: descTextStyle ??
                  Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.black,
                        letterSpacing: 0,
                      ),
            ),
          ],
        ),
      ],
    );
  }

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
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ImageIcon(
                        AssetImage(
                          'assets/icons/ic_location.png',
                        ),
                        color: AppColors.green,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      RichText(
                        text: TextSpan(
                          text: 'Dikirim ke ',
                          style: Theme.of(context).textTheme.bodySmall,
                          children: [
                            TextSpan(
                              text: 'Abdul Azis (Surabaya)',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 4),
                      const ImageIcon(
                        AssetImage(
                          'assets/icons/ic_arrow_down.png',
                        ),
                        color: AppColors.black,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            quickInfoItem(
                              context: context,
                              title: 'Rp999.999',
                              desc: '0 Coins',
                              icon: Image.asset(
                                'assets/icons/ic_gopay.png',
                                width: 26,
                                height: 26,
                              ),
                            ),
                            const SizedBox(width: 9.75),
                            VerticalDivider(
                              color: AppColors.grey.withOpacity(.1),
                              width: 1,
                            ),
                            const SizedBox(width: 9.75),
                            quickInfoItem(
                              context: context,
                              title: '70%',
                              desc: 'Langganan, Yuk!',
                              descTextStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.green,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0,
                                  ),
                              icon: Image.asset(
                                'assets/icons/ic_plus.png',
                                width: 26,
                                height: 26,
                              ),
                            ),
                            const SizedBox(width: 9.75),
                            VerticalDivider(
                              color: AppColors.grey.withOpacity(.1),
                              width: 1,
                            ),
                            const SizedBox(width: 9.75),
                            quickInfoItem(
                              context: context,
                              title: 'Silver',
                              desc: '16 Kupon Baru',
                              icon: Image.asset(
                                'assets/icons/ic_reward.png',
                                width: 26,
                                height: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 119,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            enableInfiniteScroll: true,
                            autoPlayInterval: Duration(
                              seconds: carouselDuration,
                            ),
                            autoPlay: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                carouselIndex = index;
                              });
                            },
                          ),
                          items: [
                            Image.asset(
                              'assets/images/banner.png',
                            ),
                            Image.asset(
                              'assets/images/banner.png',
                            ),
                            Image.asset(
                              'assets/images/banner.png',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: (index == carouselIndex) ? 45 : 6,
                              height: 6,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 2,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.white.withOpacity(.7),
                              ),
                              child: (index == carouselIndex)
                                  ? LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.white,
                                      value: indicatorController.value,
                                    )
                                  : null,
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
