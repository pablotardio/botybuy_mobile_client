import 'package:botybuy/providers/usuario_provider.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:botybuy/utils/theme.dart';
import 'package:botybuy/widgets/snackbar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePhone = FocusNode();
  final FocusNode focusNodeBirthDate = FocusNode();
  final FocusNode focusNodeName = FocusNode();
  DateTime _selectedDate;
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();
  TextEditingController signupBirthDate = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();
  final _usuarioProvider = new UsuarioProvider();
  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.purple[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 360.0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: focusNodeName,
                            controller: signupNameController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            autocorrect: false,
                            style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.user,
                                color: Colors.black,
                              ),
                              hintText: 'Nombre',
                              hintStyle: TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0),
                            ),
                            onSubmitted: (_) {
                              focusNodeEmail.requestFocus();
                            },
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: focusNodeBirthDate,
                            controller: signupBirthDate,
                            keyboardType: TextInputType.datetime,
                            autocorrect: false,
                            style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.calendar,
                                color: Colors.black,
                              ),
                              hintText: 'Fecha De Nacimiento',
                              hintStyle: TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0),
                            ),
                            onSubmitted: (_) {
                              focusNodeBirthDate.requestFocus();
                            },
                            onTap: () {
                              _selectDate(context);
                            },
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: focusNodePhone,
                            controller: signupPhoneController,
                            keyboardType: TextInputType.phone,
                            autocorrect: false,
                            style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.phone,
                                color: Colors.black,
                              ),
                              hintText: 'Celular',
                              hintStyle: TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0),
                            ),
                            onSubmitted: (_) {
                              focusNodePhone.requestFocus();
                            },
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: focusNodeEmail,
                            controller: signupEmailController,
                            keyboardType: TextInputType.emailAddress,
                            autocorrect: false,
                            style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                FontAwesomeIcons.envelope,
                                color: Colors.black,
                              ),
                              hintText: 'Correo electronico',
                              hintStyle: TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0),
                            ),
                            onSubmitted: (_) {
                              focusNodePassword.requestFocus();
                            },
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: focusNodePassword,
                            controller: signupPasswordController,
                            obscureText: _obscureTextPassword,
                            autocorrect: false,
                            style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black,
                              ),
                              hintText: 'Contraseña',
                              hintStyle: const TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSignup,
                                child: Icon(
                                  _obscureTextPassword
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onSubmitted: (_) {
                              focusNodeConfirmPassword.requestFocus();
                            },
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: focusNodeConfirmPassword,
                            controller: signupConfirmPasswordController,
                            obscureText: _obscureTextConfirmPassword,
                            autocorrect: false,
                            style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.black,
                              ),
                              hintText: 'Confirmacion',
                              hintStyle: const TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 16.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleSignupConfirm,
                                child: Icon(
                                  _obscureTextConfirmPassword
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onSubmitted: (_) {
                              _toggleSignUpButton();
                            },
                            textInputAction: TextInputAction.go,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 340.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: CustomTheme.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: CustomTheme.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: <Color>[
                        CustomTheme.loginGradientEnd1,
                        CustomTheme.loginGradientStart1
                      ],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  // splashColor: CustomTheme.loginGradientEnd1,
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      'REGISTRARSE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: 'WorkSansBold'),
                    ),
                  ),
                  onPressed: () => _toggleSignUpButton(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _toggleSignUpButton() async {
    final res = await _usuarioProvider.register(
        email: signupEmailController.text,
        password: signupPasswordController.text,
        nombre: signupNameController.text,
        celular: signupPhoneController.text,
        fechaNac: signupBirthDate.text);
    if (res['ok']) {
      Navigator.pushNamed(context, 'home');
      CustomSnackBar(context,
          const Text('Usuario registrado exitosamente, Bienvenido a Botybuy'));
    } else {
      CustomSnackBar(context, Text(res['data']['msg']),
          backgroundColor: Colors.red);
    }
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextConfirmPassword = !_obscureTextConfirmPassword;
    });
  }
    _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2040),
       );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      signupBirthDate
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: signupBirthDate.text.length,
            affinity: TextAffinity.upstream));
    }
  }



}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}