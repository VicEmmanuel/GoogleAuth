// import 'package:flutter/material.dart';

// class GoogleSignIn extends StatefulWidget {
//   const GoogleSignIn({ Key? key }) : super(key: key);

//   @override
//   State<GoogleSignIn> createState() => _GoogleSignInState();
// }

// class _GoogleSignInState extends State<GoogleSignIn> {
//   @override
//   //bool loggedIn = false;

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: _buildWidget(),
//       ),
      
//     );
//   }

//   Widget _buildWidget(){
//     bool isSignedIn = false;
//     if(isSignedIn !=null){
//       return Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('displayName'),
//               subtitle: Text('email'),
//             ),
//             SizedBox(height: 20,),
//             Text(
//               'Singed in Successfully',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 10,), 
//             ElevatedButton(
//               onPressed: (){}, 
//               child: Text('Sign out')
//             )
//           ],
//         ),
//       );
//     }else{
//       return Padding(
//         padding: const  EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 20,),
//             Text(
//               'You are Signed in',
//               style: TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 10,),
//             ElevatedButton(
//               onPressed: (){}, 
//               child: Text('Sign in')
//             )
//           ]
//         ),
//       );
//     }
//   }
//   // Future<void>signIn() async{
//   //   final LoginResult result = await FacebookAuth.i.login();

//   //   if(result.status== LoginStatus.success){
//   //     _accessToken = result.accessToken;

//   //     final data = await FacebookAuth.i.getUserData();

//   //     UserModel model = UserModel.fromJson(data);

//   //     _currentUser = model;
//   //     setState(() {
        
//   //     });
//     //}
//   //}

//   // Future<void>signOut() async{
//   //   await FacebookAuth.i.logOut();
    
//   //   _accessToken = null;
    
 
//   //   setState(() {
        
//   //     });
//   //   }
// }