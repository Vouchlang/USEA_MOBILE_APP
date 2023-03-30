import 'package:flutter/material.dart';
import '../Guest_Dashboard/Program/Program_Score_Main.dart';

class Program_Associate_Year {
  late final String name;
  late final Widget screen;

  Program_Associate_Year({required this.name, required this.screen});
}

List<Program_Associate_Year> pro_asso_year = [
  Program_Associate_Year(name: 'ឆ្នាំទី១', screen: Program_Score_Main()),
  Program_Associate_Year(name: 'ឆ្នាំទី២', screen: Program_Score_Main()),
];
