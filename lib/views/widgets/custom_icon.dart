import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // this is used to set the width and height of the sized box
      width: 45,
      height: 30,
      child: Stack(
        children: [
          Container(
            // this is used to set the margin of the container
            margin: const EdgeInsets.only(left: 10),
            // this is used to set teh height of the container
             width: 38,
             // this is used to set hte decroation of the container
             decoration: BoxDecoration(
              // this is used to set the color of the container
              color:  const Color.fromARGB(255, 250, 45, 108),
               // this is used to set the botrder radius
               borderRadius: BorderRadius.circular(7)
             ),
            
             ),
             Container(
            // this is used to set the margin of the container
            margin: const EdgeInsets.only(right: 10),
            // this is used to set teh height of the container
             width: 38,
             // this is used to set hte decroation of the container
             decoration: BoxDecoration(
              // this is used to set the color of the container
              color:  const Color.fromARGB(255, 32, 211, 234),
               // this is used to set the botrder radius
               borderRadius: BorderRadius.circular(7)
             ),
            
             ),
             Center(
               child: Container(
              // this is used to set the height of the conta iner
              height: double.infinity,
                         // this is used to set teh height of the container
               width: 38,
               // this is used to set hte decroation of the container
               decoration: BoxDecoration(
                // this is used to set the color of the container
                color:  Colors.white,
                 // this is used to set the botrder radius
                 borderRadius: BorderRadius.circular(7)
               ),
               child: const Icon(Icons.add, color: Colors.black, size: 20)          
               ),
             )
          
        ],)
    );
  }
}