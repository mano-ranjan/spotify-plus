import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/login_provider/user_data.dart';
import 'package:spotify_app/providers/users_provider/new_user_data.dart';
import 'package:spotify_app/services/add_user.dart';
import 'package:spotify_app/utils/constants/colors.dart';
import 'package:spotify_app/routes/routes.dart' as route;

class LoginFirstTimeFormScreen extends StatefulWidget {
  const LoginFirstTimeFormScreen({Key? key}) : super(key: key);

  @override
  State<LoginFirstTimeFormScreen> createState() =>
      _LoginFirstTimeFormScreenState();
}

class _LoginFirstTimeFormScreenState extends State<LoginFirstTimeFormScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: SpotifyPlusColors().pureGreen,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextFormField(
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: SpotifyPlusColors().pureGreen,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextFormField(
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Second Name',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: SpotifyPlusColors().pureGreen,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextFormField(
                            controller: emailIdController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email Id',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<NewUserData>(context, listen: false)
                          .updateFirstName(firstNameController.text);
                      Provider.of<NewUserData>(context, listen: false)
                          .updateLastName(lastNameController.text);
                      Provider.of<NewUserData>(context, listen: false)
                          .updateEmailId(emailIdController.text);
                      addUser();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          route.dashBoardPage, (route) => false);
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: SpotifyPlusColors().pureGreen,
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18,
                            color: SpotifyPlusColors().pureWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
