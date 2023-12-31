import 'dart:math';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:provider/provider.dart';
import 'package:voxpollui/class/model/user.dart';
import 'package:voxpollui/class/widget_class.dart';
import 'package:voxpollui/notifier/theme.dart';
import 'package:voxpollui/script/database.dart';
import 'createpoll.dart';
import 'notifications_page.dart';

Database database = Database();
DataManager dataManager = DataManager();

List<Map<String, dynamic>>? pollObjects;
List<Map<String, dynamic>>? creatorObjects;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Page0(),
    const SearchPage(1), // Bu satırı değiştirin
    const PlaceholderPage(2),
    const CommunityPage(3),
    ProfilePage(
      i: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return SizedBox(
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(Icons.home, 0),
          _buildNavBarItem(Icons.search, 1),
          _buildAddButton(),
          _buildNavBarItem(Icons.notifications, 3),
          _buildNavBarItem(Icons.person, 4),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: SizedBox(
        width: 36,
        height: 36,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(icon,
                  color:
                      _currentIndex == index ? const Color(0xff2355ff) : Colors.grey,
                  size: 32),
            ),
            if (_currentIndex == index)
              Transform.translate(
                offset: const Offset(0, 45),
                child: Transform.rotate(
                  angle: -45 * (3.14159265359 / 180),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xff2355ff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreatePollPage()),
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF2355FF),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final int pageIndex;

  const PlaceholderPage(this.pageIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page $pageIndex'),
    );
  }
}

class Page0 extends StatefulWidget {
  const Page0({super.key});

  @override
  State<Page0> createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  bool showUnansweredSurveyBox = true;
  List<dynamic>? followed;
  List<dynamic>? followers;
  String username = 'Yükleniyor..';
  String surname = 'Yükleniyor..';
  String createrId = 'Yükleniyor..';

