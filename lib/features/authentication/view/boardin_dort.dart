import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voxpollui/product/constants/color_constants.dart';
import 'package:voxpollui/product/constants/font_constants.dart';

class BoardinDort extends StatefulWidget {
  const BoardinDort({super.key});

  @override
  State<BoardinDort> createState() => _StateBoardinDort();
}

class _StateBoardinDort extends State<BoardinDort> {
  int currentStep = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
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

  final TextEditingController _biographyController = TextEditingController();
  List<String> selectedInterests = [];
  List<String> interestsList = [];
  String _gender = 'Cinsiyet';
  List<String> ilList = ['İl', 'izmir', 'ankara', 'istanbul'];
  List<String> ilIdList = ['1', '2', '3', '4'];
  List<String> ilceList = ['İlçe', 'konak,', 'keçiören', 'taksim'];
  String? _ilce = 'İlçe';

  final String _selectedIlId = '';
  final String _selectedIl = 'İl';

  List<String> interests = [
    'Müzik',
    'Oyun',
    'Siyaset',
    'Felsefe',
    'Spor',
    'Futbol',
    'Basketbol',
  ];

  List<bool> isSelected = List.generate(18, (_) => false);
  int selectedStep = 0;

  @override
  void initState() {
    super.initState();
  }

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
            FocusScope.of(context).unfocus();
          },
          child: currentStep == 0
              ? Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 30),
                          Text(
                            'Kişisel Bilgiler',
                            style: TextStyle(
                              color: const Color(0xFF0C0C0C),
                              fontSize: 40,
                              fontFamily: FontConstants.gilroyMedium,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '*Bazı bilgiler sonradan değiştirilemez. \n Doğru girdiğinizden emin olun.',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: FontConstants.gilroyMedium,
                              fontWeight: FontWeight.w100,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 20),
                          PollTextField.signupTextField(
                            controller: _nameController,
                            labelText: 'İsim',
                          ),
                          const SizedBox(height: 20),
                          PollTextField.signupTextField(
                            controller: _surnameController,
                            labelText: 'Soyisim',
                          ),
                          const SizedBox(height: 20),
                          PollTextField.signupTextField(
                            controller: _usernameController,
                            labelText: 'Kullanıcı Adı',
                          ),
                          const SizedBox(height: 20),
                          PollTextField.signupTextField(
                            controller: _mailController,
                            labelText: 'E-Mail',
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => _selectDate(context),
                            child: BirthDateSelector(
                              onDateSelected: (selectedDate) {
                                if (selectedDate != null) {
                                  /*
                                  print(
                                      "Seçilen Tarih: ${selectedDate.toLocal()}");
                                      */
                                }
                              },
                              birthDateController: _birthDateController,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: CustomDropdownSearch(
                              items: ilList,
                              selectedValue: _selectedIl,
                              labelText: "İl Seçiniz",
                              onChanged: (String? newValue) {
                                print("Selected City: $newValue");
                              },
                            ),

                            /*
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                iconSize: 0.0,
                                value: _selectedIl,
                                onChanged: (String? newValue) {
                                  if (newValue != "İl") {
                                    setState(() {
                                      _selectedIl = newValue!;
                                      _selectedIlId =
                                          ilIdList[ilList.indexOf(_selectedIl)];
                                      _fetchIlce();
                                    });
                                  }
                                },
                                dropdownColor: Colors.white,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                items: ilList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: value == 'İl'
                                            ? Colors.black
                                            : Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            */
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                iconSize: 0.0,
                                value: _ilce,
                                onChanged: _selectedIl != "İl"
                                    ? (String? newValue) {
                                        setState(() {
                                          _ilce = newValue!;
                                        });
                                      }
                                    : null,
                                dropdownColor: Colors.white,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                items: ilceList.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: value == 'İlçe'
                                            ? Colors.black
                                            : Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                iconSize: 0.0,
                                value: _gender,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _gender = newValue!;
                                  });
                                },
                                dropdownColor: Colors.white,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
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
                                            ? Colors.black
                                            : Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Spacer(),
                          GestureDetector(
                            onTap: _goToNextStep,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              width: double.infinity,
                              height: 49,
                              margin: const EdgeInsets.all(31),
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
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'İlgi Alanları',
                            style: TextStyle(
                              color: const Color(0xFF0C0C0C),
                              fontSize: 40,
                              fontFamily: FontConstants.gilroyMedium,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '5 adet seçebilir ve profilinizden güncelleyebilirsiniz.',
                            style: TextStyle(
                              color: const Color(0xFF0C0C0C),
                              fontSize: 13,
                              fontFamily: FontConstants.gilroyMedium,
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
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
                                  if (isSelected[index]) {
                                    isSelected[index] = false;
                                    selectedStep--;
                                  } else {
                                    if (selectedStep < 5) {
                                      isSelected[index] = true;
                                      selectedStep++;
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            elevation: 10,
                                            backgroundColor: Colors.white,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  const Text(
                                                    'Dikkat',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22.0,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    '5 adetten fazla ilgi alanı seçemezsiniz',
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.grey[700],
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Divider(
                                                    color: Colors.grey[300],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            AppColor.primary,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 16,
                                                          vertical: 10.0,
                                                        ),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10,
                                                          ),
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        'Onayla',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  }
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: isSelected[index]
                                      ? const Color(0xFF2355FF)
                                      : Colors.white,
                                  border: isSelected[index]
                                      ? null
                                      : Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  interests[index],
                                  style: TextStyle(
                                    color: isSelected[index]
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: // registerUser
                            () {},
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: double.infinity,
                          height: 49,
                          margin: const EdgeInsets.all(31),
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
                ),
        );
      }),
    );
  }
}

