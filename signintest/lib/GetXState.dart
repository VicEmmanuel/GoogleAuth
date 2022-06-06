// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:get/get.dart';

// class GetXSwitchState extends GetxController{
//   var isSwitched =false;

//   final switchdatacontroller =GetStorage();

//   GetXSwitchState(){
//     print("Constructor called");
//     if(switchdatacontroller.read('getXIsSwitched') !=null){
//       isSwitched =  switchdatacontroller.read('getXIsSwitched');
//       update();
//     }
//   }

//   changeSwitchState(bool value){
//     isSwitched = value; 
//     switchdatacontroller.write('getXIsSwitched', isSwitched);
//     update();
//   }
// }

// class GetSwitch extends StatefulWidget {
//   const GetSwitch({ Key? key }) : super(key: key);

//   @override
//   State<GetSwitch> createState() => _GetSwitchState();
// }

// class _GetSwitchState extends State<GetSwitch> {
//   final switchData = GetStorage();
//   bool isSwitched = false;

//   final GetXSwitchState getXSwitchState = Get.put(GetXSwitchState());
//   @override

//   void initState(){
//     super.initState();

//     if(switchData.read('isSwitched') !=null){
//       setState(() {
//         isSwitched = switchData.read('isSwitched');
//       });
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("State Management switch"),
//             GetBuilder<GetXSwitchState>(builder: (_) => Switch(value: getXSwitchState.isSwitched, 
//             onChanged: (value){
//               getXSwitchState.changeSwitchState(value);
//             }
//             ))
//           ],
//         ),
//       )
//     );
//   }
// }