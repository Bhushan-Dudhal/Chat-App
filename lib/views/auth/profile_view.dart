import 'package:chat_app/controllers/profile_controller.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),
      centerTitle: true,
      leading: IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back)),
      actions: [  
        Obx(()=>TextButton(onPressed: controller.isEding?controller.toggleEditing:controller.toggleEditing, child: Text(controller.isEding?'Cancel':'Edit',
        style: TextStyle(
          color: controller.isEding?AppTheme.errorColor:AppTheme.primaryColor
        ),
        )))
      ],
      ),
      body: Ob,
    );
  }
}