  Map<String, dynamic>? polls; // Anketleri saklamak için bir liste
  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
    _loadPolls(); // Anketleri yüklemek için fonksiyonu çağırın
  }

  void _loadPolls() async {
    Map<dynamic, dynamic> fetchedPolls = await database.fetchPolls();
    // print('FETCHEDPOLLS   $fetchedPolls');
    await dataManager.setCombinedResults(fetchedPolls);

    setState(() {
      pollObjects = dataManager.getPolls();
      creatorObjects = dataManager.getCreators();
    });
  }

  Future<void> _loadCurrentUser() async {
    ParseUser? currentUser = await ParseUser.currentUser();
    currentUser.fetch();
      setState(() {
        username = currentUser.username!;
        surname = currentUser.get<String>('surname') ?? 'Soyad test';
        followed = currentUser.get<List<dynamic>>('followed') ?? [];
        followers = currentUser.get<List<dynamic>>('followers') ?? [];
        //userObjectId = currentUser.get<String>('objectId') ?? 'Varsayılan ID';
      });//@
  }
    List<Offset> starPositions = [];
    final Random _random = Random();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double _alignX = -1.3; // Başlangıçta sol butonun altında olacak
  void generateStarPositions() {
    starPositions.clear();
    int rowCount = 5;
    int colCount = 5;
    double containerWidth = 80.0;
    double containerHeight = 30.0;

    double intervalX = containerWidth / (colCount - 1);
    double intervalY = containerHeight / (rowCount - 1);

    for (int row = 0; row < rowCount; row++) {
      for (int col = 0; col < colCount; col++) {
        double left = col * intervalX + _random.nextDouble() * 10 - 5;
        double top = row * intervalY + _random.nextDouble() * 10 - 5;
        starPositions.add(Offset(left, top));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeNotifier>(context).isDarkMode;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              accountName: Text(
                '$username $surname',
                style: const TextStyle(
                  color: Color(0xFF0C0C0C),
                  fontSize: 20,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              accountEmail: Column(
                children: [
                  Text(
                    '@$username \n',
                    style: const TextStyle(
                      color: Color(0xFF646464),
                      fontSize: 14,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Takip Edilen ${followed?.length ?? 0}',
                        style: const TextStyle(
                          color: Color(0xFF0C0C0C),
                          fontSize: 14,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Takipçi ${followers?.length ?? 0}',
                        style: const TextStyle(
                          color: Color(0xFF0C0C0C),
                          fontSize: 14,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage("assets/login.png"),
              ),
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Profil',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF0C0C0C),
                      fontSize: 20,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                  )
                ],
              ),
              onTap: () {
                // Profil sayfasına yönlendirme
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'VoxPoll Pro',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF2355FF),
                      fontSize: 20,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                  ),
                ],
              ),
              onTap: () {
                // VoxPoll Pro sayfasına yönlendirme
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'İlgi Alanları',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF0C0C0C),
                      fontSize: 20,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                  )
                ],
              ),
              onTap: () {
                // İlgi Alanları sayfasına yönlendirme
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Topluluklar',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF0C0C0C),
                      fontSize: 20,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                  )
                ],
              ),
              onTap: () {
                // Topluluklar sayfasına yönlendirme
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Arkadaşlarını Davet Et',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF0C0C0C),
                      fontSize: 20,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                  )
                ],
              ),
              onTap: () {
                // Topluluklar sayfasına yönlendirme
              },
            ),
            // Diğer ListTile widget'ları...
            const Divider(),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Üretici Araçları',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF0C0C0C),
                      fontSize: 20,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                  )
                ],
              ),
              onTap: () {
                // Ayarlar ve Destek sayfasına yönlendirme
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Ödemeler',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF0C0C0C),
                      fontSize: 20,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                  )
                ],
              ),
              onTap: () {
                // Ayarlar ve Destek sayfasına yönlendirme
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Ayarlar ve Destek',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF0C0C0C),
                      fontSize: 20,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                  )
                ],
              ),
              onTap: () {
                // Ayarlar ve Destek sayfasına yönlendirme
              },
            ),
            ListTile(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'S.S.S',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF0C0C0C),
                      fontSize: 20,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      height: 0.12,
                    ),
                  )
                ],
              ),
              onTap: () {
                // S.S.S. sayfasına yönlendirme
              },
            ),
            ListTile(
              trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        isDarkMode = !isDarkMode;
                        _alignX = isDarkMode ? 1.3 : -1.3;
                        generateStarPositions(); // Gökyüzü rengini değiştirdiğimizde noktaları yeniden oluştur
                      });
                      Provider.of<ThemeNotifier>(context, listen: false)
                          .toggleTheme();
                    },
                    child: Container(
                      width: 80.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: isDarkMode
                            ? const Color.fromARGB(255, 88, 7, 146)
                            : Colors.blue,
                      ),
                      child: Stack(
                        children: [
                          // Nokta şeklinde yıldızlar
                          if (isDarkMode) ...[
                            for (Offset position in starPositions)
                              Positioned(
                                left: position.dx,
                                top: position.dy,
                                child: Container(
                                  width: 2.0,
                                  height: 2.0,
                                  color: Colors.white, // Nokta rengi
                                ),
                              ),
                          ] else
                            for (int i = 0; i < 5; i++)
                              for (int j = 0; j < 5; j++)
                                Positioned(
                                  left: j * 40.0,
                                  top: i * 40.0,
                                  child: const Icon(
                                    Icons.cloud,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                          AnimatedAlign(
                            alignment: Alignment(_alignX, 0),
                            duration: const Duration(milliseconds: 200),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isDarkMode ? Colors.black : Colors.white,
                              ),
                              child: Icon(
                                isDarkMode
                                    ? Icons.nightlight_round
                                    : Icons.wb_sunny_rounded,
                                color: isDarkMode ? Colors.blue : Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              onTap: () {
                // S.S.S. sayfasına yönlendirme
              },
            ),
            // Alt kısımdaki butonlar için Spacer ve Row widget'ları kullanılabilir
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Text(
                      'Hoş Geldiniz',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 0.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$username $surname',
                              style: const TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${followed?.length ?? 0}',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationsPage()),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState!
                                .openEndDrawer(); // openEndDrawer'ı çağırın
                          },
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/login.png'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
              SliverAppBar(
                pinned: true,
                floating: true,
                toolbarHeight: 0.0,
                expandedHeight: showUnansweredSurveyBox ? 126.0 : 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: showUnansweredSurveyBox
                      ? Container(
                          padding: const EdgeInsets.all(16.0),
                          width: 1000,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: const LinearGradient(
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft,
                              colors: [
                                Color(0xff2355ff),
                                Color(0xff001866),
                                Color(0xff153cc1),
                              ],
                              stops: [0.0, 1.0, 1.0],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '14',
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: 'Cevaplanmamış Anketiniz Var.',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () {
                                  //Anketleri görüntüle butonu
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: const BorderSide(
                                          width: 2, color: Colors.white),
                                    ),
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: const Text(
                                    'Anketleri Görüntüle',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(height: 10.0),
                    const Text(
                      'Takip Ettiklerim',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    if (dataManager.getPolls()?.isEmpty ?? true) {
                      // Eğer polls null veya boş ise, yükleme göstergesi veya mesaj göster
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Color(0xFF2355FF),
                      ));
                    }
                    return ForWidget.buildCard(
                        context, creatorObjects!, pollObjects!, index);
                  },
                  childCount: (dataManager.getPolls()?.isNotEmpty ?? false)
                      ? dataManager.getPolls()?.length
                      : 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  final int pageIndex;

  const SearchPage(this.pageIndex, {super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Database database = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // İçeriği SafeArea içerisine alın
        child: Column(
          children: [
            Container(
              height: 40.0, // Yüksekliği 40.0 piksel yapın
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8.0),
                  Text(
                    'Ara',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            // Diğer widget'larınız burada
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const SizedBox(height: 10.0),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Keşfet',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (dataManager.getPolls()?.isEmpty ?? true) {
                          // Eğer polls null veya boş ise, yükleme göstergesi veya mesaj göster
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Color(0xFF2355FF),
                          ));
                        }
                        return ForWidget.buildCard(
                            context, creatorObjects!, pollObjects!, index);
                      },
                      childCount: (dataManager.getPolls()?.isNotEmpty ?? false)
                          ? dataManager.getPolls()?.length
                          : 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommunityPage extends StatefulWidget {
  final int pageIndex;

  const CommunityPage(this.pageIndex, {super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 40.0,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8.0),
                  Text(
                    'Ara',
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: creatorObjects == null
                  ? const CircularProgressIndicator(
                      color: Color(0xFF2355FF),
                    )
                  : ListView(
                      children: [
                        const SizedBox(height: 10.0),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Topluluklarım',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ...List.generate(creatorObjects!.length,
                            (index) => _buildCardCommunity(context, index)),
                        const SizedBox(height: 10.0),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Önerilen Topluluklar',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ...List.generate(
                            creatorObjects!.length,
                            (index) => _buildCardCommunityWithJoinButton(
                                context, index)),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  List<Map<dynamic, dynamic>>? pollData;
  int? i;
  
  ProfilePage({super.key, this.pollData, this.i});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isFollowing = false;
  //bool _showUnansweredSurveyBox = true;
  dynamic followed;
  dynamic followers;
  String objectId = 'ObjectId Hatası';
  String username = 'Yükleniyor..';
  String name = 'Yükleniyor..';
  String surname = 'Yükleniyor..';
  String createrId = 'Yükleniyor..';
  String biyografi = 'Yükleniyor..';
  bool? isMe;
  String viewObjectId = ''; // Bu satırı ekleyin
  dynamic joinPoll;

  Map<String, dynamic>? polls;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    viewObjectId =
        widget.pollData?[widget.i ?? 0]['creator']['objectId'] ?? 'Hata';
    checkIfFollowing(
        viewObjectId); // Bu fonksiyonu çağırırken viewObjectId'i geçirin
    if (widget.pollData == null) {
      _loadCurrentUser();
      isMe = true;
    } else {
      _loadPollData();
      isMe = false;
    }
    _loadPolls();
  }

  void _loadPolls() async {
    var fetchedPolls = await database.fetchPolls();
    setState(() {
      polls = fetchedPolls;
      _isLoading = false;
    });
  }

  Future<void> _loadPollData() async {
    ParseUser? currentUser = await ParseUser.currentUser();
    dynamic joinPoll = await Database.countUserPollResponses(
        widget.pollData![widget.i ?? 0]['creator']['objectId'] ??
            'ObjectIDDDDDDD');
    // print('${joinPoll}    JOİN POLL');
    setState(() {
      joinPoll = joinPoll;
      objectId = currentUser.get<String>('objectId') ?? 'ObjectIDDDDDDD';
      username = widget.pollData![widget.i ?? 0]['creator']['username'] ??
          'Yükleniyor..';
      name =
          widget.pollData![widget.i ?? 0]['creator']['name'] ?? 'Yükleniyor..';
      surname = widget.pollData![widget.i ?? 0]['creator']['surname'] ??
          'Yükleniyor..';
      followed = widget.pollData![widget.i ?? 0]['creator']['followed'] ?? '0';
      biyografi = widget.pollData![widget.i ?? 0]['creator']['biography'] ?? '';
      followers =
          widget.pollData![widget.i ?? 0]['creator']['followers'] ?? '0';
    });
  }

  Future<void> _loadCurrentUser() async {
    ParseUser? currentUser = await ParseUser.currentUser();
    dynamic joinPoll = await Database.countUserPollResponses(
        currentUser.get<String>('objectId') ?? 'ObjectIDDDDDDD');
    // print('${joinPoll}   _loadCurrentUser JOİN POLL');
      setState(() {
        joinPoll = joinPoll;
        username = currentUser.username!;
        objectId = currentUser.get<String>('objectId') ?? 'ObjectIDDDDDDD';
        name = currentUser.get<String>('name') ?? 'name test';
        surname = currentUser.get<String>('surname') ?? 'Soyad test';
        followed = currentUser.get<dynamic>('followed') ?? '0';
        biyografi = currentUser.get<String>('biography') ?? '';
        followers = currentUser.get<dynamic>('followers') ?? '0';
      });
  }

  @override
  Widget build(BuildContext context) {
    // final data = widget.pollData ?? {
    //   'creator': {
    //     'username': username,
    //     'name': name,
    //     'surname': surname,
    //     'followed': followed,
    //     'biography': biyografi,
    //     'followers': followers,
    //   }
    // };
    final viewObjectId =
        widget.pollData?[widget.i ?? 0]['creator']['objectId'] ?? 'Hata';
    // print('$objectId   GİRİŞ YAPAN KULLANICI OBJECTID ');
    // print('$viewObjectId        GÖRÜNTÜLENEN KULLANICI OBJECTID');

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            if (_isLoading)
              const CircularProgressIndicator()
            else
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/cover.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.settings, color: Colors.black),
                onPressed: () {},
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0, -50, 0),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profilepicture.png'),
              ),
            ),
            Text(
              "${widget.pollData?[widget.i ?? 0]['creator']['name'] ?? name} ${widget.pollData?[widget.i ?? 0]['surname'] ?? surname}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('@$username'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                biyografi,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn('Takip Edilen', '${followed?.length ?? 0}'),
                _buildStatColumn('Takipçi', '${followers?.length ?? 0}'),
                _buildStatColumn('Katıldığı Anket',
                    '${joinPoll ?? 7}'), // Katıldığı anket sayısını sabit olarak veriyorum, gerektiğine göre düzeltebilirsiniz.
              ],
            ),
            const Divider(),
            const TabBar(
              tabs: [
                Tab(text: 'Katıldıklarım'),
                Tab(text: 'Oluşturduklarım'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  if (polls != null)
                    ListView.builder(
                      itemCount: polls!.length,
                      itemBuilder: (BuildContext context, int index) {
                        // List<Map<String, dynamic>> bos = [{}];
                        return _buildCardCommunityWithJoinButton(
                            context, index);
                      },
                    ),
                  if (polls != null)
                    ListView.builder(
                      itemCount: polls!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildCardCommunity(context, index);
                      },
                    ),
                ],
              ),
            ),
            isMe == true
                ? const Material()
                : Align(
                    alignment: Alignment.centerRight, // Sağ ortada
                    child: _buildFollowButton(viewObjectId),
                  ),
          ],
        ),
      ),
    );
  }

  Column _buildStatColumn(String label, dynamic number) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Future<void> updateFollowStatus(String currentUserObjectId,
      String viewedUserObjectId, bool isFollowing) async {
    try {
      // ParseObject olarak kullanıcıları oluştur
      var currentUser = ParseObject('_User')..objectId = currentUserObjectId;
      var viewedUser = ParseObject('_User')..objectId = viewedUserObjectId;

      // Takip edilen ve takipçiler listesini al
      List<dynamic> currentUserFollowed =
          currentUser.get<List<dynamic>>('followed') ?? [];
      List<dynamic> viewedUserFollowers =
          viewedUser.get<List<dynamic>>('followers') ?? [];

      // Takip etme veya takipten çıkma işlemini gerçekleştir
      if (isFollowing) {
        currentUserFollowed.remove(viewedUserObjectId);
        viewedUserFollowers.remove(currentUserObjectId);
      } else {
        currentUserFollowed.add(viewedUserObjectId);
        viewedUserFollowers.add(currentUserObjectId);
      }

      // Güncellenmiş listeleri set et
      currentUser.set('followed', currentUserFollowed);
      viewedUser.set('followers', viewedUserFollowers);

      // Güncellemeleri kaydet
      var responseCurrentUser = await currentUser.save();
      var responseViewedUser = await viewedUser.save();

      if (responseCurrentUser.success && responseViewedUser.success) {
        // print('Takip durumu başarıyla güncellendi');
      } else {
        // print('Takip durumu güncellenirken hata oluştu ${responseCurrentUser.error}'); //Not : Else içine giriyor ama veritabanından takip etme ve takipten çıkma işlemini gerçekleştiriyor
      }
    } catch (e) {
      // print('Bir hata oluştu: $e');
      throw Exception(e);
    }
  }

  Future<void> checkIfFollowing(String viewObjectId) async {
    // Giriş yapan kullanıcıyı al
    ParseUser? currentUser = await ParseUser.currentUser();
      // Giriş yapan kullanıcının takip ettiği kişilerin listesini al
      List<dynamic> followedUsers =
          currentUser.get<List<dynamic>>('followed') ?? [];

      // Görüntülenen kullanıcının objectId'si bu listede var mı diye kontrol et
      setState(() {
        isFollowing = followedUsers.contains(viewObjectId);
      });
      // print(
      //     '${followedUsers.contains(viewObjectId)}   Görüntülenen Takip Ediyo Mu Etmiyo Mu');
  }

  Widget _buildFollowButton(String viewObjectId) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 150),
      child: ElevatedButton(
        onPressed: () async {
          await updateFollowStatus(objectId, viewObjectId, isFollowing);
          setState(() {
            isFollowing = !isFollowing;
          });
        },
        child: Text(
          isFollowing ? 'Takibi Bırak' : 'Takip Et',
          style: const TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isFollowing ? Colors.red : Colors.blue,
        ),
      ),
    );
  }
}

