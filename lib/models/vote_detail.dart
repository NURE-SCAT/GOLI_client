class VoteDetail {
  double option1 = 0;
  double option2 = 0;
  double option3 = 0;
  double option4 = 0;

  String definition1 = 'Cairo';
  String definition2 = 'Mecca';
  String definition3 = 'Denmark';
  String definition4 = 'Mogadishu';

  Map<dynamic, dynamic> usersWhoVoted = {};
  String user = "balik_mem";
  String creator = "stepa";

  VoteDetail();

  VoteDetail.fromJson(Map<String, dynamic> json)
      : definition1 = json['definition1'],
        definition2 = json['definition2'],
        definition3 = json['definition3'],
        definition4 = json['definition4'];

  void setUsersWhoVoted(Map<String, dynamic> json) {
    int choice = json['choice'];
    String curUser = json['user'];

    usersWhoVoted[curUser] = choice;

    switch (choice) {
      case 1:
        option1 += 1;
        break;
      case 2:
        option2 += 1;
        break;
      case 3:
        option3 += 1;
        break;
      case 4:
        option4 += 1;
        break;
      default:
    }
  }
}
