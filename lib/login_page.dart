import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final tLogin = TextEditingController();
  final tPass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _progress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  String _validadeLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }
    return null;
  }

  String _validadePass(String text) {
    if (text.isEmpty) {
      return "Informe a Senha";
    }
    return null;
  }

  _body(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFf45d27),
                      Color(0xFFf5851f),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      'https://imediatoonline.com/wp-content/uploads/2019/02/cropped-imediatoonline.png',
                      scale: 5,
//                        color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 32,
                        right: 32,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 60,
                padding: EdgeInsets.only(
                  top: 2,
                  left: 16,
                  right: 16,
                  bottom: 2,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ]),
                child: TextFormField(
                  controller: tLogin,
                  validator: _validadeLogin,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                    hintText: 'E-mail',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 60,
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.only(
                  top: 2,
                  left: 16,
                  right: 16,
                  bottom: 2,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      )
                    ]),
                child: TextFormField(
                  controller: tPass,
                  validator: _validadePass,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.grey,
                    ),
                    hintText: 'Senha',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    right: 32,
                  ),
                  child: Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
//              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFf5851f),
                          Color(0xFFf45d27),
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      )),
                  child: FlatButton(
                    child: _progress ?
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ) : Text(
                      'Login'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _onClickLogin(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  void _onClickLogin(BuildContext contex) {
    final login = tLogin.text;
    final password = tPass.text;

    if (!_formKey.currentState.validate()) {
      return;
    }
//
//    if(login.isEmpty || password.isEmpty){
//      showDialog(context: contex,
//        builder: (context){
//          return AlertDialog(
//            title: Text("Erro"),
//            content: Text("Informe corretamente o login e senha"),
//            actions: <Widget>[
//              FlatButton(
//                  child: Text("Ok"),
//                  onPressed: (){
//                    Navigator.pop(context);
//                  },
//              )
//            ],
//          );
//        });
//    }
    print("Login: $login, Senha: $password");
  }
}
