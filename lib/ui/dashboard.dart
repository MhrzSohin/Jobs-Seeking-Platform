import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginvalidation/bloc/jobs_bloc/jobs_events.dart';
import 'package:loginvalidation/bloc/jobs_bloc/jobs_bloc.dart';
import 'package:loginvalidation/bloc/jobs_bloc/jobs_state.dart';
import 'package:loginvalidation/core/color/pallette.dart';
import 'package:loginvalidation/core/constants/assets_path.dart';
import 'package:loginvalidation/core/enums/enums.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<JobsBloc>(context).add(JobsImageFetchingEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 100, 126, 219),
      appBar: AppBar(
        backgroundColor: Pallette.primary,
        title: Center(
          child: Text(
            "Jobs Application",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: BlocBuilder<JobsBloc, JobsState>(
        builder: (context, state) {
          switch (state.jobsState) {
            case DataFetchingStatus.intial:
              return Center(child: CircularProgressIndicator());
            case DataFetchingStatus.loading:
              return Center(child: CircularProgressIndicator());
            case DataFetchingStatus.success:
              return DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 168, 190, 201)
                    // image: DecorationImage(
                    //     image: AssetImage(AssetsPath.backGroundImage1),
                    //     fit: BoxFit.cover),
                    ),
                child: Container(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          onChanged: (value) {
                            BlocProvider.of<JobsBloc>(context)
                                .add(JobsFilteringEvents(value));
                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: Pallette.textFormfeilBackground,
                              hintText: "Search for jobs....",
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: state.tempjobsRes == null
                                  ? state.jobsRes?.length
                                  : state.tempjobsRes?.length,
                              itemBuilder: (context, index) {
                                if (state.tempjobsRes == null) {
                                  final items = state.jobsRes?[index];
                                  return Card(
                                    elevation: 4,
                                    child: ExpansionTile(
                                      childrenPadding: EdgeInsets.all(10),
                                      shape: const Border(),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons
                                              .supervised_user_circle_rounded),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Text(
                                              "Title : ${items?.title}",
                                              // softWrap: true,
                                              // maxLines: 0,
                                              // overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.2),
                                            ),
                                          ),
                                        ],
                                      ),
                                      subtitle: Container(
                                        margin: EdgeInsets.only(top: 9),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.message),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Text(
                                                "Description : ${items?.description}",
                                                // softWrap: true,
                                                // maxLines: 3,
                                                // overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.5),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 30),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "More Details :",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      "Company : ${items?.company}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                        "Location : ${items?.location}",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.black)),
                                                    Text(
                                                      "Contact : ${items?.contact}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Salary From : ${items?.salaryFrom.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Salary To : ${items?.salaryTo.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Application Deadline : ${items?.applicationDeadline}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Qualification : ${items?.qualifications}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "No. of Openings : ${items?.numberOfOpening.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                } else {
                                  final items = state.tempjobsRes?[index];
                                  return Card(
                                    elevation: 4,
                                    child: ExpansionTile(
                                      childrenPadding: EdgeInsets.all(10),
                                      shape: const Border(),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons
                                              .supervised_user_circle_rounded),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Text(
                                              "Title : ${items?.title}",
                                              // softWrap: true,
                                              // maxLines: 0,
                                              // overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(Icons.message),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Text(
                                              "Description : ${items?.description}",
                                              // softWrap: true,
                                              // maxLines: 3,
                                              // overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          )
                                        ],
                                      ),
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 30),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "More Details :",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      "Company : ${items?.company}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                        "Location : ${items?.location}",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Colors.black)),
                                                    Text(
                                                      "Contact : ${items?.contact}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Salary From : ${items?.salaryFrom.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Salary To : ${items?.salaryTo.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Application Deadline : ${items?.applicationDeadline}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "Qualification : ${items?.qualifications}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                    Text(
                                                      "No. of Openings : ${items?.numberOfOpening.toString()}",
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }
                              }))
                    ],
                  ),
                ),
              );

            case DataFetchingStatus.failure:
              return Center(child: Text(state.message.toString()));
          }
        },
      ),
    );
  }
}
