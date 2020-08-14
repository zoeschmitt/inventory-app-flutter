import 'package:flutter/material.dart';
import 'package:inventory/models/user.dart';
import 'package:inventory/services/firestore_service.dart';
import 'package:inventory/utils/loading.dart';
import 'package:inventory/widgets/buttons/edit_button.dart';
import 'package:inventory/widgets/custom_field_widget.dart';
import 'package:inventory/widgets/modal_title_widget.dart';
import 'package:provider/provider.dart';

class AccountModal extends StatefulWidget {
  const AccountModal({
    Key key,
  }) : super(key: key);

  @override
  _AccountModalState createState() => _AccountModalState();
}

class _AccountModalState extends State<AccountModal> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String name;
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: FirestoreService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Padding(
              padding:
                  const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    ModalTitleWidget(title: "Account"),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () async {
                              //_toggleEdit();
                              if (_isEditing) {
                                if (_formKey.currentState.validate()) {
                                  await FirestoreService(uid: user.uid)
                                      .updateUserData(
                                    name ?? snapshot.data.name,
                                    email ?? snapshot.data.email,
                                  );

                                  setState(() {
                                    _isEditing = false;
                                  });
                                  Navigator.of(context).pop();
                                }
                              } else {
                                setState(() {
                                  _isEditing = true;
                                });
                              }
                            },
                            child: EditButton(
                              isEditing: _isEditing,
                            ))
                      ],
                    ),
                    SizedBox(height: 20.0),
                    CustomFieldWidget(
                      textCap: TextCapitalization.words,
                      enabled: _isEditing ? true : false,
                      fieldTitle: "Name",
                      initialText: userData.name,
                      valFunc: (val) =>
                          val.isEmpty ? 'Please enter a name' : null,
                      onChanged: (val) => setState(() => name = val),
                    ),
                    SizedBox(height: 15.0),
                    CustomFieldWidget(
                      textCap: TextCapitalization.none,
                      enabled: _isEditing ? true : false,
                      fieldTitle: "Email",
                      initialText: userData.email,
                      valFunc: (val) => !val.contains('@') || val.isEmpty
                          ? 'Please enter a valid email'
                          : null,
                      onChanged: (val) => setState(() => email = val),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
