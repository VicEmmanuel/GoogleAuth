import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:signintest/cubit/ThemeCubit.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    ()=> runApp(const MyApp()),
    storage: storage,
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return GetMaterialApp(
            title: 'Flutter Demo',
            themeMode: state? ThemeMode.dark: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Home(),
          );
        },
      ),
    );
  }
}

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  Widget _continueWithGoogle() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
        width: MediaQuery.of(context).size.width,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(  
              height: 30,
              width: 30,
              child: Image.asset("assets/images/google_logo_icon.png")
              ),
              SizedBox(width: 15,),
            Text(
              "Continue With Google",
              style: TextStyle(
                  //color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.blue,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              leading: GoogleUserCircleAvatar(identity: user),
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Singed in Successfully',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),

            ElevatedButton(onPressed: signOut, child: Text('Sign out'))
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'You are Not Signed in',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap:signIn,
            child: _continueWithGoogle()),
          //ElevatedButton(onPressed: signIn, child: Text('Sign in')),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ThemeCubit, bool>(
            builder: (context, state) {
              return SwitchListTile(
                value: state,
                onChanged: (value) {
                  BlocProvider.of<ThemeCubit>(context)
                      .toggleTheme(value: value);
                },
                title: Text("Toggle theme"),
              );
            },
          ),
        ]),
      );
    }
  }

  void signOut() {
    _googleSignIn.disconnect();
  }

  Future<void> signIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      print('Error signing in $e');
    }
  }
}
