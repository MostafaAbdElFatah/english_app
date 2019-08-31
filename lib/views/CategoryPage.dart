import 'package:flutter/material.dart';
import 'PhrasesPage.dart';
import 'ImagesPage.dart';
import 'ColorsPage.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English App"),
      ),
      body: getTabBar(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _tabController.index,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.brown,
      selectedLabelStyle: TextStyle(
          color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w800),
      //unselectedLabelStyle: ,
      items: [
        BottomNavigationBarItem(
          activeIcon: Image.asset(
            "lib/icons/numbers.png",
            height: 25,
            width: 25,
          ),
          icon: ImageIcon(
            AssetImage("lib/icons/numbers.png"),
            color: null,
          ),
          title: new Text('NUMBERS'),
        ),
        BottomNavigationBarItem(
            activeIcon: Image.asset(
              "lib/icons/family.png",
              height: 25,
              width: 25,
            ),
            icon: ImageIcon(
              AssetImage("lib/icons/family.png"),
              color: null,
            ),
            title: new Text('FAMILY')),
        BottomNavigationBarItem(
            activeIcon: Image.asset(
              "lib/icons/colors.png",
              height: 25,
              width: 25,
            ),
            icon: ImageIcon(
              AssetImage("lib/icons/colors.png"),
              color: null,
            ),
            title: new Text('COLORS')),
        BottomNavigationBarItem(icon: Icon(null), title: new Text('PHRASES'))
      ],
      onTap: (index) {
        setState(() {
          _tabController.animateTo(_tabController.index = index);
        });
      },
    );
  }

  Widget getTabBar() {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: AppBar(
            bottom: TabBar(
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 5.0, color: Colors.white),
                //insets: EdgeInsets.symmetric(horizontal:16.0)
              ),
              labelStyle:
              TextStyle(fontSize: 16.0, fontWeight: FontWeight.w800),
              labelColor: Colors.white,
              //unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600),
              tabs: <Widget>[
                Tab(text: "NUMBERS"),
                Tab(text: "FAMILY"),
                Tab(text: "COLORS"),
                Tab(text: "PHRASES"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ImagesPage(
              fileName: 'lib/assets/numbers.json',
              backgroundColor: Colors.orange),
            ImagesPage(
              fileName: 'lib/assets/family.json',
              backgroundColor: Colors.green),
            ColorsPage(
              fileName: 'lib/assets/colors.json',
              backgroundColor: Colors.purple,
              images: colors,),
            PhrasesPage()
          ],
        ),
      ),
    );
  }

  static var colors = [
    Color.fromRGBO(251, 42, 28, 1),
    Color.fromRGBO(40, 246, 45, 1),
    Color.fromRGBO(16, 63, 250, 1),
    Color.fromRGBO(254, 249, 55, 1),
    Color.fromRGBO(0, 0, 0, 1),
    Color.fromRGBO(254, 254, 254, 1),
    Color.fromRGBO(252, 145, 38, 1),
    Color.fromRGBO(168, 120, 70, 1),
    Color.fromRGBO(142, 142, 144, 1),
    Color.fromRGBO(227, 79, 229, 1),
    Color.fromRGBO(145, 40, 144, 1),
    Color.fromRGBO(251, 47, 106, 1),
  ];
}
