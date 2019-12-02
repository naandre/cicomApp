import 'package:cicom/widgets/gradient_back.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ResetPassword();
  }

}

class _ResetData{
  String email='';
}

class _ResetPassword extends State <ResetPassword>{
  final GlobalKey<FormState> _fromKey= GlobalKey<FormState>();
  _ResetData _data=_ResetData();

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

  submit(){
    if(this._fromKey.currentState.validate()){
      this._fromKey.currentState.save();

      print('Printing the reset data.');
      print('Email: ${_data.email}');

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack("Recuperar Contraseña",100),
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'mail@mail.com',
                        labelText: 'Correo electrónico'
                    ),
                    validator: _validateEmail,
                    onSaved: (String value){
                      this._data.email=value;
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
                          'Recuperar Contraseña',
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
                    Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30.0, left: 20, right: 20.0),
                      height: 40.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF0288D1),
                                Color(0xFF01579B),
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
                              color: Colors.white
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