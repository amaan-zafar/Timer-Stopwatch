part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  final AppThemeData themeData;
  const ThemeEvent(this.themeData);

  @override
  List<Object> get props => [themeData];
}

class ThemeChanged extends ThemeEvent {
  final AppThemeData themeData;

  ThemeChanged({@required this.themeData}) : super(themeData);
}
