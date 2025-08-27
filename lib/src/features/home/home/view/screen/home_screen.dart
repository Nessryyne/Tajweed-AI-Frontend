import '../../../../../base/screens/exports.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../../main/view/screen/main_screen.dart';

class HomeScreen extends StatefulWidget {
  final Widget? child;

  const HomeScreen({super.key, this.child});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> _routes = ['/home', '/learn', '/practice', '/progress'];

  @override
  void initState() {
    super.initState();
    // Set initial index based on current route
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateCurrentIndex();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateCurrentIndex();
  }

  void _updateCurrentIndex() {
    if (!mounted) return;

    final location = GoRouterState.of(context).uri.path;
    final index = _routes.indexWhere((route) => location.startsWith(route));
    if (index != -1 && index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
      // Update the URL to reflect the current tab
      context.go(_routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child ?? MainScreen(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
