
import 'package:flapp/util/colors/app_colors.dart';
import 'package:flapp/util/padding/padding_ext.dart';
import 'package:flapp/view_model/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
 

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kScaffoldBGColor,
        body: ChangeNotifierProvider(
          create: (_) => ProfileViewModel(), 
          child: Consumer<ProfileViewModel>(
            builder: (context, profileViewModel, _) {
        
              if (profileViewModel.userProfile != null) {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: context.height,
                    width: context.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.height * 0.01,
                          horizontal: context.width * 0.01),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.05,
                                vertical: context.height * 0.05),
                            child: InkWell(
                              onTap: () =>
                                  profileViewModel.uploadFromCamera(),
                              child: profileViewModel.downloadUrl != null
                                  ? ClipOval(
                                      child: Image.network(
                                          profileViewModel.downloadUrl!),
                                    )
                                  : ClipOval(
                                      child: Image.asset("assets/user.jpeg"),
                                    ),
                            ),
                          ),
                          Text(
                            "İsim: ${profileViewModel.userProfile!.name}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: context.height * 0.01),
                          Text(
                            "Email: ${profileViewModel.userProfile!.email}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
              
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
