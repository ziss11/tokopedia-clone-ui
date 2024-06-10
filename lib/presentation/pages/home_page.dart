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
  int carouselDuration = 5;

  late AnimationController indicatorController;

  final features = [
    {'text': 'Promo Ramadhan', 'image': 'assets/images/promo_ramadhan.png'},
    {'text': 'Tiket & Hiburan', 'image': 'assets/images/tiket_hiburan.png'},
    {'text': 'Mumpung Murah', 'image': 'assets/images/mumpung_murah.png'},
    {'text': 'Toserba', 'image': 'assets/images/toserba.png'},
    {'text': 'Beli Lokal', 'image': 'assets/images/beli_lokal.png'},
    {'text': 'Fashion', 'image': 'assets/images/fashion.png'},
    {'text': 'Tokopedia Card', 'image': 'assets/images/tokopedia_card.png'},
    {'text': 'THR Ekstra', 'image': 'assets/images/thr_ekstra.png'},
    {'text': 'Keuangan', 'image': 'assets/images/keuangan.png'},
    {'text': 'Olahraga', 'image': 'assets/images/olahraga.png'},
    {'text': 'Tokopedia Seru', 'image': 'assets/images/tokopedia_seru.png'},
    {'text': 'Promo di Surabaya', 'image': 'assets/images/promo_lokal.png'},
    {'text': 'Live Shopping', 'image': 'assets/images/live_tokopedia.png'},
    {'text': 'Tokopedia Farma', 'image': 'assets/images/tokopedia_farma.png'},
    {'text': 'Promo Hari Ini', 'image': 'assets/images/promo_hari_ini.png'},
    {'text': 'Buku', 'image': 'assets/images/buku.png'},
  ];

  @override
  void initState() {
    indicatorController = AnimationController(
      vsync: this,
      duration: Duration(seconds: carouselDuration),
    )
      ..addListener(() => setState(() {}))
      ..repeat();
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

  Widget featureItem({
    required BuildContext context,
    required Widget image,
    required String text,
  }) {
    return SizedBox(
      width: 50,
      child: Column(
        children: [
          image,
          const SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 9,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                  letterSpacing: 0,
                ),
          ),
        ],
      ),
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
                  Badge.count(
                    count: 1,
                    backgroundColor: AppColors.red,
                    child: InkWell(
                      onTap: () {},
                      child: const ImageIcon(
                        AssetImage('assets/icons/ic_bell.png'),
                        color: AppColors.black,
                      ),
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
                            onScrolled: (value) {
                              indicatorController
                                ..forward(from: 0)
                                ..repeat();
                            },
                          ),
                          items: [
                            Image.asset('assets/images/banner.png'),
                            Image.asset('assets/images/banner.png'),
                            Image.asset('assets/images/banner.png'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
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
                    SizedBox(
                      height: 220,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        itemCount: features.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.9,
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          return featureItem(
                            context: context,
                            image: Image.asset(
                              features[index]['image']!,
                              width: 45,
                              height: 45,
                            ),
                            text: features[index]['text']!,
                          );
                        },
                      ),
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
