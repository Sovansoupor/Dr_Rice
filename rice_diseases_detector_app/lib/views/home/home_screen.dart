import 'package:flutter/material.dart';
import 'package:my_app/models/diagnoses.dart';
import 'package:my_app/views/home/feature_button.dart';
import 'package:my_app/views/home/recent_diagnosis_card.dart';
import 'package:my_app/widgets/bottom_navigation_bar.dart';
import '../../core/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Diagnoses> getRecentDiagnoses() {
    return [
      Diagnoses(
        title: 'Disease 1',
        description: 'Lorem ipsum lorem ipsum',
        time: '2h ago',
        imagePath: 'assets/images/disease_thumbnail.jpg',
      ),
      Diagnoses(
        title: 'Disease 2',
        description: 'Lorem ipsum lorem ipsum',
        time: '5h ago',
        imagePath: 'assets/images/disease_thumbnail.jpg',
      ),
      Diagnoses(
        title: 'Disease 3',
        description: 'Lorem ipsum lorem ipsum',
        time: 'January 24, 2025',
        imagePath: 'assets/images/disease_thumbnail.jpg',
      ),
    ];
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation logic if needed
    // Example:
    // if (index == 1) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => ScanScreen()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    final recentDiagnoses = getRecentDiagnoses();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/logo.png', height: 65),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Text('🇬🇧', style: TextStyle(fontSize: 22)),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Feature Buttons Grid
            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                FeatureButton(
                  icon: 'assets/icons/wheat_icon.png',
                  label: 'Common Diseases',
                ),
                FeatureButton(
                  icon: 'assets/icons/scan_icon.png',
                  label: 'Rice Scan',
                ),
                FeatureButton(
                  icon: 'assets/icons/report.png',
                  label: 'Report Disease',
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Recent Diagnoses
            const Text('Recent Diagnoses', style: AppColors.titleStyle),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: recentDiagnoses.length,
                itemBuilder: (context, index) => RecentDiagnoseCard(
                  diagnose: recentDiagnoses[index],
                ),
              ),
            ),
          ],
        ),
      ),

      // Custom Bottom Navigation
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
