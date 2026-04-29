// import 'package:chat_app/controllers/forget_password_controller.dart';
import 'package:chat_app/controllers/profile_controller.dart';
import 'package:chat_app/routes/app_routes.dart';
import 'package:chat_app/views/auth/forget_password_view.dart';
import 'package:chat_app/views/auth/login_view.dart';
import 'package:chat_app/views/auth/profile/change_password_view.dart';
import 'package:chat_app/views/auth/profile_view.dart';
import 'package:chat_app/views/auth/register_view.dart';
import 'package:chat_app/views/auth/spash_view.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppPage {
  static const String initial = AppRoutes.splash;

  static final routes = [
    GetPage(name: AppRoutes.splash, page:()=> splashView()),
    GetPage(name: AppRoutes.login, page:()=>LoginView()),
    GetPage(name: AppRoutes.register, page: ()=>RegisterView()),

    GetPage(name: AppRoutes.forgetPassword, page:()=> ForgetPasswordView()),
    GetPage(name: AppRoutes.changePassword, page:()=>ChangePasswordView(),),
 
    // GetPage(name: AppRoutes.home, page: ()=>HomeView(),
    // binding: BindingsBuilder((){
    //   Get.put(HomeController());
    // })
    // ),

    // GetPage(name: AppRoutes.main, page: ()=>mainView(),
    // binding: BindingsBuilder((){
    //   Get.put(MainController());
    // })
    // ),

    GetPage(name: AppRoutes.profile, page: ()=>ProfileView(),
    binding: BindingsBuilder((){
      Get.put(ProfileController());
    })

    ),

    // GetPage(name: AppRoutes.chat, page:()=>chatView(),

    // binding: BindingsBuilder((){
    //   Get.put(ChatController());
    // })
    // ),

    // GetPage(name: AppRoutes.userList, page:userListView(),
    // binding: BindingsBuilder((){
    //   Get.put(UserListController());
    // })
    // ),

    // GetPage(name: AppRoutes.friends, page: ()=>friendsView(),
    // binding: BindingsBuilder((){
    //   Get.put(FriendsController);
    // })
    // ),

    // GetPage(name: AppRoutes.friendRequests, page: ()=>const friendRequestView(),
    // binding: BindingsBuilder((){
    //   Get.put(FriendRequestController());
    // })
    // ),

    // GetPage(name: AppRoutes.notification,
    //  page:()=> const notificationView(),
    //  binding: BindingsBuilder((){
    //   Get.put(NotificationsCotroller());
    //  })
    //  )
  ];
}
