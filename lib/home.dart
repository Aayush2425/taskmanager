import 'package:flutter/material.dart';
import 'package:taskmanager/carousel.dart';
import 'package:taskmanager/calendar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  var name = ["Aayush", "Bhargav"];
  late TabController _tabController;
  var activeNavigation = "1";

  @override
  void initState() {
    super.initState();
    // Create a TabController with the length of the tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the TabController when the widget is disposed
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromRGBO(242, 245, 255, 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu_rounded, size: 40),
                      Icon(
                        Icons.person,
                        size: 40,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hello ${name[0]}!",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromRGBO(46, 58, 89, 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Have a nice day",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black38),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(

                      child: Container(
                        decoration: BoxDecoration(
                          color: _tabController.index == 0
                              ? Colors.white
                              : const Color.fromRGBO(229, 234, 252, 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "My Tasks",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Tab(

                      child: Container(
                        decoration: BoxDecoration(
                          color: _tabController.index == 1
                              ? Colors.white
                              : const Color.fromRGBO(229, 234, 252, 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "In-progress",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          color: _tabController.index == 2
                              ? Colors.white
                              : const Color.fromRGBO(229, 234, 252, 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Completed",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                  labelColor: const Color.fromRGBO(36, 39, 54, 1),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  unselectedLabelColor: const Color.fromRGBO(36, 39, 54, 1),
                  indicatorSize: TabBarIndicatorSize.label,

                  dividerHeight: 0,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            ComplicatedImageDemo(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 15),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Progress",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color.fromRGBO(46, 58, 89, 1),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Card(
                                  borderOnForeground: false,
                                  shadowColor: Colors.transparent,

                                  surfaceTintColor: Colors.white,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(
                                                      156, 44, 243, 1),
                                                  Color.fromRGBO(
                                                      58, 73, 249, 1),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: Image.asset(
                                            "assets/images/img_1.png",
                                            height: 30,
                                            width: 30,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Design Changes",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Color.fromRGBO(
                                                    46, 58, 89, 1),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "2 Days ago",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30.0),
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              Icons.menu_rounded,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Center(child: Text('Content for Tab 2')),
                      Center(child: Text('Content for Tab 3')),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(23.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            activeNavigation = "1";
                          });
                        },
                        child: Icon(
                          Icons.home_filled,
                          size: 40,
                          color: activeNavigation == '1'
                              ? const Color.fromRGBO(58, 73, 249, 1)
                              : const Color.fromRGBO(216, 222, 243, 1),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            activeNavigation = "2";
                          });
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Calendar(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.calendar_month_rounded,
                          size: 40,
                          color: activeNavigation == '2'
                              ? const Color.fromRGBO(58, 73, 249, 1)
                              : const Color.fromRGBO(216, 222, 243, 1),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            activeNavigation = "3";
                          });
                        },
                        child: Icon(
                          Icons.notifications,
                          size: 40,
                          color: activeNavigation == '3'
                              ? const Color.fromRGBO(58, 73, 249, 1)
                              : const Color.fromRGBO(216, 222, 243, 1),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            activeNavigation = "4";
                          });
                        },
                        child: Icon(
                          Icons.search_rounded,
                          size: 40,
                          color: activeNavigation == '4'
                              ? const Color.fromRGBO(58, 73, 249, 1)
                              : const Color.fromRGBO(216, 222, 243, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
