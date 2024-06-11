import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tokopedia_clone_ui/common/app_colors.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final bool extraSeru;
  final bool bebasOngkir;
  final bool beliLokal;

  const ProductItem({
    super.key,
    required this.image,
    this.extraSeru = false,
    this.bebasOngkir = false,
    this.beliLokal = false,
  });

  Widget promoItem({
    bool extraSeru = false,
    bool bebasOngkir = false,
    bool beliLokal = false,
  }) {
    const promoWidth = 36;

    final flags = {
      'extraSeru': extraSeru,
      'bebasOngkir': bebasOngkir,
      'beliLokal': beliLokal,
    };
    const promoData = [
      {
        'flag': 'extraSeru',
        'asset': 'assets/images/promo_ramadhan_w_bg.png',
      },
      {
        'flag': 'bebasOngkir',
        'asset': 'assets/images/bebas_ongkir_w_bg.png',
      },
      {
        'flag': 'beliLokal',
        'asset': 'assets/images/beli_lokal_w_bg.png',
      },
    ];

    return SizedBox(
      height: 15,
      child: Stack(
        children: promoData
            .where((item) => flags[item['flag']] ?? false)
            .mapIndexed((index, item) {
              return Positioned(
                left: ((promoWidth - 2) * index).toDouble(),
                child: Image.asset(
                  item['asset']!,
                  height: 15,
                ),
              );
            })
            .toList()
            .reversed
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 121,
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
                child: Image.asset(
                  image,
                  width: 121,
                  height: 121,
                ),
              ),
              promoItem(
                extraSeru: extraSeru,
                bebasOngkir: bebasOngkir,
                beliLokal: beliLokal,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(
              'Sandal Pria LOGG',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Rp69.900',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    'Rp199.900 ',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 6),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/ticket_bg.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                  'Cashback 16,08rb',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.red,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w800,
                        fontSize: 8,
                      ),
                ),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Text(
                  '+2 lain',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 8,
                        color: AppColors.orange,
                      ),
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ImageIcon(
                  AssetImage(
                    'assets/icons/ic_star.png',
                  ),
                  color: AppColors.yellow,
                  size: 14,
                ),
                const SizedBox(width: 2),
                Text(
                  '4.9',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.grey.withOpacity(.7),
                        letterSpacing: 0,
                      ),
                ),
                const SizedBox(width: 2),
                Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.grey.withOpacity(.7),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: Text(
                    '500+ terjual',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.grey.withOpacity(.7),
                          letterSpacing: 0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/ic_shop_badge.png',
                  width: 14,
                  height: 14,
                ),
                const SizedBox(width: 2),
                Text(
                  'Kota Bandung',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.grey.withOpacity(.7),
                        letterSpacing: 0,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
