import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskmanager/calendar.dart';

import 'home.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  final DateFormat _dateFormat = DateFormat('MMMM d, yyyy');

  TimeOfDay selectedTime = TimeOfDay.now();
  final DateFormat _timeFormat = DateFormat('hh:mm a');

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(156, 44, 243, 1),
                    Color.fromRGBO(58, 73, 249, 1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 200.0,
                      height: 210.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.elliptical(432, 500),
                        ),
                        color: Color.fromRGBO(46, 58, 89, .15),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 200.0,
                      height: 210.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(410, 492),
                        ),
                        color: Color.fromRGBO(46, 58, 89, .15),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
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
                                      builder: (context) => Calendar(),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              "Create a Task",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(23.0),
                              child: Icon(
                                Icons.search_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 23),
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                              labelText: "Name",
                              alignLabelWithHint: true,
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              hintText: "xyz@gmail.com",
                              hintStyle: TextStyle(color: Colors.white60),
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius:
                              //       BorderRadius.all(Radius.circular(10)),
                              //   borderSide:
                              //       BorderSide(color: Colors.white, width: 2),
                              // ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 23),
                          child: TextField(
                            onTap: () => _selectDate(context),
                            controller: dateController,
                            decoration: InputDecoration(
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 20),
                              labelText: "Date",
                              alignLabelWithHint: true,
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              hintText: _dateFormat.format(selectedDate),
                              hintStyle: TextStyle(color: Colors.white60),
                              // enabledBorder: OutlineInputBorder(
                              //   borderRadius:
                              //       BorderRadius.all(Radius.circular(10)),
                              //   borderSide:
                              //       BorderSide(color: Colors.white, width: 2),
                              // ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .25),
                      blurRadius: 34,
                      offset: Offset(0, -9),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start Time",
                                style: TextStyle(
                                    color: Color.fromRGBO(191, 200, 232, 1),
                                    fontSize: 15),
                              ),
                              Text(
                                _timeFormat.format(DateTime(2022, 1, 1,
                                    selectedTime.hour, selectedTime.minute)),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(46, 58, 89, 1),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "End Time",
                                style: TextStyle(
                                    color: Color.fromRGBO(191, 200, 232, 1),
                                    fontSize: 15),
                              ),
                              Text(
                                _timeFormat.format(DateTime(2022, 1, 1,
                                    selectedTime.hour, selectedTime.minute)),
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(46, 58, 89, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: Container(
                        color: Color.fromRGBO(191, 200, 232, 1),
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 45, right: 45),
                      child: TextField(
                        controller: descriptionController,
                        maxLines: null,
                        // Set to null or a value greater than 1 for multiline input
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          labelText: "Description",
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(
                              color: Color.fromRGBO(191, 200, 232, 1),
                              fontSize: 20),
                          hintText: "xyz@gmail.com",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(191, 200, 232, 1),
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.white60),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              "Category",
                              style: TextStyle(
                                  color: Color.fromRGBO(191, 200, 232, 1),
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                        margin: EdgeInsets.all(5),
                                        decoration:BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color.fromRGBO(156, 44, 243,1),
                                              Color.fromRGBO(58, 73,249,1)
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                        child: Text(
                                          "Design",
                                          style: TextStyle(fontSize: 15,color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                        margin: EdgeInsets.all(5),

                                        decoration:BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(156, 44, 243,1),
                                                  Color.fromRGBO(58, 73,249,1)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                        child: Text(
                                          "Design",
                                          style: TextStyle(fontSize: 15,color: Colors.white),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                        margin: EdgeInsets.all(5),

                                        decoration:BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(156, 44, 243,1),
                                                  Color.fromRGBO(58, 73,249,1)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                        child: Text(
                                          "Design",
                                          style: TextStyle(fontSize: 15,color: Colors.white),
                                        ),
                                      ),

                                      Container(
                                        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                        margin: EdgeInsets.all(5),

                                        decoration:BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(156, 44, 243,1),
                                                  Color.fromRGBO(58, 73,249,1)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                        child: Text(
                                          "Design",
                                          style: TextStyle(fontSize: 15,color: Colors.white),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                        margin: EdgeInsets.all(5),

                                        decoration:BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(156, 44, 243,1),
                                                  Color.fromRGBO(58, 73,249,1)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                        child: Text(
                                          "Design",
                                          style: TextStyle(fontSize: 15,color: Colors.white),
                                        ),
                                      ),

                                      Container(
                                        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                                        margin: EdgeInsets.all(5),

                                        decoration:BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(156, 44, 243,1),
                                                  Color.fromRGBO(58, 73,249,1)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(40))
                                        ),
                                        child: Text(
                                          "Design",
                                          style: TextStyle(fontSize: 15,color: Colors.white),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 60,vertical: 10),
                        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(156, 44, 243, 1),
                                Color.fromRGBO(58, 73, 249, 1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: const Text('Search Flights',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
