import 'package:chronicle/cors/theme/app_colors.dart';
import 'package:chronicle/cors/ui/widgets/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../get_it.dart';
import '../bloc/user_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const String route = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is LoadingState){
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }
          if(state is SuccessState){
            return Column(
              children: [
                Text(
                  "Chronicle",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Spacer(),
                SvgPicture.asset('assets/images/login_image.svg'),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Collaborate with friends to craft unique stories!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                DefaultButton(
                  text: 'Login with Google',
                  textColor: AppColors.textColor,
                  backgroundColor: AppColors.secondary,
                  onPressed: () {
                    context.read<UserBloc>().add(LoginWithGoogleEvent());
                  },
                )
              ],
            );
          }
          if(state == errorMess ){
             ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? ''))
            );
          }
          return SizedBox.shrink();
        },
      )),
    );
  }
}
