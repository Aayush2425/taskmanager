import 'package:flutter/material.dart';
import 'dart:async';
import 'package:icons_plus/icons_plus.dart';
import 'package:taskmanager/home.dart';
import 'addtask.dart';
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
  var days = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];
  late List<String> daysOfWeek;
  late int currentDayIndex;
  DateTime currentDate = DateTime.now();
  int firstDayOfWeek = DateTime.daysPerWeek;
  var activeNavigation = "2";

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    initializeDaysOfWeek();
    updateDayIndexPeriodically();
  }

  void initializeDaysOfWeek() {
    // You can customize the day names based on your requirements
    daysOfWeek = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    currentDayIndex = DateTime.now().weekday - 1; // Adjust to start from Monday
  }

  void updateDayIndexPeriodically() {
    // Update the current day index every second
    Timer.periodic(Duration(days: 1), (timer) {
      setState(() {
        currentDayIndex = (currentDayIndex + 1) % 7;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: const Color.fromRGBO(242, 245, 255, 1),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(114, 92, 193, .15),
                        blurRadius: 44,
                        offset: Offset(0, -7),
                      ),
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, .02),
                        blurStyle: BlurStyle.solid,
                        blurRadius: 23,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(23.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_back_rounded,
                                size: 40,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(23.0),
                            child: Icon(
                              Icons.search_rounded,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(23.0),
                            child: Text(
                              "Oct, 2023",
                              style: TextStyle(
                                color: Color.fromRGBO(46, 58, 89, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(23.0),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(156, 44, 243, 1),
                                      Color.fromRGBO(58, 73, 249, 1),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AddTasks(),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Add Task",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 10),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                          child: TabBar(
                            controller: _tabController,
                            tabs: [
                              Tab(
                                  child: CustomList(
                                      "Mo", "${DateTime.now().day}")),
                              Tab(
                                  child: CustomList("Tu",
                                      "${DateTime.now().add(Duration(days: 1)).day}")),
                              Tab(
                                  child: CustomList("We",
                                      "${DateTime.now().add(Duration(days: 2)).day}")),
                              Tab(
                                  child: CustomList("Th",
                                      "${DateTime.now().add(Duration(days: 3)).day}")),
                              Tab(
                                  child: CustomList("Fr",
                                      "${DateTime.now().add(Duration(days: 4)).day}")),
                              Tab(
                                  child: CustomList("Sa",
                                      "${DateTime.now().add(Duration(days: 5)).day}")),
                              Tab(
                                  child: CustomList("Su",
                                      "${DateTime.now().add(Duration(days: 6)).day}")),
                            ],
                            indicator: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(156, 44, 243, .1),
                                  Color.fromRGBO(58, 73, 249, .1),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            unselectedLabelColor:
                                const Color.fromRGBO(36, 39, 54, 1),
                            padding: EdgeInsets.symmetric(vertical: 30),
                            indicatorSize: TabBarIndicatorSize.tab,
                            onTap: (index) {
                              // Handle tab changes if needed
                            },
                            dividerHeight: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 23.0, vertical: 5),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Tasks",
                      style: TextStyle(
                        color: Color.fromRGBO(46, 58, 89, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 23),
                            child: Card(
                              borderOnForeground: false,
                              shadowColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 15),
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(156, 44, 243, 1),
                                                Color.fromRGBO(58, 73, 249, 1),
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
                                              color:
                                                  Color.fromRGBO(46, 58, 89, 1),
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
                                            BoxIcons.bx_dots_vertical_rounded,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 4,
                      ),
                      Center(child: Text('Content for Tab 2')),
                      Center(child: Text('Content for Tab 2')),
                      Center(child: Text('Content for Tab 2')),
                      Center(child: Text('Content for Tab 2')),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ),
                          );
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
      );

  }
}

Widget CustomList(String day, String date) {
  return Container(
    child: Column(
      children: [
        Text(
          "$day",
          style: TextStyle(
            color: Color.fromRGBO(46, 58, 89, 1),
            fontSize: 10,
          ),
        ),
        Text(
          "$date",
          style: TextStyle(
              color: Color.fromRGBO(46, 58, 89, 1),
              fontSize: 10,
              fontWeight: FontWeight.w300),
        )
      ],
    ),
  );
}
