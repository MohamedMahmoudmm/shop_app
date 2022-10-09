import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index)=>ClubItem(),
        separatorBuilder: (context,index)=>Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
        ),
        itemCount: 10);
  }

  Widget ClubItem()=>Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('الملعب',
          style: TextStyle(
              fontSize: 20,
              color: Colors.red[900],
            fontWeight: FontWeight.bold
          ),),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  // Container(
                  //   width: 50,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //
                  //     image: DecorationImage(
                  //         image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_Egypt.svg/255px-Flag_of_Egypt.svg.png'),
                  //    fit: BoxFit.cover
                  //     ),
                  //
                  //   ),
                  // )
                  Text('Team 1',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold
                    ),),
                  Text('احمد يوسف',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold
                    ),),

                ],
              ),
            ),
            
            Column(
              children: [
                Text('9 - 9',
                  style: TextStyle(
                      fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text('11/8/2022',
                    style: TextStyle(
                        fontSize: 20,
                      color: Colors.grey
                    ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //   width: 50,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //
                  //     image: DecorationImage(
                  //         image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/800px-Flag_of_Argentina.svg.png'),
                  //         fit: BoxFit.cover
                  //     ),
                  //
                  //   ),
                  // ),
                  Text('Team 2',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold
                    ),),
                  Text('محمد محمود',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                      fontWeight: FontWeight.bold
                    ),),

                ],
              ),
            ),

          ],
        )
      ],
    ),
  );
}
