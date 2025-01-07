import 'package:equatable/equatable.dart';

abstract class JobsEvents extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class JobsImageFetchingEvents extends JobsEvents {}

class JobsFilteringEvents extends JobsEvents {
  final String searchText;
  JobsFilteringEvents(this.searchText);
}
