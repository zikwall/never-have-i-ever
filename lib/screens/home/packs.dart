import 'package:flutter/material.dart';
import 'package:never_have_i_ever/widgets/pack/pack.dart';
import 'package:never_have_i_ever/widgets/pack/pack_custom.dart';
import 'package:never_have_i_ever/constants/colors.dart';

final Packs = <Widget> [
  Center(child: AppPack(
    level: 'easy',
    description: 'легкие и не принужденные вопросы для разогрева',
    color: ColorConstants.AppColors['easy'],
  )),
  Center(child: AppPack(
    level: 'spicy',
    description: 'становится интересней. более откровенные вопросы, которые помогут узнать друзей еще лучше',
    color: ColorConstants.AppColors['spicy'],
  )),
  Center(child: AppPack(
    level: 'hard',
    description: 'начинается жара. откровенные вопросы, которые заставят покраснеть не один раз',
    color:  ColorConstants.AppColors['hard'],
  )),
  Center(child: AppPack(
    level: 'extreme',
    description: 'самые горячие вопросы, которые позволят узнать самые пошлые секреты друзей',
    color:  ColorConstants.AppColors['extreme'],
  )),
  Center(child: AppPackCustom(
    level: 'custom',
    description: 'начните свою собственную игру. создайте свой набор, добавляйте любые вопросы из любого пакета или же придумывайте новые',
    color:  ColorConstants.AppColors['custom'],
  )),
];