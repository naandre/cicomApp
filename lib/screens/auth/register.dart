import 'package:cicom/screens/auth/login.dart';
import 'package:cicom/screens/gradient_back.dart';
import 'package:cicom/screens/user/profile_appbar.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _registerData{
  String name='';
  String lastname='';
  String email='';
  String password='';
  String repeatPassword='';
}

class _Register extends State<Register>{
  final GlobalKey<FormState> _fromKey= GlobalKey<FormState>();
  _registerData _data=_registerData();

  String _validateName(String value){
    if(value.isEmpty){
      return 'El Nombre no puede estar vació';
    }
  }

  String _validateLastName(String value){
    if(value.isEmpty){
      return 'El Apellido no puede estar vació';
    }
  }

  String _validateEmail(String value){
    if(value.isEmpty){
      return 'El correo electrónico no puede estar vació';
    }
    RegExp regExp=RegExp("[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+");

    if(!regExp.hasMatch(value)){
      return "El correo electrónico ingresado no es válido";
    }
  }

  String _validatePassword(String value){
    if(value.isEmpty){
      return 'La contraseña no puede estar vacía';
    }
  }

  String _validateRepeatPassword(String value){
    if(value.isEmpty){
      return 'la confirmación de la no puede estar vacía';
    }
    if(value!=_data.password){
      return 'Las contraseñas no son iguales';
    }
  }

  submit(){
    if(this._fromKey.currentState.validate()){
      this._fromKey.currentState.save();

      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');

      changeView(ProfileAppBar());
    }
  }

  changeView(view){
    Route route = MaterialPageRoute(builder: (context) => view);
    Navigator.of(context).push(route);
  }


  @override
  Widget build(BuildContext context) {
    final Size creenSize=MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        GradientBack("Registro",100),
        Container(
          margin: EdgeInsets.only(
              top: 120,
              left:20,
              right: 20
          ),
          child: Form(
              key: this._fromKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'tus nombres',
                        labelText: 'Nombre'
                    ),
                    validator: this._validateName,
                    onSaved: (String value){
                      this._data.name=value;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'tus apellidos',
                        labelText: 'Apellido'
                    ),
                    validator: this._validateLastName,
                    onSaved: (String value){
                      this._data.lastname=value;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'mail@mail.com',
                        labelText: 'Correo electrónico'
                    ),
                    validator: this._validateEmail,
                    onSaved: (String value){
                      this._data.email=value;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Contraseña',
                        labelText: 'Ingrese contraseña'
                    ),
                    validator: this._validatePassword,
                    onSaved: (String value){
                      this._data.password=value;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Contraseña',
                        labelText: 'Repite la contraseña'
                    ),
                    validator: this._validateRepeatPassword,
                    onSaved: (String value){
                      this._data.repeatPassword=value;
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0, left: 20, right: 20.0),
                    height: 50.0,
                    width: 180.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF0288D1),
                              Color(0xFF01579B),
                            ],
                            begin: FractionalOffset(0.2, 0.0),
                            end: FractionalOffset(1.0, 0.6),
                            stops: [0.0, 0.6],
                            tileMode: TileMode.clamp)),
                    child: RaisedButton(
                      child: Center(
                        child: Text(
                          'Ingresar',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Roboto",
                              color: Colors.white
                          ),
                        ),
                      ),
                      onPressed: this.submit,
                      color: Colors.blue,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      changeView(Login());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30.0, left: 20, right: 20.0),
                      height: 40.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          gradient: LinearGradient(
                              colors: [
                                Colors.blueGrey,
                                Colors.blue,
                              ],
                              begin: FractionalOffset(0.2, 0.0),
                              end: FractionalOffset(1.0, 0.6),
                              stops: [0.0, 0.8],
                              tileMode: TileMode.clamp)),
                      child: Center(
                        child: Text(
                          "Cancelar",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Roboto",
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
          ),
        )
      ],
    );
  }

}