// ignore_for_file: unnecessary_new, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}
final imglogin =SizedBox(child: Image.asset("assets/images/login.png"),width: 200,height: 200,);
class _MyloginState extends State<Mylogin> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final campusuario = TextEditingController();
  final campsenha = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(  child: Padding(
          padding: const EdgeInsets.all(16.0), // Ajuste este valor conforme necessário
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 45),
              imglogin,
              SizedBox(height: 45),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: campusuario,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        labelText: "Nome De Usuario",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                       validator: (value) {
                        if(value!.isEmpty){
                          return "O nome de usuario tem que estar preenchido!";
                        }else{
                          if (campusuario.text.length < 5)
                          {
                            return "A nome de usuario tem ter mais de 5 caracters";
                          }
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 25,),
                    TextFormField(
                      controller: campsenha,
                       keyboardType: TextInputType.number,
                       inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                       ],
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        labelText: "SENHA",
                        border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "O campo senha tem que estar preenchido!";
                        }else{
                          if (int.parse(campsenha.text)<10)
                          {
                            return "A senha tem ter mais de 10 caracters";
                          }
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              if (_formKey.currentState!.validate())
              {
                int senha  = int.parse(campsenha.text);
                String nmu = campusuario.text;
                print("SUCESSO");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("SUCESSO")));
                setState(() {
                  
                });
              }
            }, child: Text("Cadastrar"),
            ),
  ]
  ),
        ),
      ),
    );
  }}