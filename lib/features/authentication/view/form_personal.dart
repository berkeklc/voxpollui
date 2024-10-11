import 'dart:convert';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voxpollui/features/authentication/widgets/personal_fields.dart';
import 'package:voxpollui/features/sub_features/common_widgets/extended_elevated_button.dart';
import 'package:voxpollui/product/initialize/enums/gender_enum.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/initialize/models/owner_model/user_model.dart';
import 'package:voxpollui/product/initialize/models/register/province_model.dart';
import 'package:voxpollui/product/utils/constants/color_constants.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
import 'package:voxpollui/product/utils/constants/page_paddings.dart';
import 'package:voxpollui/product/utils/constants/widget_sizes.dart';
import 'package:voxpollui/product/utils/extensions/context_ext.dart';

class FormPersonal extends StatefulWidget {
  const FormPersonal({
    required this.onNext,
    required this.initialUser,
    super.key,
  });
  final ValueChanged<UserModel> onNext;
  final UserModel initialUser;

  @override
  State<FormPersonal> createState() => _FormPersonalState();
}

class _FormPersonalState extends State<FormPersonal> {
  final isLoadingNotifier = ValueNotifier<bool>(false);
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  Gender? selectedGender;
  DateTime? dateOfBirth;
  ProvinceModel? selectedProvince;
  DistrictModel? selectedDistrict;
  List<ProvinceModel> provinces = [];
  List<DistrictModel> districts = [];

