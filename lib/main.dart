import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance UI',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto', 
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3D6BFF)),
      ),
      home: const HomePage(),
    );
  }
}   


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF3D6BFF);
    const Color lightBlueInner = Color(0xFF5A84FF);
    const Color menuGrey = Color(0xFFF0F2F5);
    const Color borderGrey = Color(0xFFE0E4E8);
    const Color backgroundGrey = Color(0xFFF5F7F9);
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
              color: Colors.white,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAjqU9tpxkG6J4WXcqi-qsbYMxBRPE8ubrdw&s',
                      width: 44, height: 44, fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Oe rubiela",
                    style: TextStyle(color: primaryBlue, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  _buildSquaredHeaderButton(Icons.notifications, menuGrey, borderGrey),
                  const SizedBox(width: 10),
                  _buildSquaredHeaderButton(Icons.more_vert, menuGrey, borderGrey),
                ],
              ),
            ),

            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: primaryBlue,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Your budget", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  const SizedBox(height: 5),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("\$ ", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      Text("2.868.000", style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(top: 22),
                        child: Text(",00", style: TextStyle(color: Colors.white70, fontSize: 24)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _buildMoneyCard("Incomes", "700.000,00", "From January 1 to January 31", Icons.arrow_upward, Colors.green, lightBlueInner),
                  const SizedBox(height: 15),
                  _buildMoneyCard("Spending", "90.000,00", "From January 1 to January 31", Icons.arrow_downward, Colors.redAccent, lightBlueInner),
                ],
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: _buildTabSwitcher(),
            ),

            
            Container(
              width: double.infinity,
              color: backgroundGrey, 
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("View All", style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold))),
                  ),
                  _buildCategoryItem("Food & Drink", "391.254,01", "+ \$ 2250 Today", "1.8%", Colors.green, "🍕"),
                  _buildCategoryItem("Electronics", "3.176.254,01", "+ \$ 2250 Today", "43.6%", Colors.green, "📺"),
                  _buildCategoryItem("Health", "38,01", "+ \$ 110 Today", "25.8%", Colors.red, "💊"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  Widget _buildSquaredHeaderButton(IconData icon, Color bgColor, Color borderColor, {bool hasBadge = false}) {
    return Container(
      width: 44, height: 44,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(icon, color: const Color(0xFF3D6BFF), size: 24),
          if (hasBadge)
            Positioned(
              right: 10, top: 10,
              child: Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
            ),
        ],
      ),
    );
  }

  Widget _buildMoneyCard(String title, String amount, String date, IconData icon, Color iconColor, Color cardColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("\$ $amount", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              Text(date, style: const TextStyle(color: Colors.white70, fontSize: 8)),
            ],
          ),
          const SizedBox(width: 10),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSwitcher() {
    return Container(
      height: 55,
      decoration: BoxDecoration(color: const Color(0xFFF4F6FF), borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Center(child: Text("Categories", style: TextStyle(fontWeight: FontWeight.bold))),
            ),
          ),
          const Expanded(child: Center(child: Text("Recent transaction", style: TextStyle(color: Colors.grey)))),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, String price, String subtitle, String percent, Color color, String emoji) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 55, width: 55,
            decoration: BoxDecoration(color: const Color(0xFFF8F9FE), borderRadius: BorderRadius.circular(15)),
            child: Center(child: Text(emoji, style: const TextStyle(fontSize: 25))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    _buildPercentBadge(percent, color),
                  ],
                ),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text("\$ ", style: TextStyle(color: Color(0xFF3D6BFF), fontWeight: FontWeight.bold)),
                    Text(price, style: const TextStyle(color: Color(0xFF3D6BFF), fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPercentBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Icon(color == Colors.green ? Icons.arrow_drop_up : Icons.arrow_drop_down, color: color, size: 18),
          Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11)),
        ],
      ),
    );
  }
}