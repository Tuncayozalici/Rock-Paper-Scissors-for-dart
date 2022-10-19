import 'dart:io';
import 'dart:math';

enum situation { Rock, Paper, Scissors }

enum situation2 { Rock, Paper, Scissors }

List<int> scores = [playerScore, computerScore];

bool game = true;

int computerScore = 0;
int playerScore = 0;

void main() {
  print("Game has started.Please Select Your Move");
  print("Moves:Rock,Paper,Scissors");

  while (game) {
    try {
      String _playerMove = situationSelection();
      String _computerMove = Computer_situationSelection();
      List myList = Whowon(_computerMove, _playerMove);
      if (myList[0] == 3 || myList[1] == 3) {
        if (myList[0] == 3) {
          print("Player Win");
        } else if (myList[1] == 3) {
          print("Computer Win");
        }

        game = false;
      }
      print(myList[1]);
      print(myList[0]);
    } catch (error) {
      print("Please write only rock paper or scissors");
    }
  }
  print('Game over');
}

String situationSelection() {
  final Player_chose = stdin.readLineSync()!.trim();
  String Player_Move = "";
  if (Player_chose == 'Rock') {
    Player_Move = situation.Rock.toString().split('.').last;
    print("your move has been updated to rock.");
  } else if (Player_chose == 'Paper') {
    Player_Move = situation.Paper.toString().split('.').last;
    print("your move has been updated to paper.");
  } else if (Player_chose == 'Scissors') {
    Player_Move = situation.Scissors.toString().split('.').last;
    print("your move has been updated to scissors");
  } else if (Player_chose != 'Rock' 'Scisssors' 'Paper') {
    print("Please write only Rock,Paper or Scissors");
  } else
    () {
      throw 'hata oluştu';
    };
  return Player_Move;
}

String Computer_situationSelection() {
  Random r = new Random();
  int Computer_num = r.nextInt(3);
  String Computer_Move = " ";
  if (Computer_num == 0) {
    Computer_Move = situation.Rock.toString().split('.').last;
    print("computer move updated to rock.");
  } else if (Computer_num == 1) {
    Computer_Move = situation.Paper.toString().split('.').last;
    print("computer move updated to paper.");
  }
  if (Computer_num == 2) {
    Computer_Move = situation.Scissors.toString().split('.').last;
    print("computer move updated to scissors.");
  }
  return Computer_Move;
}

List Whowon(String computerMove, String playerMove) {
  if (playerMove == computerMove) {
    print("scoreless");
  } else if (playerMove == "Rock" && computerMove == "Scissors") {
    print("player earned +1 point");
    scores[0]++;
  } else if (playerMove == "Scissors" && computerMove == "Rock") {
    print("computer earned +1 point");
    scores[1]++;
  } else if (playerMove == "Paper" && computerMove == "Scissors") {
    print("computer earned +1 point");
    scores[1]++;
  } else if (playerMove == "Scissors" && computerMove == "Paper") {
    print("player earned +1 point");
    scores[0]++;
  } else if (playerMove == "Rock" && computerMove == "Paper") {
    print("computer earned +1 point");
    scores[1]++;
  } else if (playerMove == "Paper" && computerMove == "Rock") {
    print("player earned +1 point");
    scores[0]++;
  }
  return [scores[0], scores[1]];
}
