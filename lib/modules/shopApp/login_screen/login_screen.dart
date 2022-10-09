import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var formKey=GlobalKey<FormState>();
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          children: [
            Container(
              //color: Colors.deepPurple,
              width: double.infinity,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'MY SHOP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            'hello in our shop app',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          TextFormField(
                            controller: emailController,

                            decoration: InputDecoration(

                              label: Text(
                                'email Address',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                ),
                              ),
                              hintText: '@gmail.com',
                            ),
                            validator: (value)
                            {
                              if(value!.isEmpty)
                                {
                                  return'please enter your email';
                                }

                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.remove_red_eye_rounded),
                              label: Text(
                                'password',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                ),
                              ),
                              hintText: '********',
                            ),
                            validator: (value)
                            {
                              if(value!.isEmpty)
                              {
                                return'enter password';
                              }

                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextButton(
                                      onPressed: () {
                                        if(formKey.currentState!.validate())
                                          {
                                            print('club_login seccess');
                                          }
                                      },
                                      child: Text(
                                        'club_login',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Or loin with',
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 10),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.facebook,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.telegram,
                                      color: Colors.blue,
                                      size: 30,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
