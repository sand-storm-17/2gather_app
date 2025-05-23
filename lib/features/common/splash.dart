import 'package:flutter/material.dart';
import 'package:gather/constants/assets.dart';
import 'package:gather/routing/models/routes.dart';
import 'package:gather/theme/app_colors.dart';
import 'package:gather/theme/app_theme.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Stack(
              children: [
                Image.asset(Assets.blob1),
                Image.asset(Assets.sprinkles),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(Assets.blob2),
              Image.asset(Assets.logo)
            ],
          ),
          Column(
            children: [
              TextButton(child: Text("Where things...",style: AppTheme.headLineLarge24.copyWith(color: AppColors.white),), onPressed: ()=>context.go(Routes.signIn),),
              Text("...just happen",style: AppTheme.headLineLarge24,),
            ],
          ),
          Image.asset(Assets.splash, alignment: Alignment.bottomCenter)
        ],
      ),
    );
  }
}
