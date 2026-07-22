import 'package:to_do/app_exports.dart';

import '../home/presentation/home_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentScreen = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    ToDoScreen(),
    CompletedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreen,
        onTap: (int? index) {
          setState(() {
            _currentScreen = index ?? 0;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.background,
        unselectedItemColor: AppColors.textGrey,
        selectedItemColor: AppColors.primaryGreen,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.navHome,
              colorFilter: ColorFilter.mode(
                _currentScreen == 0
                    ? AppColors.primaryGreen
                    : AppColors.textGrey,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.navToDo,
              colorFilter: ColorFilter.mode(
                _currentScreen == 1
                    ? AppColors.primaryGreen
                    : AppColors.textGrey,
                BlendMode.srcIn,
              ),
            ),
            label: "To Do",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.navComplete,
              colorFilter: ColorFilter.mode(
                _currentScreen == 2
                    ? AppColors.primaryGreen
                    : AppColors.textGrey,
                BlendMode.srcIn,
              ),
            ),
            label: "Complete",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.navProfile,
              colorFilter: ColorFilter.mode(
                _currentScreen == 3
                    ? AppColors.primaryGreen
                    : AppColors.textGrey,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
      body: _screens[_currentScreen],
    );
  }
}
