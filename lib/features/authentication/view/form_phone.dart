import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:voxpollui/features/authentication/widgets/auth_check_box_tile.dart';
import 'package:voxpollui/features/authentication/widgets/next_button.dart';
import 'package:voxpollui/features/authentication/widgets/phone_text_field.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/utils/constants/image_constants.dart';

class FormPhone extends StatelessWidget {
  const FormPhone({
    required this.phoneController,
    required this.focusNode,
    required this.onPhoneVerify,
    required this.confirmContract,
    required this.confirmContact,
    required this.onContract,
    required this.onContact,
    super.key,
  });
  final TextEditingController phoneController;
  final FocusNode focusNode;
  final VoidCallback onPhoneVerify;
  final ValueChanged<bool?> onContract;
  final ValueChanged<bool?> onContact;
  final bool confirmContract;
  final bool confirmContact;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Image.asset(ImageConstants.loginPhone),
          ),
          Text(
            LocaleKeys.auth_phoneForm_phoneNumber.tr(),
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          PhoneTextField(
            controller: phoneController,
            focusNode: focusNode,
          ),
          AuthCheckBoxTile(
            text: LocaleKeys.auth_phoneForm_contractText,
            onChanged: onContract,
            initValue: confirmContract,
          ),
          AuthCheckBoxTile(
            text: LocaleKeys.auth_phoneForm_contactText,
            onChanged: onContact,
            initValue: confirmContact,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Text(LocaleKeys.auth_phoneForm_userApproveText.tr()),
          ),
          NextButton(onTap: onPhoneVerify),
        ],
      ),
    );
  }
}
