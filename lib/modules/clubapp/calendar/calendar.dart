import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var add=0;
  @override

  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'الملعب',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.red[900]
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Team 1',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold
                        ),),

                      Text('محمد محمود',
                        style: TextStyle(
                            fontSize: 25
                        ),),
                      Text('فتحى مؤمن',
                        style: TextStyle(
                            fontSize: 25
                        ),),
                      Text('خالد رمضان',
                        style: TextStyle(
                            fontSize: 25
                        ),),
                      Text('كريم احمد (GK)',
                        style: TextStyle(
                            fontSize: 25
                        ),),
                      Text('خالد محمد',
                        style: TextStyle(
                            fontSize: 25
                        ),),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 230,
                  color: Colors.grey,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Team 2',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold
                        ),),
                      Text('احمد يوسف',
                        style: TextStyle(
                            fontSize: 25
                        ),),
                      Text('معوض',
                        style: TextStyle(
                            fontSize: 25
                        ),),
                      Text('عادل محمد',
                        style: TextStyle(
                            fontSize: 25
                        ),),
                      Text('(GK)عبدالرحمن ',
                        style: TextStyle(
                            fontSize: 25
                        ),),
                      Text('يوسف عصام',
                        style: TextStyle(
                            fontSize: 25
                        ),),

                    ],
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Time',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text('11 : 00',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                Text('الخميس',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold
                  ),),
                Text('18/8/2022',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('اشطا موافق',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20
                          ),),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)
                          ),
                          child: IconButton(

                              padding: EdgeInsets.zero,
                              onPressed: (){},
                              icon: Icon(Icons.check,
                                color: Colors.green,)),
                        ),
                        Text('7',
                        style: TextStyle(
                          fontSize: 20
                        ),)
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text('احااا اعترض',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20
                          ),),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)
                          ),
                          child: IconButton(padding: EdgeInsets.zero,
                              onPressed: (){
                            setState((){
                              add=add+1;
                            });
                              },
                              icon: Text('x',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 28,

                                ),
                              )
                          ),
                        ),
                        Text('$add',
                          style: TextStyle(
                              fontSize: 20
                          ),)
                      ],
                    )
                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}