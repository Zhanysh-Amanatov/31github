/*External dependencies */
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
/*Local dependencies */
import 'package:finik/routes/routes.dart';
import 'package:finik/screens/common/button_widget.dart';
import 'package:finik/screens/common/drawer_list_button_widget.dart';
import 'package:finik/services/auth/bloc/auth_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static Page<void> page() => const MaterialPage<void>(child: HomeView());

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLogged = false;
  final authUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white70,
                size: 32,
              ),
            );
          }),
          backgroundColor: Colors.black,
        ),
        drawer: Drawer(
          width: 350.w,
          backgroundColor: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView(
              primary: true,
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white70,
                        size: 32,
                      ),
                    ),
                    SizedBox(width: 50.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/logos/logo.svg',
                          width: 20.h,
                          height: 20.h,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Карта',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'NeueMachina',
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 39.h),
                if (authUser == null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 201.w,
                        child: Text(
                          'Финик Карта',
                          style: TextStyle(
                            height: 1.h,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'NeueMachina',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Отмечай места на карте где нет нашего терминала, мы поставим его, а тебе пришлем бонусы которые ты сможешь обменять на реальные призы',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ButtonWidget(
                        btnText: 'Войти',
                        onPressed: () =>
                            Navigator.of(context).pushNamed(logInRoute),
                      ),
                      SizedBox(height: 16.h),
                      ButtonWidget(
                        btnText: 'Регистрация',
                        fgColor: const Color(0xFFACF709),
                        bgColor: const Color(0xFF222222),
                        onPressed: () =>
                            Navigator.of(context).pushNamed(signUpEmailRoute),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 58, 54, 54),
                            child: Icon(
                              Icons.account_circle_outlined,
                              size: 40,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'username',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 4.w),
                              // Text(
                              //   user.email ?? '',
                              //   style: GoogleFonts.inter(
                              //     textStyle: TextStyle(
                              //       color: Colors.white70,
                              //       fontSize: 14.sp,
                              //       fontWeight: FontWeight.w500,
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25.w),
                      Column(
                        children: [
                          const DrawerListButtonWidget(btnText: 'Информация'),
                          SizedBox(height: 24.h),
                          const DrawerListButtonWidget(btnText: 'Обучение'),
                          SizedBox(height: 24.h),
                          const DrawerListButtonWidget(btnText: 'Настройки'),
                          SizedBox(height: 24.h),
                          const DrawerListButtonWidget(
                              btnText: 'Служба поддержки'),
                          SizedBox(height: 24.h),
                          const DrawerListButtonWidget(
                              btnText: 'Продукты Finik'),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF222222),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '320',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        'баллов',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 4.w),
                                  Row(
                                    children: [
                                      Text(
                                        'Ты',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        '41',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        'в списке лидеров',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Image.asset(
                                'assets/images/duck.png',
                                width: 77.w,
                                height: 76.h,
                                alignment: Alignment.bottomRight,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      ButtonWidget(
                        bgColor: Colors.transparent,
                        fgColor: const Color(0xFFACF709),
                        btnText: 'Выйти',
                        onPressed: () async {
                          final shouldLogOut = await showLogOutDialog(context);
                          if (shouldLogOut) {
                            context.read<AuthBloc>().add(
                                  const AuthEventLogOut(),
                                );
                          }
                        },
                      )
                    ],
                  )
              ],
            ),
          ),
        ),
        body: const Center(
          child: Text(
            'Home View',
            style: TextStyle(color: Colors.white70, fontSize: 30),
          ),
        ),
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sign out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Log out'))
          ],
        );
      }).then((value) => value ?? false);
}
