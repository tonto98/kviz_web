import 'dart:ui';

import 'package:abadus/abadus.dart';
import 'package:example/100_login/password_reset_bloc/bloc/passwordreset_bloc.dart';
import 'package:flutter/material.dart';

class PasswordResetDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // _resetBloc = BlocProvider.of<PasswordResetBloc>(context);
    return AlertDialog(
      actionsPadding: EdgeInsets.only(right: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Center(
          child: Text(
        'ZABORAVLJENA LOZINKA',
        style: TextStyle(
            fontFamily: 'Poppins-Bold', color: Color.fromRGBO(133, 49, 53, 1)),
      )),
      content: ForgotPasswordForm(),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key key}) : super(key: key);

  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState
    extends ApiPostFormWidgetState<ForgotPasswordForm, bool, FormState> {
  PasswordResetBloc _passwordResetBloc = PasswordResetBloc();

  @override
  ApiRequestBloc get requestBloc => _passwordResetBloc;

  @override
  void dispose() {
    _passwordResetBloc.close();
    super.dispose();
  }

  void _saveFunction(GlobalKey<dynamic> formKey) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      _passwordResetBloc.add(RequestDataEvent<String>(_email));
    }
  }

  @override
  GlobalKey<FormState> get globalKey => GlobalKey<FormState>();

  @override
  bool validate(GlobalKey<FormState> formKey) =>
      formKey.currentState.validate();

  String _email;

  @override
  Widget buildForm(BuildContext context, ApiRequestBloc bloc, GlobalKey formKey,
      Function(String apiFieldName) apiValidator) {
    if (bloc.state is SuccessState) {
      return Wrap(
        children: <Widget>[
          Center(
              child: Column(
            children: <Widget>[
              Icon(
                Icons.done,
                size: 35,
                color: Color.fromRGBO(133, 49, 53, 1),
              ),
              SizedBox(height: 10),
              Text(
                "Zahtjev je uspješno poslan!",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )),
        ],
      );
    }
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      //readOnly: false,
      child: Wrap(
        children: <Widget>[
          Container(
            width: 300,
            child: Column(
              children: <Widget>[
                TextFormField(
                  onSaved: (value) => _email = value,
                  //attribute: "email",
                  maxLines: 1,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  validator: (value) {
                    if (value == 'ananas') {
                      return 'Ne smije biti ananas';
                    }
                    return apiValidator('email');
                  },
                  // validators: [
                  //   FormBuilderValidators.email(
                  //       errorText: "Ovo nije ispravna e-mail adresa"),
                  //   FormBuilderValidators.required(
                  //       errorText: "Ovo polje je obavezno"),
                  //   apiValidator('email'),
                  // ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Na unešenu e-mail adresu korisničkog računa dostaviti ćemo ti detaljnije upute za oporavak lozinke.",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: bloc.state is LoadingState
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            child: Text('Posalji'),
                            onPressed: () {
                              _saveFunction(formKey);
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
