import 'package:flutter/material.dart';
import 'package:flutter_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';


class LoginPage extends StatefulWidget {
  // const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/login_image.png',
                fit: BoxFit.cover,
              ),

              SizedBox(
                height: 20.0,
              ),

              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 20.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0 , horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),

                      validator: (value) {
                        if(value.isEmpty){
                          return "Username cannot be empty";
                        }
                        return null;
                      },

                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),

                      validator: (value) {
                        if(value.isEmpty){
                          return "Password cannot be empty";
                        }
                        else if (value.length <6){
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),

                    SizedBox(
                      height: 30.0,
                    ),

                    Material (
                      color: context.theme.buttonColor,
                      // shape: changeButton? BoxShape.circle : BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(changeButton?20 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),

                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton?50 : 110,
                          height: 35,
                          alignment: Alignment.center,
                          child: changeButton? Icon(Icons.done,color: Colors.white,):Text("Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),
                          ),
                        ),
                      ),
                    ),

                    // ElevatedButton(
                    //     child: Text("Login"),
                    //     style: TextButton.styleFrom(minimumSize: Size(110,30)),
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     },
                    // )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