  @override
  void initState() {
    super.initState();
    getProvinces();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePaddings.allS,
      child: ValueListenableBuilder(
        valueListenable: isLoadingNotifier,
        builder: (_, isLoading, __) {
          if (isLoading) return const SizedBox.shrink();
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: WidgetSizes.x4L),
                Text(
                  LocaleKeys.auth_personalForm_personalInfo.tr(),
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: FontConstants.gilroyBold,
                  ),
                ),
                Text(LocaleKeys.auth_personalForm_subtitle.tr()),
                Text(LocaleKeys.auth_personalForm_subtitle2.tr()),
                RegisterTextField(
                  label: LocaleKeys.auth_name,
                  controller: nameController,
                ),
                RegisterTextField(
                  label: LocaleKeys.auth_surname,
                  controller: surnameController,
                ),
                RegisterTextField(
                  label: LocaleKeys.auth_userName,
                  controller: userNameController,
                ),
                RegisterTextField(
                  label: LocaleKeys.auth_email,
                  controller: emailController,
                ),
                DateField((date) => dateOfBirth = date),
                CustomDropdown<ProvinceModel>.search(
                  onChanged: (value) {
                    if (value == null) return;
                    selectedProvince = value;
                    selectedDistrict = null;
                    setState(() => districts = value.districts);
                  },
                  items: provinces,
                  initialItem: selectedProvince,
                  listItemPadding: EdgeInsets.zero,
                  itemsListPadding: EdgeInsets.zero,
                  expandedHeaderPadding: EdgeInsets.zero,
                  closedHeaderPadding: EdgeInsets.zero,
                  hintText: LocaleKeys.auth_province.tr(),
                  searchHintText: LocaleKeys.base_search.tr(),
                  canCloseOutsideBounds: false,
                  noResultFoundText:
                      LocaleKeys.auth_personalForm_provinceNotFound.tr(),
                  hintBuilder: (_, text, __) {
                    return Container(
                      margin: PagePaddings.allS,
                      padding: PagePaddings.verS,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontFamily: FontConstants.gilroyMedium,
                        ),
                      ),
                    );
                  },
                  headerBuilder: (_, item, __) {
                    return Container(
                      margin: PagePaddings.allS,
                      padding: PagePaddings.verS,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      child: Text(
                        item.name,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontFamily: FontConstants.gilroyMedium,
                        ),
                      ),
                    );
                  },
                  listItemBuilder: (_, item, __, ___) {
                    return ListTile(title: Text(item.name));
                  },
                ),
                CustomDropdown<DistrictModel>.search(
                  onChanged: (value) {
                    if (value == null) return;
                    selectedDistrict = value;
                  },
                  items: districts,
                  initialItem: selectedDistrict,
                  listItemPadding: EdgeInsets.zero,
                  itemsListPadding: EdgeInsets.zero,
                  expandedHeaderPadding: EdgeInsets.zero,
                  closedHeaderPadding: EdgeInsets.zero,
                  hintText: LocaleKeys.auth_district.tr(),
                  searchHintText: LocaleKeys.base_search.tr(),
                  noResultFoundText:
                      LocaleKeys.auth_personalForm_districtNotFound.tr(),
                  hintBuilder: (_, text, __) {
                    return Container(
                      margin: PagePaddings.allS,
                      padding: PagePaddings.verS,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontFamily: FontConstants.gilroyMedium,
                        ),
                      ),
                    );
                  },
                  headerBuilder: (_, item, __) {
                    return Container(
                      margin: PagePaddings.allS,
                      padding: PagePaddings.verS,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      child: Text(
                        item.districtName,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontFamily: FontConstants.gilroyMedium,
                        ),
                      ),
                    );
                  },
                  listItemBuilder: (_, item, __, ___) {
                    return ListTile(title: Text(item.districtName));
                  },
                ),
                CustomDropdown<Gender>.search(
                  onChanged: (value) {
                    if (value == null) return;
                    selectedGender = value;
                  },
                  items: const [Gender.male, Gender.female],
                  listItemPadding: EdgeInsets.zero,
                  itemsListPadding: EdgeInsets.zero,
                  expandedHeaderPadding: EdgeInsets.zero,
                  closedHeaderPadding: EdgeInsets.zero,
                  hintText: LocaleKeys.auth_gender.tr(),
                  searchHintText: LocaleKeys.base_search.tr(),
                  noResultFoundText:
                      LocaleKeys.auth_personalForm_districtNotFound.tr(),
                  hintBuilder: (_, text, __) {
                    return Container(
                      margin: PagePaddings.allS,
                      padding: PagePaddings.verS,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontFamily: FontConstants.gilroyMedium,
                        ),
                      ),
                    );
                  },
                  headerBuilder: (_, item, __) {
                    return Container(
                      margin: PagePaddings.allS,
                      padding: PagePaddings.verS,
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide()),
                      ),
                      child: Text(
                        item.toText,
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontFamily: FontConstants.gilroyMedium,
                        ),
                      ),
                    );
                  },
                  listItemBuilder: (_, item, __, ___) {
                    return ListTile(title: Text(item.toText));
                  },
                ),
                ExtendedElevatedButton(
                  onPressed: next,
                  text: LocaleKeys.base_next.tr(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void next() {
    if (nameController.text.isEmpty ||
        surnameController.text.isEmpty ||
        userNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        dateOfBirth == null ||
        selectedProvince == null ||
        selectedDistrict == null ||
        selectedGender == null) {
      context.showSnackBar(LocaleKeys.base_pleaseFill.tr());
      return;
    }
    final user = widget.initialUser.copyWith(
      name: nameController.text,
      surname: surnameController.text,
      userName: userNameController.text,
      email: emailController.text,
      province: selectedProvince?.value,
      district: selectedDistrict?.value,
      gender: selectedGender?.index,
      dateOfBirth: dateOfBirth,
    );
    widget.onNext(user);
  }

  Future<void> getProvinces() async {
    isLoadingNotifier.value = true;
    final jsonString = await rootBundle.loadString('assets/data/il_ilce.json');
    final jsonResponse = json.decode(jsonString) as List;
    provinces = jsonResponse
        .map<ProvinceModel>(
          (e) => ProvinceModel.fromMap(e as Map<String, dynamic>),
        )
        .toList();
    isLoadingNotifier.value = false;
  }
}
