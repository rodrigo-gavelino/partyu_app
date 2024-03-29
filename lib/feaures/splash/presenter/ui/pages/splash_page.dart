import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partyu/core/constants/assets.dart';
import 'package:partyu/feaures/auth/core_auth/routes/auth_named_routes.dart';
import 'package:partyu/feaures/splash/presenter/cubits/splash_cubit/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<SplashCubit>()..loadSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedState) {
            Navigator.pushReplacementNamed(context, AuthNamedRoutes.signIn);
          }
        },
        builder: (context, state) {
          if (state is SplashLoadingState) {
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(64),
                    child: SvgPicture.asset(Assets.logo),
                  ),
                  const CircularProgressIndicator(),
                ],
              ),
            );
          } else if (state is SplashErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
