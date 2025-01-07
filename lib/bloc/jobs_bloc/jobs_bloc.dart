import 'package:bloc/bloc.dart';
import 'package:loginvalidation/bloc/jobs_bloc/jobs_events.dart';
import 'package:loginvalidation/bloc/jobs_bloc/jobs_state.dart';
import 'package:loginvalidation/core/enums/enums.dart';
import 'package:loginvalidation/model/movies_model/jobs_model.dart';
import 'package:loginvalidation/repository/jobs_repository.dart';


class JobsBloc extends Bloc<JobsEvents, JobsState> {
  List<JobsModel>? tempJobsResponse = <JobsModel>[];
  JobsRepository jobsRepository = JobsRepository();
  JobsBloc() : super(JobsState()) {
    on<JobsImageFetchingEvents>(_jobsImageFetchingEvents);
    on<JobsFilteringEvents>(_moviesFilteringEvents);
  }
  void _jobsImageFetchingEvents(
      JobsImageFetchingEvents events, Emitter<JobsState> emit) async {
    await jobsRepository.fetchJobsList().then((value) {
      emit(state.copyWith(
          jobsRes: value,
          message: "DataFetched Successfully",
          jobsState: DataFetchingStatus.success));
    }).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
        emit(state.copyWith(
          message: "Error Occurs While Fetching Data",
          jobsState: DataFetchingStatus.failure,
        ));
      },
    );
  }

  void _moviesFilteringEvents(
      JobsFilteringEvents events, Emitter<JobsState> emit) {
    tempJobsResponse = state.jobsRes
        ?.where((element) => element.title
            .toString()
            .toLowerCase()
            .contains(events.searchText.toLowerCase()))
        .toList();
    emit(state.copyWith(tempjobsRes: tempJobsResponse));
  }
}