Widget _buildCardCommunityWithJoinButton(BuildContext context, int index) {
  return ListTile(
    leading: const CircleAvatar(
      backgroundImage: AssetImage('assets/login.png'),
    ),
    title: Row(
      children: [
        const Text('Topluluk Adı '),
        const SizedBox(width: 4.0),
        const Icon(Icons.check_circle, color: Colors.blue, size: 16.0),
        const SizedBox(width: 4.0),
        Text('@${creatorObjects![index]['username']}',
            style: const TextStyle(fontSize: 12.0)),
      ],
    ),
    subtitle: const Text('Topluluk Açıklaması'),
    trailing: TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProfilePage(pollData: pollObjects, i: 4)));
      },
      child: const Text('Katıl'),
      style: TextButton.styleFrom(
        foregroundColor : Colors.blue,
        backgroundColor: Colors.transparent,
      ),
    ),
  );
}

Widget _buildCardCommunity(BuildContext context, int index) {
  //String toplulukNameOrnektir = creator != null ? creator.get<String>('name') ?? 'Bilinmiyor' : 'Bilinmiyor';

  return ListTile(
    leading: const CircleAvatar(
      backgroundImage: AssetImage('assets/login.png'),
    ),
    title: Row(
      children: [
        const Text('Topluluk Adı'),
        const SizedBox(width: 4.0),
        const Icon(Icons.check_circle, color: Colors.blue, size: 16.0),
        const SizedBox(width: 4.0),
        Text('@${creatorObjects![index]['username']}',
            style: const TextStyle(fontSize: 12.0)),
      ],
    ),
    subtitle: const Text('Topluluk Açıklaması'),
    trailing: InkWell(
      onTap: () {
        // Burada tıklama olayını işleyin
        // print('Trailing ikonuna tıklandı!');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ProfilePage(pollData: creatorObjects, i: 4)));
      },
      child: const Icon(Icons.arrow_forward),
    ),
  );
}
