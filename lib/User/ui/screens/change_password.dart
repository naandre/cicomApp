import 'package:cicom/Auth/ui/screens/register.dart';
import 'package:cicom/Auth/ui/screens/reset_password.dart';
import 'package:cicom/widgets/gradient_back.dart';
import 'package:cicom/User/ui/widgets/profile_appbar.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ChangePassword();
  }
}

class _changePasswordData{
  String password='';
  String passwordNew='';
  String repeatPassword='';
}

class _ChangePassword extends State<ChangePassword>{
  final GlobalKey<FormState> _fromKey= GlobalKey<FormState>();
  _changePasswordData _data=_changePasswordData();


  String _validatePassword(String value){
    if(value.isEmpty){
      return 'La contraseña no puede estar vacía';
    }
  }

  submit(){
    if(this._fromKey.currentState.validate()){
      this._fromKey.currentState.save();

      print('Printing the login data.');
      print('Password: ${_data.password}');

      changeView(ProfileAppBar());
//      Route route = MaterialPageRoute(builder: (context) => ProfileAppBar());
//      Navigator.of(context).push(route);
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
        GradientBack("Cambiar contraseña",100),
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
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Contraseña',
                        labelText: 'Ingrese contraseña'
                    ),
                    validator: this._validatePassword,
                    onSaved: (String value){
                      this._data.password=value;
                    },
                  ),TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Contraseña',
                        labelText: 'Ingrese nueva contraseña'
                    ),
                    validator: this._validatePassword,
                    onSaved: (String value){
                      this._data.passwordNew=value;
                    },
                  ),TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Contraseña',
                        labelText: 'Repite la nueva contraseña'
                    ),
                    validator: this._validatePassword,
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
                          'Cambiar',
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
                      changeView(ResetPassword());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30.0, left: 20, right: 20.0),
                      height: 40.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Colors.white,
                              ],
                              begin: FractionalOffset(0.2, 0.0),
                              end: FractionalOffset(1.0, 0.6),
                              stops: [0.0, 0.8],
                              tileMode: TileMode.clamp)),
                      child: Center(
                        child: Text(
                          "¿Recordar contraseña?",
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "Roboto",
                              color: Colors.black
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      changeView(Register());
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
                          "Registrarme",
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