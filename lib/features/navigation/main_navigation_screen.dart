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

        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: CustomSvg(
              path: AppAssets.navHome,
              color: _currentScreen == 0
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(
              path: AppAssets.navToDo,
              color: _currentScreen == 1
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            label: "To Do",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(
              path: AppAssets.navComplete,
              color: _currentScreen == 2
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            label: "Complete",
          ),
          BottomNavigationBarItem(
            icon: CustomSvg(
              path: AppAssets.navProfile,
              color: _currentScreen == 3
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: _screens[_currentScreen],
    );
  }
}
