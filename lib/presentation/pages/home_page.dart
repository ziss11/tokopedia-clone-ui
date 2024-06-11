import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:tokopedia_clone_ui/common/app_colors.dart';
import 'package:tokopedia_clone_ui/presentation/widgets/app_textfield.dart';
import 'package:tokopedia_clone_ui/presentation/widgets/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController indicatorController;

  int carouselIndex = 0;
  int carouselDuration = 5;

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
      height: 70,
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
                preferredSize: const Size.fromHeight(20),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 8,
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
                          items: [1, 2, 3].map((_) {
                            return Image.asset('assets/images/banner.png');
                          }).toList(),
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
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 160,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        itemCount: features.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.5,
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
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
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/mumpung_murah_produk.png',
                            width: 120,
                            height: 120,
                          ),
                          Image.asset(
                            'assets/images/ramadhan_produk.png',
                            width: 120,
                            height: 120,
                          ),
                          Image.asset(
                            'assets/images/murah_mantap_produk.png',
                            width: 120,
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Image.asset(
                      'assets/images/discount_banner.png',
                      width: double.infinity,
                      height: 120,
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Khusus Buat Kamu ~',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Terbatas! Buruan Serbu',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.white,
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: AppColors.grey.withOpacity(.2),
                                  width: 1,
                                ),
                              ),
                            ),
                            highlightColor: AppColors.white,
                            color: AppColors.white,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chevron_right,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF9F2F01),
                            Color(0xFF922C01),
                            Color(0xFF832802),
                            Color(0xFF762502),
                            Color(0xFF692202),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          const SizedBox(width: 8),
                          Image.asset(
                            'assets/images/deals_discount.png',
                            width: 137,
                            height: 256,
                          ),
                          const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(
                              left: 150,
                              top: 12,
                              bottom: 12,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: ProductItem(
                                    image: 'assets/images/sandal_1.png',
                                    extraSeru: true,
                                    bebasOngkir: true,
                                    beliLokal: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: ProductItem(
                                    image: 'assets/images/sandal_2.png',
                                    extraSeru: true,
                                    bebasOngkir: true,
                                    beliLokal: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: ProductItem(
                                    image: 'assets/images/sandal_1.png',
                                    extraSeru: true,
                                    bebasOngkir: true,
                                    beliLokal: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
