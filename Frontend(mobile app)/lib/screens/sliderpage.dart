import 'dart:async';
import 'package:Ebloodbank/login.dart';
import 'package:Ebloodbank/model/slide.dart';
import 'package:Ebloodbank/widgets/slidedots.dart';
import 'package:Ebloodbank/widgets/slideitem.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (Timer timer){
      if(_currentPage < 2){
        _currentPage++;
      }
      else{
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
  

    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[ 
                   PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: slideList.length,
                    itemBuilder: (ctx, i)=> SlideItem(i),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 35),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for(int i = 0; i<slideList.length; i++)
                              if(i == _currentPage)
                                Slidedots(true)
                              else
                                Slidedots(false)

                          ],
                        ),
                      )
                    ]
                  )
                 ],
                )
              
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(

                  child: Text('NEXT',style: TextStyle(fontSize: 20) ,),
                  shape: RoundedRectangleBorder
                    (borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(15),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()
                    ));
                  },
                  
                ),
            ])
          ],
          ),
      ),      
    );
  }
}