import 'package:gym_app/shared/models/user_abstract.dart';
import 'package:gym_app/shared/models/user_trainer.dart';

class UserAdm extends AbstractUser {
  String? gymName;
  String? gymLogoImg;

  // Lista de ids dos treinadores (API)
  List<int>? listTrainerIds;

  // Lista dos Treinadores
  List<UserTrainer>? listUserTrainers;
}
