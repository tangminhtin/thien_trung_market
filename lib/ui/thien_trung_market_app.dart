import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:thien_trung_market/ui/home_screen.dart';
import 'package:thien_trung_market/ui/manage_screen.dart';
import 'package:thien_trung_market/ui/more_screen.dart';
import 'package:thien_trung_market/ui/post_screen.dart';
import 'package:thien_trung_market/ui/surf_screen.dart';

class ThienTrungMarketApp extends StatelessWidget {
  const ThienTrungMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ThienTrungMarket(),
    );
  }
}

class ThienTrungMarket extends StatefulWidget {
  const ThienTrungMarket({
    Key? key,
  }) : super(key: key);

  @override
  State<ThienTrungMarket> createState() => _ThienTrungMarketState();
}

class _ThienTrungMarketState extends State<ThienTrungMarket> {
  final _pages = const [
    HomeScreen(),
    SurfScreen(),
    PostScreen(),
    ManageScreen(),
    MoreScreen()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) => {
          setState(() {
            _selectedIndex = value;
          })
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_walk),
            label: 'Lướt chợ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Đăng tin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Quản lý tin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Thêm',
          ),
        ],
      ),
    );
  }
}
