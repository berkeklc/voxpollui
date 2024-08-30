import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:voxpollui/boarding/onboarding_page.dart';
import 'package:intl/intl.dart';
import 'package:voxpollui/class/custom/custom_date_selector.dart';
import 'package:voxpollui/class/model/national/get_color.dart';

class BoardinDort extends StatefulWidget {
  const BoardinDort({Key? key}) : super(key: key);

  @override
  State<BoardinDort> createState() => _StateBoardinDort();
}

class _StateBoardinDort extends State<BoardinDort> {
  int currentStep = 0; // Mevcut adımı takip etmek için
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _birthDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  //final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _biographyController = TextEditingController();
  List<String> selectedInterests = [];
  List<String> interestsList = [];
  String _gender = 'Cinsiyet';
  List<String> ilList = [];
  List<String> ilIdList = [];
  List<String> ilceList = [];
  String? _ilce;

  String _selectedIlId = "";
  String _selectedIl = "İzmir";

  List<String> interests = [];

  List<bool> isSelected = List.generate(18, (_) => false);
  int selectedStep = 0;

  @override
  void initState() {
    super.initState();
    _fetchInterests();
    _fetchIl();
  }

  Future<void> _fetchInterests() async {
    final ParseResponse response = await ParseObject('Interest').getAll();
    if (response.success && response.results != null) {
      setState(() {
        // List<dynamic> türündeki değeri List<String> türüne dönüştürme
        interestsList = response.results!
            .map((e) => e.get<String>('name') as String)
            .toList();

        // İlgi alanları listesini ilgi alanları seçimi için kullanılan
        // isSelected listesi ile eşleştir
        interests = List<String>.from(interestsList);
        isSelected = List.generate(interests.length, (_) => false);
      });
    } else {
      // Hata durumunda işlem@
    }
  }

  Future<void> _fetchIl() async {
    try {
      final ParseCloudFunction function = ParseCloudFunction('getIl');
      final ParseResponse result = await function.execute();

      if (result.success && result.result != null) {
        final responseData = result.result as List<dynamic>;
        setState(() {
          ilList = responseData
              .map<String>((item) => item['il_adi'] as String)
              .toList();
          ilIdList = responseData
              .map<String>((item) => item['il_id'] as String)
              .toList();
          // Varsayılan olarak ilk ili seçili yap
          if (ilList.isNotEmpty) {
            _selectedIl = ilList[0];
            _selectedIlId = ilIdList[0];
            _fetchIlce(); // İlk ili seçtiğinde ilçeleri çek
          }
        });
      } else {
        throw Exception('Sunucu tarafında bir hata oluştu.');
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }

  Future<void> _fetchIlce() async {
    try {
      final ParseCloudFunction function = ParseCloudFunction('getIlce');
      final Map<String, dynamic> params = <String, dynamic>{
        'ilId': _selectedIlId
      }; // ID kullan
      final ParseResponse result = await function.execute(parameters: params);

      if (result.success && result.result != null) {
        final responseData = result.result as List<dynamic>;
        setState(() {
          ilceList = responseData
              .map<String>((item) => item['ilce_adi'] as String)
              .toList();
        });
      } else {
        throw Exception('Sunucu tarafında bir hata oluştu.');
      }
    } catch (e) {
      throw Exception('Bir hata oluştu: $e');
    }
  }

  Future<void> _registerUser() async {
    final username = _usernameController.text.trim();
    final email = _mailController.text.trim();
    String password = '123';

    // Kişisel bilgileri ve ilgi alanlarını al
    final name = _nameController.text.trim();
    final surname = _surnameController.text.trim();

    // Kişisel bilgileri al
    final birthDate = _birthDateController.text.trim();
    final city = _selectedIl.trim();
    final district = _selectedIl.trim();
    final biography = _biographyController.text.trim();

    if (username.isEmpty ||
        email.isEmpty ||
        name.isEmpty ||
        surname.isEmpty ||
        birthDate.isEmpty ||
        city.isEmpty ||
        district.isEmpty) {
      _showErrorDialog('h' 'Bir hata oluştu');
      return;
    }

    final user = ParseUser.createUser(username, password, email)
      ..set('name', name)
      ..set('surname', surname)
      ..set('birthDate', birthDate)
      ..set('city', city)
      ..set('district', district)
      ..set('gender', _gender)
      ..set('interests', selectedInterests) // İlgi alanlarını kullanıcıya ekle
      ..set('biography', biography);

    var response = await user.signUp();
//@
    if (response.success) {
      // Kayıt başarılı, oturum aç ve Ana Sayfaya yönlendir
      await ParseUser(username, password, email).login();
      // ignore: use_build_context_synchronously
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const OnboardingPage()),
      );
    } else {
      _showErrorDialog(response.error?.message ?? 'Bir hata oluştu');
    }
  } //@

