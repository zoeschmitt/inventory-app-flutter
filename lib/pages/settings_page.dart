import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/pages/modals/privacy_policy_modal.dart';
import 'package:inventory/services/firebase_auth_service.dart';
import 'package:inventory/widgets/buttons/custom_button.dart';
import 'package:inventory/widgets/settings_option.dart';

import 'modals/account_modal.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            25.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CustomButton(icon: SFSymbols.chevron_left),
                      ),
                    ]),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Settings',
                      maxLines: 2,
                      style: GoogleFonts.libreFranklin(
                          fontSize: 35,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                GestureDetector(
                    onTap: () => _accountModal(context),
                    child: SettingsOption(
                      title: 'Account',
                      icon: SFSymbols.person_fill,
                    )),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () => _policyModal(context),
                    child: SettingsOption(
                      title: 'Privacy',
                      icon: SFSymbols.shield_fill,
                    )),
                SizedBox(height: 20),
                GestureDetector(
                    onTap: () async {
                      Navigator.of(context).pop();
                      await _auth.signOut();
                    },
                    child: SettingsOption(
                      title: 'Logout',
                      icon: SFSymbols.arrow_left_circle_fill,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _accountModal(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.93,
        child: AccountModal(),
      ),
    );
  }

  _policyModal(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) => PrivacyPolicyModal(),
    );
  }
}

