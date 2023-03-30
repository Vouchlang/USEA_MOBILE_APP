import 'package:flutter/material.dart';
import '../Guest_Dashboard/Program/Program_Score_Main.dart';

class Program_Bachelor_Year {
  late final String name;
  late final Widget screen;

  Program_Bachelor_Year({required this.name, required this.screen});
}

List<Program_Bachelor_Year> pro_bach_year = [
  Program_Bachelor_Year(name: 'ឆ្នាំទី១', screen: Program_Score_Main()),
  Program_Bachelor_Year(name: 'ឆ្នាំទី២', screen: Program_Score_Main()),
  Program_Bachelor_Year(name: 'ឆ្នាំទី៣', screen: Program_Score_Main()),
  Program_Bachelor_Year(name: 'ឆ្នាំទី៤', screen: Program_Score_Main())
];
