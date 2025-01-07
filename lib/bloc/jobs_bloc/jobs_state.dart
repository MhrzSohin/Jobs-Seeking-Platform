import 'package:equatable/equatable.dart';
import 'package:loginvalidation/core/enums/enums.dart';
import 'package:loginvalidation/model/movies_model/jobs_model.dart';


class JobsState extends Equatable {
  final DataFetchingStatus jobsState;
  final List<JobsModel>? jobsRes;
  final String? message;
  final List<JobsModel>? tempjobsRes;

  JobsState(
      {this.jobsState = DataFetchingStatus.intial,
      this.jobsRes,
      this.message,
      this.tempjobsRes});

  JobsState copyWith(
      {DataFetchingStatus? jobsState,
      List<JobsModel>? jobsRes,
      String? message,
      String? searchMessage,
      List<JobsModel>? tempjobsRes}) {
    return JobsState(
        message: message ?? this.message,
        jobsRes: jobsRes ?? this.jobsRes,
        jobsState: jobsState ?? this.jobsState,
        tempjobsRes:
            tempjobsRes ?? this.tempjobsRes);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [jobsState, jobsRes, message, tempjobsRes];
}