  void _goToNextStep() {
    setState(() {
      currentStep++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              // Klavye açıkken tıklanırsa klavyeyi kapat@
              FocusScope.of(context).unfocus();
            },
            child: currentStep == 0
                ? Stack(children: [
                    SingleChildScrollView(
                        child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 30,
                          ), //@
                          const Text(
                            'Kişisel Bilgiler',
                            style: TextStyle(
                              color: Color(0xFF0C0C0C),
                              fontSize: 40,
                              fontFamily: 'Gilroy-medium',
                              height: 0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '*Bazı bilgiler sonradan değiştirilemez. \n Doğru girdiğinizden emin olun.',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Gilroy-medium",
                              fontWeight: FontWeight.w100,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'İsim',
                              border: const UnderlineInputBorder(),
                              hoverColor: AppColor.nationalColor,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.nationalColor)),
                            ),
                            cursorColor: AppColor.nationalColor,
                          ),
                          TextField(
                            controller: _surnameController,
                            decoration: InputDecoration(
                              labelText: 'Soyisim',
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.nationalColor)),
                            ),
                            cursorColor: AppColor.nationalColor,
                          ),
                          TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Kullanıcı Adı',
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.nationalColor)),
                            ),
                            cursorColor: AppColor.nationalColor,
                          ),
                          TextField(
                            controller: _mailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'E-Mail',
                              border: const UnderlineInputBorder(),
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColor.nationalColor)),
                            ),
                            cursorColor: AppColor.nationalColor,
                          ),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: BirthDateSelector(
                              onDateSelected: (selectedDate) {
                                if (selectedDate != null) {
                                  print(
                                      "Seçilen Tarih: ${selectedDate.toLocal()}");
                                }
                              },
                              birthDateController: _birthDateController,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Alt sınırın rengi
                                  width: 2.0, // Alt sınırın kalınlığı
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedIl,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedIl = newValue!;
                                    _selectedIlId = ilIdList[ilList.indexOf(
                                        _selectedIl)]; // ID'yi güncelle
                                    _fetchIlce(); // İl seçildiğinde ilçeleri çek
                                  });
                                },
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black), // İkonun rengi
                                dropdownColor: Colors
                                    .white, // Dropdown menüsünün arka plan rengi
                                style: const TextStyle(
                                  color: Colors.black, // Yazı rengi
                                  fontSize: 18, // Yazı boyutu
                                ),
                                items: ilList.isEmpty
                                    ? []
                                    : ilList.map<DropdownMenuItem<String>>(
                                        (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: value == 'bos'
                                                  ? Colors.grey
                                                  : Colors
                                                      .black, // Placeholder ve diğer seçeneklerin renkleri
                                            ),
                                          ),
                                        );
                                      }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Alt sınırın rengi
                                  width: 2.0, // Alt sınırın kalınlığı
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _ilce,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _ilce = newValue!;
                                  });
                                },
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black), // İkonun rengi
                                dropdownColor: Colors
                                    .white, // Dropdown menüsünün arka plan rengi
                                style: const TextStyle(
                                  color: Colors.black, // Yazı rengi
                                  fontSize: 18, // Yazı boyutu
                                ),
                                items: ilceList.isEmpty
                                    ? []
                                    : ilceList.map<DropdownMenuItem<String>>(
                                        (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              color: Colors
                                                  .black, // İlçelerin renkleri
                                            ),
                                          ),
                                        );
                                      }).toList(),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black, // Alt sınırın rengi
                                  width: 2.0, // Alt sınırın kalınlığı
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _gender,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _gender = newValue!;
                                  });
                                },
                                icon: Icon(Icons.arrow_drop_down,
                                    color: Colors.black), // İkonun rengi
                                dropdownColor: Colors
                                    .white, // Dropdown menüsünün arka plan rengi
                                style: TextStyle(
                                  color: Colors.black, // Yazı rengi
                                  fontSize: 18, // Yazı boyutu
                                ),
                                items: <String>[
                                  'Cinsiyet',
                                  'Erkek',
                                  'Kadın'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: value == 'Cinsiyet'
                                            ? Colors.grey
                                            : Colors
                                                .black, // Placeholder ve diğer seçeneklerin renkleri
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: _goToNextStep,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              width: double.infinity,
                              height: 49,
                              margin: const EdgeInsets.all(
                                  31), // Burası ekranın kenar boşluklarını ayarlar
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
                    )),
                  ])
                : Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'İlgi Alanları',
                            style: TextStyle(
                              color: Color(0xFF0C0C0C),
                              fontSize: 40,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '5 adet seçebilir ve profilinizden güncelleyebilirsiniz.',
                            style: TextStyle(
                              color: Color(0xFF0C0C0C),
                              fontSize: 13,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  if (selectedStep < 5) {
                                    isSelected[index] = !isSelected[index];
                                    selectedStep++;
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Dikkat'),
                                          content: Text(
                                              '5 adetten fazla ilgi alanı seçemezsiniz'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                // Onay işlemini gerçekleştir
                                                Navigator.of(context)
                                                    .pop(); // Diyalogu kapat
                                              },
                                              child: Text('Onayla'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isSelected[index]
                                      ? const Color(0xFF2355FF)
                                      : Colors.white,
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  interests[index],
                                  style: TextStyle(
                                      color: isSelected[index]
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: _registerUser,
                        //onTap: _registerUser,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: double.infinity,
                          height: 49,
                          margin: const EdgeInsets.all(
                              31), // Burası ekranın kenar boşluklarını ayarlar
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
        }));
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kayıt Başarısız'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
