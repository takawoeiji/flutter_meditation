import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, {super.key});

  final void Function(
    String email,
    String userName,
    String password,
    // File image,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();

    if (isValid != null || isValid == true) {
      _formKey.currentState?.save();
      widget.submitFn(_userEmail, _userName, _userPassword, _isLogin, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (_isLogin)
            ? Text(AppLocalizations.of(context)!.login)
            : Text(AppLocalizations.of(context)!.sign_up),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      // Email Addreee
                      key: const ValueKey('useremail'),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(context)!.email_address),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return AppLocalizations.of(context)!.msgEmailError;
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _userEmail = value!;
                      },
                    ),
                    if (!_isLogin) // User name
                      TextFormField(
                        key: const ValueKey('username'),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return AppLocalizations.of(context)!.msgNameError;
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.user_name),
                        onSaved: (value) {
                          _userName = value!;
                        },
                      ),
                    TextFormField(
                      // Password
                      key: const ValueKey('userpassword'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 7) {
                          return AppLocalizations.of(context)!.msgPswdError;
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.password),
                      onSaved: (value) {
                        _userPassword = value!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: _trySubmit,
                      child: Text(_isLogin
                          ? AppLocalizations.of(context)!.login
                          : AppLocalizations.of(context)!.sign_up),
                    ),
                    TextButton(
                      child: Text(_isLogin
                          ? AppLocalizations.of(context)!.create_new_account
                          : AppLocalizations.of(context)!.have_accouont),
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
