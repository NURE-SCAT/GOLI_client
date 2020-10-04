import 'dart:convert';
import './api_service.dart';
import '../models/vote.dart';

extension VoteService on ApiService {
  Future<List<Vote>> getAllQuizes() async {
    final result = await doGet("api/quizes/", headers, {}, 200);
    if (result != null) {
      final jsonData = json.decode(result) as List<dynamic>;
      final list = jsonData.map((e) => Vote.fromJson(e)).toList();

      for (var quiz in list) {
        final res = await getAllVotes(quiz.id);
        for (var r in res) {
          quiz.voteDetail.setUsersWhoVoted(r);
        }
      }

      return list;
    }

    return [];
  }

  Future<List<dynamic>> getAllVotes(int id) async {
    final result = await doGet("api/quizes/$id/votes/", headers, {}, 200);

    if (result != null) {
      return (json.decode(result) as List<dynamic>);
    }

    return [];
  }
}
