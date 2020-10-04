import 'dart:convert';
import './api_service.dart';
import '../models/vote.dart';

extension VoteService on ApiService {
  Future<List<Vote>> getAllQuizes() async {
    final result = await doGet("api/quizes/", headers, {}, 200);
    if (result != null) {
      final jsonData = json.decode(result);
      final list = (jsonData['results'] as List<dynamic>)
          .map((e) => Vote.fromJson(e))
          .toList();

      for (var quiz in list) {
        final res = await getAllVotes(quiz.id);
        for (var r in res) {
          quiz.voteDetail.setUsersWhoVoted(r);
        }
        quiz.recalculateProgress();
      }

      return list;
    }

    return [];
  }

  Future<List<dynamic>> getAllVotes(int id) async {
    final result = await doGet("api/quizes/$id/votes/", headers, {}, 200);

    if (result != null) {
      return (json.decode(result)['results'] as List<dynamic>);
    }

    return [];
  }

  Future<void> sendVote(int voteId, int choice, String userId) async {
    final data = json.encode({
      "quiz": voteId,
      "user": userId,
      "choice": choice,
    });

    final bool result =
        await doPost("api/quizes/$voteId/vote/", headers, data, 201)
            .then((value) => true)
            .catchError((e) => false);

    print(result);
  }
}
