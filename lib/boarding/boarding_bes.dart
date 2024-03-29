import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:voxpollui/boarding/onboarding_page.dart';

class BoardinBes extends StatefulWidget {
  final String userId;
  const BoardinBes({Key? key, required this.userId}) : super(key: key);
  @override
  State<BoardinBes> createState() => _BoardinBesState();
}

class _BoardinBesState extends State<BoardinBes> {  
  List<String> interests = [];

  List<bool> isSelected = List.generate(18, (_) => false);

  @override
  void initState() {
    super.initState();
    _fetchInterests();
  }

  Future<void> _fetchInterests() async {
    final ParseResponse response = await ParseObject('Interest').getAll();
    if (response.success && response.results != null) {
      setState(() {
        interests = response.results!.map((e) => e.get<String>('name') as String).toList();
      });
    } else {
      // Handle error
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50,),
        const Text(
          'İlgi Alanları',
          style: TextStyle(
          color: Color(0xFF0C0C0C),
          fontSize: 40,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
          height: 0,
          ),
        ),
        const SizedBox(height: 20,),
        const Text(
          '5 adet seçebilir ve profilinizden güncelleyebilirsiniz.',
          style: TextStyle(
          color: Color(0xFF0C0C0C),
          fontSize: 13,
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
          height: 0.08,
          ),
        ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3,
              ),
              itemCount: interests.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected[index] = !isSelected[index];
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected[index] ? const Color(0xFF2355FF) : Colors.white,
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      interests[index],
                      style: TextStyle(
                        color: isSelected[index] ? Colors.white : Colors.black
                      ),  
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingPage()));
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            height: 49,
            margin: const EdgeInsets.all(31), // Burası ekranın kenar boşluklarını ayarlar
            decoration: ShapeDecoration(
              color: const Color(0xFF2355FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: const Center(
              child: Text(
                'İleri',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }
}