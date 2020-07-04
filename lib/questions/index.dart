import 'package:never_have_i_ever/questions/typedef.dart';
import 'package:never_have_i_ever/questions/easy.dart';
import 'package:never_have_i_ever/questions/spicy.dart';
import 'package:never_have_i_ever/questions/hard.dart';
import 'package:never_have_i_ever/questions/extreme.dart';

Map<String, QuestionCategory> Questions = {
  "easy": easy,
  "spicy": spicy,
  "hard": hard,
  "extreme": extreme
};