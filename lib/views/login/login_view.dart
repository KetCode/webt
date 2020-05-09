import 'package:flutter/material.dart';
import 'package:inotech/constants/app_colors.dart';
import 'package:inotech/widgets/call_to_action/call_to_action.dart';

// esse modelo ficou bem melhor pq não preciso modificar para o mobile tbm, então foi bem mais rápido.
class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  
  String _email = '';
  String _password = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail(){
    return TextFormField(
      validator: (String value){
        if(value.isEmpty){
          return "Campo está em branco";
        } 
        if(!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value)){
          return "Insira um endereço de e-mail válido";
        }
        return null;
      },
      onSaved: (String value){
        _email = value;
      },
      decoration: InputDecoration(
        labelText: 'E-mail',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
  Widget _buildPassword(){
    return TextFormField(
      validator: (String value){
        if(value.isEmpty){
          return "Campo está em branco";
        }  return null;
      },
      onSaved: (String value){
        _password = value;
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Senha',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 500),
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image.asset('assets/logo.png'), // Logo da inotech no topo.
                    _buildEmail(),
                    _buildPassword(),
                    FlatButton(
                      child: CallToAction('Entrar'),
                      onPressed: () async {
                        if(!_formKey.currentState.validate()){
                          return;
                        }
                        _formKey.currentState.save();
                        print('_email');
                        print('_password');
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      child: Text(
                        "Esqueceu a senha?",
                        style: TextStyle(fontSize: 17.0, color: primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ]
                ),
            ),
          ),
        ));
  }
}