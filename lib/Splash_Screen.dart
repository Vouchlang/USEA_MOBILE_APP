import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:usea_app/Home.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (ctx) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/logo3.png',
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'KhmerOSmuol',
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Text(
              'UNIVERSITY OF SOUTH-EAST ASIA',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 17.5,
                  // letterSpacing: 2.4,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: 5,
            ),
            SpinKitThreeBounce(
              color: Theme.of(context).primaryColor,
              size: 15,
            ),
            // Lottie.network(
            //     'https://assets3.lottiefiles.com/packages/lf20_jNwmgH.json',
            //     height: 150)
          ],
        ),
      ),
    );
  }
}
