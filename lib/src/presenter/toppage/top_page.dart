import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/src/presenter/toppage/component/bottom_navigation_widget.dart';
import 'package:inabe_design/inabe_design.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.child,
      bottomNavigationBar: const BottomNavigationWidget()
    );
  }
}
