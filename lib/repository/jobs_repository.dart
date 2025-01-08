import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:loginvalidation/model/movies_model/jobs_model.dart';
// import 'package:movie_application/model/moviemodel.dart';

// class MovieRepository {
//   Future<List<MoviesModel>> fetchMovies() async {
//     final response =
//         await http.get(Uri.parse('https://freetestapi.com/api/v1/movies'));
//     if (response.statusCode == 200) {
//       final body = json.decode(response.body) as List;
//       return body.map((e) {
//         return MoviesModel(
//           poster: e['poster'] as String,
//           title: e['title'] as String,
//         );
//       }).toList();
//     }
//     throw Exception("Exception occurs");
//   }
// }

// class MovieRepository {
//   Future<MovieModel> fetchMovies() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://moviesapi.ir/api/v1/movies?page=20'));
//       if (response.statusCode == 200) {
//         return movieModelFromJson(response.body);
//       }
//     } on TimeoutException {
//       throw Exception("Exception occurs");
//     }
//     throw Exception("Exception occurs");
//   }
// }
class JobsRepository {
  Future<List<JobsModel>> fetchJobsList() async {
    try {
      final response = await http.get(Uri.parse('https://jsonfakery.com/jobs'));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return JobsModel(
            description: e['description'] as String,
            title: e['title'] as String,
            location: e['location'] as String,
            contact: e['contact'] as String,
            salaryFrom: e['salary_from'] as int,
            salaryTo: e['salary_to'] as int,
            company: e['company'] as String,
            applicationDeadline: e['application_deadline'] as String,
            qualifications: e['qualifications'] as String,
            numberOfOpening: e['number_of_opening'] as int,
          );
        }).toList();
      }
    } on TimeoutException {
      throw Exception("Exception occurs");
    }
    throw Exception("Exception occurs");
  }
}
