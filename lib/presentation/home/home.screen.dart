import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:window_manager/window_manager.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with WindowListener {
  static const routeName = '/homescreen';
  bool value = false;
  bool _checked = false;
  int index = 0;
  bool ontap = true;

  final viewKey = GlobalKey();
  final introKey = GlobalKey<IntroductionScreenState>();
  final key = GlobalKey();
  final textFocusNode = FocusNode();
  final searchController = TextEditingController();

  Widget _buildImage(String assetName, [double width = 350]) {
    return Container(
        padding: EdgeInsets.only(top: 100),
        child: Center(
            child: Image.asset(
          'assets/images/$assetName',
          width: width,
          alignment: Alignment.center,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: material.Scaffold(
          // backgroundColor: Colors.white,
          body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * .7,
                // color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Log in',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        child: Text(
                          'Welcome to Sync Cloud, please put your login credentials below to start using the app.',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Wrap(children: [
                      Container(
                        // color: FluentTheme.of(context).borderInputColor,
                        margin: EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    "E-mail",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                                Align(
                                  child: Container(
                                    alignment: Alignment.topRight,
                                    width: 300,
                                    margin: EdgeInsets.only(right: 10, top: 10),
                                    child: TextFormBox(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: FluentTheme.of(context)
                                                    .borderInputColor)),
                                        placeholder: 'Your email',
                                        validator: (text) {
                                          if (text == null || text.isEmpty)
                                            return 'Provide an email';
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    "Password",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  child: Container(
                                    width: 300,
                                    margin: EdgeInsets.only(right: 10, top: 10),
                                    child: TextFormBox(
                                        focusNode: textFocusNode,
                                        obscureText: true,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: FluentTheme.of(context)
                                                    .borderInputColor)),
                                        placeholder: 'Your Password ',
                                        validator: (text) {
                                          if (text == null || text.isEmpty)
                                            return 'Provide an email';
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  'Fogot Password?',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 35, 62),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      ontap
                          ? Container(
                              margin: EdgeInsets.only(top: 20),
                              width: double.infinity,
                              height: 1,
                              color: Color.fromARGB(255, 212, 212, 212))
                          : Container(
                              margin: EdgeInsets.only(top: 20),
                              width: double.infinity,
                              child: ProgressBar(
                                activeColor: Color.fromARGB(255, 1, 35, 62),
                                // backgroundColor: Color.fromARGB(255, 1, 35, 62),
                                strokeWidth: 5,
                              )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.s,
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  child: Checkbox(
                                    // style: CheckboxThemeData.standard(, 10, 5),
                                    onChanged: (value) => setState(() {
                                      _checked = value!;
                                    }),
                                    checked: _checked,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Remember me',
                                    style: TextStyle(
                                        fontWeight: material.FontWeight.w400),
                                  ))
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ontap = value;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 7, 57, 97),
                                            Color.fromARGB(255, 1, 35, 62)
                                          ],
                                          begin: Alignment.topRight,
                                          end: Alignment.center),
                                    ),
                                    child: Text('Log in',
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ))
                              //   Button(
                              //       style: ButtonStyle(
                              //         backgroundColor:material.ButtonStyleButton
                              //       ),
                              //       child: Text("Login"),
                              //       onPressed:
                              // )
                              )
                        ],
                      )
                    ]),
                    Align(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, routeName);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Dont have an account?",
                                style: TextStyle(
                                    fontWeight: material.FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Register Now",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 35, 62),
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 20, 121, 203),
                Color.fromARGB(255, 1, 35, 62)
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            ),
            child: Container(
              // width: 300,
              // margin: EdgeInsets.all(20),
              color: Colors.transparent,
              child: ImageSlideshow(
                // height: 200,
                // width: 200,

                // onPageChanged:3 ,
                autoPlayInterval: 3000,
                isLoop: true,
                indicatorRadius: 0,
                indicatorColor: Colors.white,
                children: [
                  Image.asset(
                    'assets/images/slide7.png',
                    // '/assets/images/cloud_image.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/slide6.png',
                    // '/assets/images/cloud_image.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/slide1.png',
                    // '/assets/images/cloud_image.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/slide5.png',
                    // '/assets/images/cloud_image.png',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    child: Image.asset(
                      'assets/images/slide8.png',
                      // '/assets/images/cloud_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
