part of 'scan_bloc.dart';

@immutable
abstract class ScanState {}

abstract class ScanActionState extends ScanState {}

final class ScanInitial extends ScanState {}

class ScanLoadingState extends ScanState {}

class ScanSuccessState extends ScanState {}

class ScanErrorState extends ScanState {}

class ScanNavigateToState extends ScanActionState {}