class PollTextField {
  static File? _selectedImage;

  static Future<void> _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _selectedImage = File(pickedImage.path);
      // Ekranı yenilemek için
      (context as Element).markNeedsBuild();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Resim seçilmedi')),
      );
    }
  }

  static Widget pollTextField({
    required TextEditingController controller,
    required BuildContext context,
    required String labelText,
  }) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () => _openGallery(context),
              child: const Icon(Icons.add_photo_alternate, color: Colors.blue),
            ),
            label: Text(labelText),
          ),
        ),
        if (_selectedImage != null) Image.file(_selectedImage!),
      ],
    );
  }

  static Widget signupTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            floatingLabelStyle: const TextStyle(color: Colors.black),
          ),
          cursorColor: AppColor.primary,
        ),
        Container(
          height: 1,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          color: Colors.black,
        ),
      ],
    );
  }
}

class BirthDateSelector extends StatefulWidget {
  BirthDateSelector({
    super.key,
    this.onDateSelected,
    this.initialDate,
    this.birthDateController,
    this.hintText = 'Doğum Tarihi',
  });
  final Function(DateTime?)? onDateSelected;
  final DateTime? initialDate;
  late TextEditingController? birthDateController;
  final String hintText;

  @override
  State<BirthDateSelector> createState() => _BirthDateSelectorState();
}

class _BirthDateSelectorState extends State<BirthDateSelector> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    widget.birthDateController = TextEditingController();
    if (widget.initialDate != null) {
      _selectedDate = widget.initialDate;
      widget.birthDateController!.text = _formatDate(_selectedDate!);
    }
  }

  @override
  void dispose() {
    widget.birthDateController!.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.primary,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        widget.birthDateController!.text = _formatDate(pickedDate);
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(pickedDate);
        }
      });
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 1.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.birthDateController!.text.isEmpty
                  ? widget.hintText
                  : widget.birthDateController!.text,
              style: TextStyle(
                color: widget.birthDateController!.text.isEmpty
                    ? Colors.black
                    : Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdownSearch extends StatefulWidget {
  const CustomDropdownSearch({
    required this.items,
    required this.onChanged,
    super.key,
    this.selectedValue,
    this.labelText = 'Select',
  });
  final List<String> items;
  final String? selectedValue;
  final String labelText;
  final Function(String?) onChanged;

  @override
  State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
}

class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
  final TextEditingController _searchController = TextEditingController();
  late OverlayEntry _overlayEntry;
  bool _isDropdownVisible = false;
  late List<String> _filteredItems;
  String? _selectedValue;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    _selectedValue = widget.selectedValue;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
    // Rebuild the dropdown to reflect the filtered list
    if (_isDropdownVisible) {
      _showDropdown();
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width - 32,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(0, 60),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredItems[index]),
                        onTap: () {
                          setState(() {
                            _selectedValue = _filteredItems[index];
                            widget.onChanged(_selectedValue);
                            _closeDropdown();
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _toggleDropdown() {
    if (_isDropdownVisible) {
      _closeDropdown();
    } else {
      _showDropdown();
    }
  }

  void _showDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)?.insert(_overlayEntry);
    setState(() {
      _isDropdownVisible = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry.remove();
    setState(() {
      _isDropdownVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedValue ?? widget.labelText,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
