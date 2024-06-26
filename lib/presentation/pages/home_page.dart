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
  late TabController tabController;
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

  final promoAds = [
    'assets/images/promo_product_1.png',
    'assets/images/promo_product_2.png',
    'assets/images/promo_product_3.png',
  ];

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
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
    final theme = Theme.of(context);
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
                  theme.textTheme.bodySmall
                      ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 2),
            Text(
              desc,
              style: descTextStyle ??
                  theme.textTheme.labelSmall?.copyWith(
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
    final theme = Theme.of(context);
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
            style: theme.textTheme.labelSmall?.copyWith(
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

  Widget productByCategory() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      crossAxisCount: 2,
      childAspectRatio: .57,
      padding: const EdgeInsets.all(16),
      children: [
        const ProductItem(
          productName: 'Sandal Pria Loggo Duke Warna Navy',
          image: 'assets/images/sandal_1.png',
          price: 69900,
          originalPrice: 199900,
          location: 'Kota Bandung',
          extraSeru: true,
          bebasOngkir: true,
          beliLokal: true,
        ),
        const ProductItem(
          productName: 'Sandal Sun Swallow Black Urban',
          image: 'assets/images/sandal_3.png',
          price: 16400,
          location: 'Kab. Sleman',
          bebasOngkir: true,
          withCashback: false,
        ),
        const ProductItem(
          productName: 'S351-sandal empuk',
          image: 'assets/images/sandal_4.png',
          price: 80000,
          location: 'DKI Jakarta',
          bebasOngkir: true,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            'assets/images/discount_ads.png',
            fit: BoxFit.cover,
            width: 160,
            height: 280,
          ),
        ),
        const ProductItem(
          productName:
              'Limitless - Sandal Pria DRAGON Slide Eva ExtraLight Size 39-44',
          image: 'assets/images/sandal_5.png',
          price: 67900,
          originalPrice: 69000,
          location: 'Kota Surabaya',
          bebasOngkir: true,
          beliLokal: true,
          withCashback: false,
        ),
        const ProductItem(
          productName:
              'PORTO - Sandal Slide Pria Premium Model Trendy Bahan Karet 1062M',
          image: 'assets/images/sandal_6.png',
          price: 65900,
          originalPrice: 160000,
          location: 'DKI Jakarta',
          bebasOngkir: true,
          beliLokal: true,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return KeyboardDismisser(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white,
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
        ),
        body: Stack(
          children: [
            Image.asset('assets/images/appbar_bg.png'),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
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
                                    style: theme.textTheme.bodySmall,
                                    children: [
                                      TextSpan(
                                        text: 'Abdul Azis (Surabaya)',
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700),
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
                          const SizedBox(height: 16),
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
                                    descTextStyle:
                                        theme.textTheme.bodySmall?.copyWith(
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
                                  return Image.asset(
                                    'assets/images/banner.png',
                                  );
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
                                            borderRadius:
                                                BorderRadius.circular(50),
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
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Terbatas! Buruan Serbu',
                                      style:
                                          theme.textTheme.labelSmall?.copyWith(
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
                                          productName:
                                              'Sandal Pria Loggo Duke Warna Navy',
                                          image: 'assets/images/sandal_1.png',
                                          price: 69900,
                                          originalPrice: 199900,
                                          location: 'Kota Bandung',
                                          extraSeru: true,
                                          bebasOngkir: true,
                                          beliLokal: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 8),
                                        child: ProductItem(
                                          productName:
                                              'Sandal Pria Loggo Duke Warna Navy',
                                          image: 'assets/images/sandal_1.png',
                                          price: 69900,
                                          originalPrice: 199900,
                                          location: 'Kota Bandung',
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
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Pilihan Promo Hari Ini',
                                  style: theme.textTheme.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
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
                          SizedBox(
                            height: 227,
                            child: ListView.separated(
                              itemCount: promoAds.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 8);
                              },
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  promoAds[index],
                                  width: 130,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                          Divider(
                            color: AppColors.grey.withOpacity(.1),
                          ),
                        ],
                      ),
                    ),
                    SliverPersistentHeader(
                      floating: true,
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                        minHeight: 50,
                        maxHeight: 50,
                        child: ColoredBox(
                          color: AppColors.white,
                          child: TabBar(
                            controller: tabController,
                            dividerHeight: 0,
                            isScrollable: true,
                            indicatorColor: AppColors.green,
                            labelColor: AppColors.green,
                            tabAlignment: TabAlignment.start,
                            indicatorSize: TabBarIndicatorSize.label,
                            physics: const BouncingScrollPhysics(),
                            onTap: (value) {
                              tabController.animateTo(value);
                            },
                            tabs: [
                              const Tab(text: 'For Azis'),
                              Tab(
                                child: Image.asset(
                                  'assets/icons/ic_ramadhan_text_2.png',
                                  width: 73,
                                ),
                              ),
                              const Tab(text: 'Beli Lokal'),
                              const Tab(text: 'Action Figure'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: IndexedStack(
                        index: tabController.index,
                        children: [
                          productByCategory(),
                          productByCategory(),
                          productByCategory(),
                          productByCategory(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
