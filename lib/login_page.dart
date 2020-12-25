import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                "Welcome back",
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
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    // controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16)),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Password",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    // controller: _passController,
                    obscureText: true,
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 16)),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(
                        "Login",
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
              SizedBox(height: 20),

              // Garis pembatas
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Colors.white,
                  )),
                  SizedBox(width: 20),
                  Text(
                    "OR",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Colors.white,
                  )),
                ],
              ),

              // Spasi
              SizedBox(height: 20),

              // Button google dan facebook
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Login with Google"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Login with Facebook"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 30),
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.red,
              child: Text("Sliver Fill Remaining"),
            ),
          )
        ],
      )),
    );
  }
}
