import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:tokopedia_clone_ui/common/app_colors.dart';
import 'package:tokopedia_clone_ui/presentation/pages/feed_page.dart';
import 'package:tokopedia_clone_ui/presentation/pages/home_page.dart';
import 'package:tokopedia_clone_ui/presentation/pages/official_store_page.dart';
import 'package:tokopedia_clone_ui/presentation/pages/transaction_page.dart';
import 'package:tokopedia_clone_ui/presentation/pages/wishlist_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final navItems = [
    {
      'icon': 'assets/icons/ic_ramadhan_text.png',
      'label': 'Buat Kamu',
    },
    {
      'icon': 'assets/icons/ic_feed.png',
      'label': 'Feed',
    },
    {
      'icon': 'assets/icons/ic_official_store.png',
      'label': 'Official Store',
    },
    {
      'icon': 'assets/icons/ic_favorite.png',
      'label': 'Wishlist',
    },
    {
      'icon': 'assets/icons/ic_receipt.png',
      'label': 'Transaksi',
    },
  ];

  BottomNavigationBarItem navItem(int index, String icon, String label) {
    return BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(icon),
        color: _selectedIndex == index ? AppColors.primaryColor : Colors.grey,
        size: _selectedIndex == index ? 24 : 20,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: navItems.mapIndexed((index, item) {
          return navItem(
            index,
            item['icon'] ?? '',
            item['label'] ?? '',
          );
        }).toList(),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          FeedPage(),
          OfficialStorePage(),
          WishlistPage(),
          TransactionPage(),
        ],
      ),
    );
  }
}
