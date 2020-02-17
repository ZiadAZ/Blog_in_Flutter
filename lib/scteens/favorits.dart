import 'package:flutter/material.dart';

class Favorits extends StatefulWidget {
  @override
  _FavoritsState createState() => _FavoritsState();
}

class _FavoritsState extends State<Favorits> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx,index){
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                _head(),
                _body(),
             

              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

 Widget _head() {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
       height: 50,
       margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              image:DecorationImage(
                  image: ExactAssetImage("img/1.jpg"),
                  fit: BoxFit.cover
              )

          ),

        ),
        Expanded(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Text("Ziad Zayed" ,style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w600,fontSize: 16),),
SizedBox(
  height: 10,),
              Row(
                children: <Widget>[
                  Text("15 Min. ",style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w600)),
                  Text("Technology",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 16),)
                ],
              )
            ],
          ),
        ),
        IconButton(icon: Icon(Icons.favorite,color: Colors.grey,),onPressed: ()=>null,)
      ],
    );
 }

 Widget _body() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 8,top: 8),
          width: 124,
          height: 124,
          decoration: BoxDecoration(

            image: DecorationImage(
              image: ExactAssetImage("img/2.jpg"),
              fit: BoxFit.fill

            )
          ),
        ),
        Expanded(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[
              Text("رسميا.. البايرن يعلن التعاقد مع خليفة نوير" ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(
                height: 10,),
              Text("رسميا.. البايرن يعلن التعاقد مع خليفة نوير رسميا.. البايرن يعلن التعاقد مع خليفة نوير" ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16,height: 1),),

            ],
          ),

        ),


      ],
    );
 }
}
