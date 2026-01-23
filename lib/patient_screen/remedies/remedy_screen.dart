import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';

class PCODCareScreen extends StatefulWidget {
  const PCODCareScreen({super.key});

  @override
  State<PCODCareScreen> createState() => _PCODCareScreenState();
}
Widget _sectionTitle(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 6),
      Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.pinkAccent.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ],
  );
}

Widget _animatedCard(
  BuildContext context, {
  required String title,
  required Color color,
  required List<String> content,
}) {
  return OpenContainer(
    transitionType: ContainerTransitionType.fadeThrough,
    transitionDuration: const Duration(milliseconds: 600),
    closedElevation: 0,
    openElevation: 0,
    closedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    closedColor: color,
    openColor: Colors.white,
    closedBuilder: (context, action) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Tap to view details",
              style: GoogleFonts.poppins(fontSize: 13),
            ),
          ],
        ),
      );
    },
    openBuilder: (context, action) {
      return DetailScreen(title: title, items: content);
    },
  );
}
class DetailScreen extends StatelessWidget {
  final String title;
  final List<String> items;

  const DetailScreen({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(milliseconds: 400 + index * 100),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 30 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  items[index],
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PCODCareScreenState extends State<PCODCareScreen> {
  final List<String> dietList = [
  "Eat whole grains like oats and millets",
  "Include leafy green vegetables daily",
  "Choose low-glycemic fruits",
  "Increase protein intake",
  "Add healthy fats like nuts and seeds",
  "Reduce sugar consumption",
  "Avoid junk and processed food",
  "Drink 2–3 liters of water daily",
  "Eat small, regular meals",
  "Limit excess dairy products",
];

final List<String> remedyList = [
  "Fenugreek seeds water every morning",
  "Cinnamon tea for insulin control",
  "Flax seeds daily",
  "Spearmint tea to reduce hormones",
  "Drink warm water after waking up",
  "Aloe vera juice regularly",
  "Apple cider vinegar (diluted)",
  "Turmeric milk (low fat)",
  "Practice yoga and meditation",
  "Get 7–8 hours of sleep",
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "PCOD Care",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _sectionTitle("🍽️ Diet Instructions"),
            const SizedBox(height: 12),
            _animatedCard(
              context,
              title: "PCOD Friendly Diet",
              color: const Color(0xFFE8F5E9),
              content: dietList,
            ),
            const SizedBox(height: 30),
            _sectionTitle("🌿 Home Remedies"),
            const SizedBox(height: 12),
            _animatedCard(
              context,
              title: "Natural Remedies",
              color: const Color(0xFFE1BEE7),
              content: remedyList,
            ),
          ],
        ),
      ),
    );
  }
}
