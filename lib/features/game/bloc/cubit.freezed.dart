// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {

 String get completePhrase; List<String> get parsedPhrase; List<String> get encodedPhrase; Map<String, int> get letterToNumber; int get activeIndex;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.completePhrase, completePhrase) || other.completePhrase == completePhrase)&&const DeepCollectionEquality().equals(other.parsedPhrase, parsedPhrase)&&const DeepCollectionEquality().equals(other.encodedPhrase, encodedPhrase)&&const DeepCollectionEquality().equals(other.letterToNumber, letterToNumber)&&(identical(other.activeIndex, activeIndex) || other.activeIndex == activeIndex));
}


@override
int get hashCode => Object.hash(runtimeType,completePhrase,const DeepCollectionEquality().hash(parsedPhrase),const DeepCollectionEquality().hash(encodedPhrase),const DeepCollectionEquality().hash(letterToNumber),activeIndex);

@override
String toString() {
  return 'GameState(completePhrase: $completePhrase, parsedPhrase: $parsedPhrase, encodedPhrase: $encodedPhrase, letterToNumber: $letterToNumber, activeIndex: $activeIndex)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 String completePhrase, List<String> parsedPhrase, List<String> encodedPhrase, Map<String, int> letterToNumber, int activeIndex
});




}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completePhrase = null,Object? parsedPhrase = null,Object? encodedPhrase = null,Object? letterToNumber = null,Object? activeIndex = null,}) {
  return _then(_self.copyWith(
completePhrase: null == completePhrase ? _self.completePhrase : completePhrase // ignore: cast_nullable_to_non_nullable
as String,parsedPhrase: null == parsedPhrase ? _self.parsedPhrase : parsedPhrase // ignore: cast_nullable_to_non_nullable
as List<String>,encodedPhrase: null == encodedPhrase ? _self.encodedPhrase : encodedPhrase // ignore: cast_nullable_to_non_nullable
as List<String>,letterToNumber: null == letterToNumber ? _self.letterToNumber : letterToNumber // ignore: cast_nullable_to_non_nullable
as Map<String, int>,activeIndex: null == activeIndex ? _self.activeIndex : activeIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String completePhrase,  List<String> parsedPhrase,  List<String> encodedPhrase,  Map<String, int> letterToNumber,  int activeIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.completePhrase,_that.parsedPhrase,_that.encodedPhrase,_that.letterToNumber,_that.activeIndex);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String completePhrase,  List<String> parsedPhrase,  List<String> encodedPhrase,  Map<String, int> letterToNumber,  int activeIndex)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.completePhrase,_that.parsedPhrase,_that.encodedPhrase,_that.letterToNumber,_that.activeIndex);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String completePhrase,  List<String> parsedPhrase,  List<String> encodedPhrase,  Map<String, int> letterToNumber,  int activeIndex)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.completePhrase,_that.parsedPhrase,_that.encodedPhrase,_that.letterToNumber,_that.activeIndex);case _:
  return null;

}
}

}

/// @nodoc


class _GameState implements GameState {
  const _GameState({required this.completePhrase, required final  List<String> parsedPhrase, required final  List<String> encodedPhrase, required final  Map<String, int> letterToNumber, required this.activeIndex}): _parsedPhrase = parsedPhrase,_encodedPhrase = encodedPhrase,_letterToNumber = letterToNumber;
  

@override final  String completePhrase;
 final  List<String> _parsedPhrase;
@override List<String> get parsedPhrase {
  if (_parsedPhrase is EqualUnmodifiableListView) return _parsedPhrase;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_parsedPhrase);
}

 final  List<String> _encodedPhrase;
@override List<String> get encodedPhrase {
  if (_encodedPhrase is EqualUnmodifiableListView) return _encodedPhrase;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_encodedPhrase);
}

 final  Map<String, int> _letterToNumber;
@override Map<String, int> get letterToNumber {
  if (_letterToNumber is EqualUnmodifiableMapView) return _letterToNumber;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_letterToNumber);
}

@override final  int activeIndex;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.completePhrase, completePhrase) || other.completePhrase == completePhrase)&&const DeepCollectionEquality().equals(other._parsedPhrase, _parsedPhrase)&&const DeepCollectionEquality().equals(other._encodedPhrase, _encodedPhrase)&&const DeepCollectionEquality().equals(other._letterToNumber, _letterToNumber)&&(identical(other.activeIndex, activeIndex) || other.activeIndex == activeIndex));
}


@override
int get hashCode => Object.hash(runtimeType,completePhrase,const DeepCollectionEquality().hash(_parsedPhrase),const DeepCollectionEquality().hash(_encodedPhrase),const DeepCollectionEquality().hash(_letterToNumber),activeIndex);

@override
String toString() {
  return 'GameState(completePhrase: $completePhrase, parsedPhrase: $parsedPhrase, encodedPhrase: $encodedPhrase, letterToNumber: $letterToNumber, activeIndex: $activeIndex)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 String completePhrase, List<String> parsedPhrase, List<String> encodedPhrase, Map<String, int> letterToNumber, int activeIndex
});




}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completePhrase = null,Object? parsedPhrase = null,Object? encodedPhrase = null,Object? letterToNumber = null,Object? activeIndex = null,}) {
  return _then(_GameState(
completePhrase: null == completePhrase ? _self.completePhrase : completePhrase // ignore: cast_nullable_to_non_nullable
as String,parsedPhrase: null == parsedPhrase ? _self._parsedPhrase : parsedPhrase // ignore: cast_nullable_to_non_nullable
as List<String>,encodedPhrase: null == encodedPhrase ? _self._encodedPhrase : encodedPhrase // ignore: cast_nullable_to_non_nullable
as List<String>,letterToNumber: null == letterToNumber ? _self._letterToNumber : letterToNumber // ignore: cast_nullable_to_non_nullable
as Map<String, int>,activeIndex: null == activeIndex ? _self.activeIndex : activeIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
