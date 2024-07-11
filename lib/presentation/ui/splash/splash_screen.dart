import 'package:currency_flutter/presentation/ui/main/main_bloc.dart';
import 'package:currency_flutter/presentation/ui/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    openNext();
  }

  openNext() async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
        BlocProvider(
          create: (context) => MainBloc(),
          child: MainScreen(),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Image.asset('assets/images/logo.png', width:178, height: 178,),
        ),

      ),
    );
  }
}
