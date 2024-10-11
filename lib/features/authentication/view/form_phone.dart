import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:voxpollui/features/authentication/widgets/auth_check_box_tile.dart';
import 'package:voxpollui/features/authentication/widgets/next_button.dart';
import 'package:voxpollui/features/authentication/widgets/phone_text_field.dart';
import 'package:voxpollui/features/sub_features/documents/data/document_model.dart';
import 'package:voxpollui/features/sub_features/documents/data/documents.dart';
import 'package:voxpollui/product/initialize/localization/locale_keys.g.dart';
import 'package:voxpollui/product/initialize/router/route_tree.dart';
import 'package:voxpollui/product/utils/constants/font_constants.dart';
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
      child: SingleChildScrollView(
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
              text: const _ContractText(),
              onChanged: onContract,
              initValue: confirmContract,
            ),
            AuthCheckBoxTile(
              text: const _ContactText(),
              onChanged: onContact,
              initValue: confirmContact,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: _ApproveText(),
                  ),
                  NextButton(onTap: onPhoneVerify),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _ContractText extends StatelessWidget {
  const _ContractText();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: LocaleKeys.auth_phoneForm_illuminationText.tr(),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            DocumentReaderRoute(
              DocumentModel(
                path: Documents.illumination,
                title: LocaleKeys.auth_phoneForm_illuminationText.tr(),
              ),
            ).push<void>(context);
          },
        style: TextStyle(fontFamily: FontConstants.gilroyBold, fontSize: 13),
        children: [
          TextSpan(
            text: LocaleKeys.auth_phoneForm_iRead.tr(),
            style: TextStyle(fontFamily: FontConstants.gilroyLight),
          ),
          TextSpan(
            text: LocaleKeys.auth_phoneForm_openConsentText.tr(),
            style: TextStyle(fontFamily: FontConstants.gilroyBold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                DocumentReaderRoute(
                  DocumentModel(
                    path: Documents.illumination,
                    title: LocaleKeys.auth_phoneForm_openConsentText.tr(),
                  ),
                ).push<void>(context);
              },
          ),
          TextSpan(
            text: LocaleKeys.auth_phoneForm_iApprove.tr(),
            style: TextStyle(fontFamily: FontConstants.gilroyLight),
          ),
        ],
      ),
    );
  }
}

final class _ContactText extends StatelessWidget {
  const _ContactText();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: LocaleKeys.auth_phoneForm_openConsentText.tr(),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            DocumentReaderRoute(
              DocumentModel(
                path: Documents.illumination,
                title: LocaleKeys.auth_phoneForm_openConsentText.tr(),
              ),
            ).push<void>(context);
          },
        style: TextStyle(fontFamily: FontConstants.gilroyBold, fontSize: 13),
        children: [
          TextSpan(
            text: LocaleKeys.auth_phoneForm_and.tr(),
            style: TextStyle(fontFamily: FontConstants.gilroyLight),
          ),
          TextSpan(
            text: LocaleKeys.auth_phoneForm_commercialText.tr(),
            style: TextStyle(fontFamily: FontConstants.gilroyBold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                DocumentReaderRoute(
                  DocumentModel(
                    path: Documents.illumination,
                    title: LocaleKeys.auth_phoneForm_commercialText.tr(),
                  ),
                ).push<void>(context);
              },
          ),
          TextSpan(
            text: LocaleKeys.auth_phoneForm_iApprove2.tr(),
            style: TextStyle(fontFamily: FontConstants.gilroyLight),
          ),
        ],
      ),
    );
  }
}

final class _ApproveText extends StatelessWidget {
  const _ApproveText();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: LocaleKeys.auth_phoneForm_onContinue.tr(),
        style: TextStyle(fontFamily: FontConstants.gilroyLight, fontSize: 13),
        children: [
          TextSpan(
            text: LocaleKeys.auth_phoneForm_userAgreement.tr(),
            style: TextStyle(fontFamily: FontConstants.gilroyBold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                DocumentReaderRoute(
                  DocumentModel(
                    path: Documents.illumination,
                    title: LocaleKeys.auth_phoneForm_userAgreement.tr(),
                  ),
                ).push<void>(context);
              },
          ),
          TextSpan(
            text: LocaleKeys.auth_phoneForm_iApprove3.tr(),
            style: TextStyle(fontFamily: FontConstants.gilroyLight),
          ),
        ],
      ),
    );
  }
}
