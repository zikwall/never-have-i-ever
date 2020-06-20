import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/card/card.dart';
import 'package:never_have_i_ever/widgets/card/custom_card.dart';
import 'package:never_have_i_ever/constants/colors.dart';

final HomeLevelsContent = <Widget> [
  Center(child: LevelCard(
    level: 'easy',
    description: 'легкие и не принужденные вопросы для разогрева',
    color: ColorConstants.AppColors['easy'],
  )),
  Center(child: LevelCard(
    level: 'spicy',
    description: 'становится интересней. более откровенные вопросы, которые помогут узнать друзей еще лучше',
    color: ColorConstants.AppColors['spicy'],
  )),
  Center(child: LevelCard(
    level: 'hard',
    description: 'начинается жара. откровенные вопросы, которые заставят покраснеть не один раз',
    color:  ColorConstants.AppColors['hard'],
  )),
  Center(child: LevelCard(
    level: 'extreme',
    description: 'самые горячие вопросы, которые позволят узнать самые пошлые секреты друзей',
    color:  ColorConstants.AppColors['extreme'],
  )),
  Center(child: CustomLevelCard(
    level: 'custom',
    description: 'начните свою собственную игру. создайте свой набор, добавляйте любые вопросы из любого пакета или же придумывайте новые',
    color:  ColorConstants.AppColors['custom'],
  )),
];