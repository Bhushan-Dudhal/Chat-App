// import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';

class splashView extends StatefulWidget {
  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animatedContainer;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animatedContainer = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animatedContainer, curve: Curves.easeIn),
    );
    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.0).animate(     //0.8
      CurvedAnimation(parent: _animatedContainer, curve: Curves.easeInOut),
    );
    _animatedContainer.forward();

    _checkAuthAndNavigate();
  }

  void _checkAuthAndNavigate() async {
    await Future.delayed(Duration(seconds: 2));
    final authController = Get.put(AuthController(), permanent: true);
    await Future.delayed(Duration(microseconds: 500));

    if (authController.isAuthenticated) {
      Get.offAllNamed(AppRoutes.splash);

      //for now we don't have main screen
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animatedContainer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: AnimatedBuilder(animation: _animatedContainer, builder: (context,child){
          return FadeTransition(opacity: _fadeAnimation,
          child: ScaleTransition(scale: _scaleAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10), 
                    )
                  ]
                ),
                child: Icon(Icons.chat_bubble_rounded,
                size: 70,
                color:Color(0xFF6C63FF),
                ),
              ),
              SizedBox(height: 32,),
              Text("Chat App",
              style:Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white
              ),
              ),
              SizedBox(height: 32,),
              Text("Connect with Friends Instantly",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.8),

              ),
              
              ),
              SizedBox(height: 64,),
              CircularProgressIndicator(
                color: Colors.white,
                strokeWidth:3,
              )
            ],
          ),
          ),
          );
        }),
      ),
      
    );
  }
}

