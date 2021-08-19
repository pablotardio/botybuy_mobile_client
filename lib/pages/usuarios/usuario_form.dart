import 'package:botybuy/models/UsuarioModel.dart';
import 'package:botybuy/providers/usuario_provider.dart';
import 'package:botybuy/widgets/snackbar.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

class UsuarioForm extends StatefulWidget {
  UsuarioModel usuario;
  UsuarioForm({Key key, this.usuario}) : super(key: key);

  @override
  _UsuarioFormState createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {
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
  final _usuarioProvider = UsuarioProvider();
  int selectedRoldropdownValue = 1;


    @override
  void initState() {
    super.initState();
    initUserParam();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: esUpdate
            ? Text('Editar usuario ${widget.usuario.id}')
            : Text('Crear nuevo usuario'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _handleSubmitButton();
        },
        child: Icon(Icons.done),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
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
                  hintStyle:
                      TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
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
                  hintStyle:
                      TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
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
                  hintStyle:
                      TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
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
                  hintStyle:
                      TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
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
                      fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
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
                      fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
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
                  _handleSubmitButton();
                },
                textInputAction: TextInputAction.go,
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
              child: FutureBuilder(
                future: _usuarioProvider.listarRoles(),
                initialData: [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return DropdownButton(
                    value: selectedRoldropdownValue,
                    onChanged: (newValue) {
                      print('new value $newValue');

                      setState(() {
                        if (esUpdate) {
                          widget.usuario.rolId=newValue;
                          selectedRoldropdownValue = newValue;
                        } else {
                          selectedRoldropdownValue = newValue;
                        }
                      });
                    },
                    items: _listarRoles(context, snapshot.data),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initUserParam() {
    if (widget.usuario == null) {
      print('null');
      widget.usuario = UsuarioModel(
          id: -1,
          celular: '',
          correo: '',
          clave: '',
          fechaNac: DateTime.now().toString(),
          nombre: '',
          rolId: 1);
    } else {
      signupEmailController.text = widget.usuario.correo;
      signupPhoneController.text = widget.usuario.celular;
      signupBirthDate.text = widget.usuario.fechaNac;
      signupNameController.text = widget.usuario.nombre;
      signupPasswordController.text = widget.usuario.clave;
      signupConfirmPasswordController.text = widget.usuario.clave;
      selectedRoldropdownValue = widget.usuario.rolId;
      if (widget.usuario.fechaNac != null)
        this._selectedDate = DateTime.parse(widget.usuario.fechaNac);
    }
  }

  List<DropdownMenuItem<dynamic>> _listarRoles(
      BuildContext context, List<dynamic> data) {
    List<DropdownMenuItem<dynamic>> listaDeRoles = [];

    data.forEach((currentRol) {
      listaDeRoles.add(DropdownMenuItem(
          value: currentRol['id'], child: Text(currentRol['nombre'])));
    });

    return listaDeRoles;
    // SizedBox(width: getProportionateScreenWidth(20)),
  }

  void _handleSubmitButton() async {
    if (esUpdate) {
      final res = await _usuarioProvider.update(
          userToEditId: widget.usuario.id,
          email: signupEmailController.text,
          password: signupPasswordController.text,
          nombre: signupNameController.text,
          celular: signupPhoneController.text,
          rolId: selectedRoldropdownValue,
          fechaNac: signupBirthDate.text);
      if (res['ok']) {
        CustomSnackBar(context, const Text('Usuario actualizado exitosamente'));
      } else {
        CustomSnackBar(context, Text(res['data']['msg']),
            backgroundColor: Colors.red);
      }
    } else {
      final res = await _usuarioProvider.create(
          email: signupEmailController.text,
          password: signupPasswordController.text,
          nombre: signupNameController.text,
          celular: signupPhoneController.text,
          rolId: selectedRoldropdownValue,
          fechaNac: signupBirthDate.text);
      if (res['ok']) {
        CustomSnackBar(context, const Text('Usuario creado exitosamente'));
      } else {
        CustomSnackBar(context, Text(res['data']['msg']),
            backgroundColor: Colors.red);
      }
    }
  }

  bool get esUpdate => widget.usuario.id != -1;

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
