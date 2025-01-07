import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginvalidation/bloc/jobs_bloc/jobs_events.dart';
import 'package:loginvalidation/bloc/jobs_bloc/jobs_bloc.dart';
import 'package:loginvalidation/bloc/jobs_bloc/jobs_state.dart';
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
      appBar: AppBar(
        title: Text("Jobs Application"),
      ),
      body: BlocBuilder<JobsBloc, JobsState>(
        builder: (context, state) {
          switch (state.jobsState) {
            case DataFetchingStatus.intial:
              break;
            case DataFetchingStatus.loading:
              return Center(child: CircularProgressIndicator());

            case DataFetchingStatus.success:
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        BlocProvider.of<JobsBloc>(context)
                            .add(JobsFilteringEvents(value));
                      },
                      decoration: InputDecoration(
                          hintText: "Enter the jobs name ",
                          border: OutlineInputBorder()),
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
                                    childrenPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    shape: const Border(),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons
                                            .supervised_user_circle_rounded),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Title : ${items?.title}",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.message),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Description : ${items?.description}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Company : ${items?.company}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                  "Location : ${items?.location}",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.grey)),
                                              Text(
                                                "Contact : ${items?.contact}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "Salary From : ${items?.salaryFrom.toString()}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "Salary To : ${items?.salaryTo.toString()}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "Application Deadline : ${items?.applicationDeadline}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "Qualification : ${items?.qualifications}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "No. of Openings : ${items?.numberOfOpening.toString()}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                            ],
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
                                    childrenPadding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    shape: const Border(),
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons
                                            .supervised_user_circle_rounded),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Title : ${items?.title}",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.message),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Description : ${items?.description}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Company : ${items?.company}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                  "Location : ${items?.location}",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.grey)),
                                              Text(
                                                "Contact : ${items?.contact}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "Salary From : ${items?.salaryFrom.toString()}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "Salary To : ${items?.salaryTo.toString()}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "Application Deadline : ${items?.applicationDeadline}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "Qualification : ${items?.qualifications}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "No. of Openings : ${items?.numberOfOpening.toString()}",
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey),
                                              ),
                                            ],
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
              );

            case DataFetchingStatus.failure:
              return Center(child: Text(state.message.toString()));
          }
          return SizedBox();
        },
      ),
    );
  }
}
