import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Bubble Bottom Bar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int currentIndex;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title,style: const TextStyle(fontSize: 15),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        tilesPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            showBadge: true,
            badge: Text("5"),
            badgeColor: Colors.deepPurpleAccent,
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
            title: Text("Home"),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.person,
              color: Colors.deepPurple,
            ),
            title: Text("Profile")),
          BubbleBottomBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.settings,
              color: Colors.indigo,
            ),
            title: Text("Settings")),
          BubbleBottomBarItem(
            backgroundColor: Colors.green,
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.menu,
              color: Colors.green,
            ),
            title: Text("Menu"))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
          child:  currentIndex == 0 ?  
            const Padding(
              padding: EdgeInsets.only(top: 150),
              child: Center(child: Text("Home",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
            )
            : 
            currentIndex == 1 ?
            const Center(child: Padding(
              padding: EdgeInsets.only(top: 150),
              child: Text("User",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ))
            : 
            currentIndex == 2 ?
            const Padding(
              padding: EdgeInsets.only(top: 150),
              child: Center(child: Text("Setting",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
            )
            :
            const Padding(
              padding: EdgeInsets.only(top: 150),
              child: Center(child: Text("Menu",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
            )
          ),
        ],
      ),
    );
  }
}