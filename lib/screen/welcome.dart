
import 'package:animations/animations.dart';
import "package:fiutter_bloc/bloc/welcome_bloc.dart";
import "package:fiutter_bloc/bloc/welcome_event.dart";
import "package:fiutter_bloc/bloc/welcome_state.dart";
import"package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:dots_indicator/dots_indicator.dart';
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
PageController pageController=PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body: 
    BlocBuilder<WelcomeBloc,WelcomeState>
    (builder: (context,state){
      return    Container(
        color: Colors.white,
        
         child: Stack(
           children:[
           PageView(
            controller: pageController,
            onPageChanged: (index){
            state.page= index;
              print(index);
        BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
            },
            children: [
           _weight(0,context,
         Image.asset('assets/images/boy.png'),
        
         "First see learning","Forget about poor marks in paper here you practice you difficult subject","Get Started"
           ),
           _weight(1,context, Image.asset("assets/images/man.png"), "First see learning","Forget about poor marks in paper here you practice you difficult subject","Get Started"),
           _weight(2,context, Image.asset("assets/images/reading.png"), "First see learning","Forget about poor marks in paper here you practice you difficult subject","Get Started"),
          
            ],
           ),
          Positioned(
            bottom:100.h,
            left: 0,
            right: 0,
            child: Align(
               alignment: Alignment.bottomCenter,
              child: DotsIndicator(
                position: state.page,
                dotsCount: 3,mainAxisAlignment: MainAxisAlignment.center,)))   
           ]
         ),
       );
      
    },)
      ),
    );
  }
  _weight(int index  ,BuildContext context ,Image Image,String title,String subtitle,String buttonText){
 return  Column(
   children: [
       Image,
        SizedBox(height: 20.h,),
         Text(title,style:  TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,),),
          SizedBox(height: 10.h,),
     Padding(
       padding: const EdgeInsets.symmetric(horizontal:  20,),
       child: Text(subtitle,style:  TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal,)),
     ),
      SizedBox(height: 50.h,),
      GestureDetector(
        onTap: (){
          if(index<2){
            pageController.animateToPage(index + 1, duration: const Duration(microseconds:5000), curve: Curves.decelerate);
          }else{
         
          }
        },
        child: Container(
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            boxShadow: [   BoxShadow(blurRadius: 0,spreadRadius: 1,offset: Offset(0, 5),
            color: Colors.grey.withOpacity(0.5))
            ]
          ),
          child: Center(child: Text(buttonText))
        ),
      ),
   ],
 );
  }
}