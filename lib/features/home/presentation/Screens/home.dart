import 'package:flutter/material.dart';
import 'package:eazy/core/config/app_palette.dart';
import 'package:eazy/core/config/images_manager.dart';
import 'package:eazy/features/home/presentation/widgets/home_widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.backgroundLight,
      appBar: _buildAppBar(),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchSection(),
            SizedBox(height: 15),
            WelcomeSection(),
            SizedBox(height: 10),
            PromotionalBanner(),
            SizedBox(height: 10),
            ServicesSection(),
            SizedBox(height: 10),
            ContinueLessonsSection(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppPalette.backgroundLight,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'مرحباً بك في',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(2),
                  child: Image.asset(
                    ImagesManager.eazytxt,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(),
            child: SvgPicture.asset(ImagesManager.notification),
          ),
        ],
      ),
    );
  }
}

class ContinueLessonsSection extends StatelessWidget {
  const ContinueLessonsSection({Key? key}) : super(key: key);
// قسم استكمل دروسك الجديد
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'استكمل دروسك',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        const ContinueLessonsCard(),
      ],
    );
  }
}
