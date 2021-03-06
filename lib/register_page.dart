import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/authentication.dart';
import 'package:flutter_firebase_auth/login_page.dart';
import 'package:flutter_firebase_auth/profile_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _confirmPassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                // Hello
                Row(
                  children: [
                    Text("Hello.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        )),
                    SizedBox(width: 16),
                    Expanded(
                        child: Divider(
                      thickness: 3,
                      color: Colors.white,
                    )),
                    SizedBox(
                      width: 40,
                    )
                  ],
                ),

                // Welcome Back
                Text(
                  "Register First",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 36,
                      letterSpacing: 5),
                ),

                // Spasi
                SizedBox(height: 40),

                // Form username & password
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Email tidak boleh kosong';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Password",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _passController,
                          obscureText: true,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Password tidak boleh kosong';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Confirm Password",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _confirmPassController,
                          obscureText: true,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Confirm Password tidak boleh kosong';
                            } else if (val != _passController.text) {
                              return 'Password dan Confirm Password harus sama';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.white)),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                SignInSignUpResult result =
                                    await AuthService.createUser(
                                        email: _emailController.text,
                                        pass: _passController.text);
                                if (result.user != null) {
                                  // Go to profile page
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfilePage(user: result.user)));
                                } else {
                                  // Show dialog
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text("Error"),
                                            content: Text(result.message),
                                            actions: [
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text("OK"))
                                            ],
                                          ));
                                }
                              }
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Color(0xFF4f4f4f),
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                        )
                      ],
                    )),

                // Spasi
                SizedBox(height: 30),
              ]),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Already have acoount ?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        "Login here",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
