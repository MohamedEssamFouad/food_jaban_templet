import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Be extends StatefulWidget {
  const Home_Be({Key? key}) : super(key: key);

  @override
  State<Home_Be> createState() => _Home_BeState();
}

class _Home_BeState extends State<Home_Be> {
  var SelectedFood='BURGER';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            children: [

              ShaderMask(shaderCallback: (rect){
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                ).createShader(Rect.fromLTRB(0.0,rect.width,rect.height,0.0));
              },
                blendMode: BlendMode.darken,
                child: Image(

                  width: 500,
                  image: NetworkImage('https://i.pinimg.com/736x/ee/a4/d4/eea4d430c144370688022fadc083ce25.jpg'),
                ),

              ),
              RotatedBox(quarterTurns: 3,

              child: Text('JAPAN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 75,
                color: Colors.white.withOpacity(0.3),
                letterSpacing: 10,
              ),
              ),

              ),
              Positioned(child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Center(
                  child: Icon(
                    Icons.menu,
                  ),
                ),
              ),
                top: 2,
                right: 5,

              ),
              Positioned(top: 2,right: 5,child: Container(height: 12,width: 12,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                    color: Colors.red),
              ),
                ),
              Positioned(top: 250,left: 40,


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'WELCOME ',

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                          fontSize: 40,
                          color: Colors.white,

                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'TO',

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                          fontSize: 40,
                          color: Colors.white,


                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text('TOKYO',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.pink[300]),),
                      Text(',',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(width: 10,),
                      Text('JAPAN',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Oswald',
                        fontSize: 50,
                        color: Colors.white,
                      ),
                      ),

                    ],
                  ),

                ],

              ),

              ),
              Positioned(top: 380,left: 25,right: 25,child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF262626),
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Lets explore some food here ....',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontSize: 20,

                      ),
                      prefixIcon: Icon(
                        Icons.search,color: Colors.grey,
                      )
                    ),
                  ),
                ),
              ),),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildMenuItem('BURGER', Icons.fastfood),
            _buildMenuItem('TEA', Icons.local_drink),
            _buildMenuItem('BEER', Icons.local_drink),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('CAKE', Icons.cake),
              _buildMenuItem('COFFEE', Icons.cloud),
              _buildMenuItem('MEAT', Icons.restaurant),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('ICE', Icons.insert_chart),
              _buildMenuItem('FISH', Icons.filter_tilt_shift),
              _buildMenuItem('DONUTS', Icons.donut_small),
            ],
          )
        ],
      ),

    );

  }

  Widget _buildMenuItem(String foodName, iconData) {
    return InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          selectMenuOption(foodName);
        },
        child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 300),
            height: SelectedFood == foodName ? 100.0 : 75.0,
            width: SelectedFood == foodName ? 100.0 : 75.0,
            color: SelectedFood == foodName
                ? Color(0xFFFD3566)
                : Colors.transparent,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                iconData,
                color: SelectedFood == foodName ? Colors.white : Colors.grey,
                size: 25.0,
              ),
              SizedBox(height: 12.0),
              Text(foodName,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color:
                      SelectedFood == foodName ? Colors.white : Colors.grey,
                      fontSize: 10.0))
            ])));
  }

  selectMenuOption(String foodName) {
    setState(() {
      SelectedFood = foodName;
    });
  }
}
