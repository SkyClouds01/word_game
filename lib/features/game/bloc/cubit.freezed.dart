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

 int get lives; List<List<PhraseCharacter>> get phraseCharacters; Map<String, KeyStatus> get keyboardStatus; int get activeWordIndex; int get activeLetterIndex;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.lives, lives) || other.lives == lives)&&const DeepCollectionEquality().equals(other.phraseCharacters, phraseCharacters)&&const DeepCollectionEquality().equals(other.keyboardStatus, keyboardStatus)&&(identical(other.activeWordIndex, activeWordIndex) || other.activeWordIndex == activeWordIndex)&&(identical(other.activeLetterIndex, activeLetterIndex) || other.activeLetterIndex == activeLetterIndex));
}


@override
int get hashCode => Object.hash(runtimeType,lives,const DeepCollectionEquality().hash(phraseCharacters),const DeepCollectionEquality().hash(keyboardStatus),activeWordIndex,activeLetterIndex);

@override
String toString() {
  return 'GameState(lives: $lives, phraseCharacters: $phraseCharacters, keyboardStatus: $keyboardStatus, activeWordIndex: $activeWordIndex, activeLetterIndex: $activeLetterIndex)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 int lives, List<List<PhraseCharacter>> phraseCharacters, Map<String, KeyStatus> keyboardStatus, int activeWordIndex, int activeLetterIndex
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
@pragma('vm:prefer-inline') @override $Res call({Object? lives = null,Object? phraseCharacters = null,Object? keyboardStatus = null,Object? activeWordIndex = null,Object? activeLetterIndex = null,}) {
  return _then(_self.copyWith(
lives: null == lives ? _self.lives : lives // ignore: cast_nullable_to_non_nullable
as int,phraseCharacters: null == phraseCharacters ? _self.phraseCharacters : phraseCharacters // ignore: cast_nullable_to_non_nullable
as List<List<PhraseCharacter>>,keyboardStatus: null == keyboardStatus ? _self.keyboardStatus : keyboardStatus // ignore: cast_nullable_to_non_nullable
as Map<String, KeyStatus>,activeWordIndex: null == activeWordIndex ? _self.activeWordIndex : activeWordIndex // ignore: cast_nullable_to_non_nullable
as int,activeLetterIndex: null == activeLetterIndex ? _self.activeLetterIndex : activeLetterIndex // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int lives,  List<List<PhraseCharacter>> phraseCharacters,  Map<String, KeyStatus> keyboardStatus,  int activeWordIndex,  int activeLetterIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.lives,_that.phraseCharacters,_that.keyboardStatus,_that.activeWordIndex,_that.activeLetterIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int lives,  List<List<PhraseCharacter>> phraseCharacters,  Map<String, KeyStatus> keyboardStatus,  int activeWordIndex,  int activeLetterIndex)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.lives,_that.phraseCharacters,_that.keyboardStatus,_that.activeWordIndex,_that.activeLetterIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int lives,  List<List<PhraseCharacter>> phraseCharacters,  Map<String, KeyStatus> keyboardStatus,  int activeWordIndex,  int activeLetterIndex)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.lives,_that.phraseCharacters,_that.keyboardStatus,_that.activeWordIndex,_that.activeLetterIndex);case _:
  return null;

}
}

}

/// @nodoc


class _GameState extends GameState {
  const _GameState({required this.lives, required final  List<List<PhraseCharacter>> phraseCharacters, required final  Map<String, KeyStatus> keyboardStatus, required this.activeWordIndex, required this.activeLetterIndex}): _phraseCharacters = phraseCharacters,_keyboardStatus = keyboardStatus,super._();
  

@override final  int lives;
 final  List<List<PhraseCharacter>> _phraseCharacters;
@override List<List<PhraseCharacter>> get phraseCharacters {
  if (_phraseCharacters is EqualUnmodifiableListView) return _phraseCharacters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phraseCharacters);
}

 final  Map<String, KeyStatus> _keyboardStatus;
@override Map<String, KeyStatus> get keyboardStatus {
  if (_keyboardStatus is EqualUnmodifiableMapView) return _keyboardStatus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_keyboardStatus);
}

@override final  int activeWordIndex;
@override final  int activeLetterIndex;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.lives, lives) || other.lives == lives)&&const DeepCollectionEquality().equals(other._phraseCharacters, _phraseCharacters)&&const DeepCollectionEquality().equals(other._keyboardStatus, _keyboardStatus)&&(identical(other.activeWordIndex, activeWordIndex) || other.activeWordIndex == activeWordIndex)&&(identical(other.activeLetterIndex, activeLetterIndex) || other.activeLetterIndex == activeLetterIndex));
}


@override
int get hashCode => Object.hash(runtimeType,lives,const DeepCollectionEquality().hash(_phraseCharacters),const DeepCollectionEquality().hash(_keyboardStatus),activeWordIndex,activeLetterIndex);

@override
String toString() {
  return 'GameState(lives: $lives, phraseCharacters: $phraseCharacters, keyboardStatus: $keyboardStatus, activeWordIndex: $activeWordIndex, activeLetterIndex: $activeLetterIndex)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 int lives, List<List<PhraseCharacter>> phraseCharacters, Map<String, KeyStatus> keyboardStatus, int activeWordIndex, int activeLetterIndex
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
@override @pragma('vm:prefer-inline') $Res call({Object? lives = null,Object? phraseCharacters = null,Object? keyboardStatus = null,Object? activeWordIndex = null,Object? activeLetterIndex = null,}) {
  return _then(_GameState(
lives: null == lives ? _self.lives : lives // ignore: cast_nullable_to_non_nullable
as int,phraseCharacters: null == phraseCharacters ? _self._phraseCharacters : phraseCharacters // ignore: cast_nullable_to_non_nullable
as List<List<PhraseCharacter>>,keyboardStatus: null == keyboardStatus ? _self._keyboardStatus : keyboardStatus // ignore: cast_nullable_to_non_nullable
as Map<String, KeyStatus>,activeWordIndex: null == activeWordIndex ? _self.activeWordIndex : activeWordIndex // ignore: cast_nullable_to_non_nullable
as int,activeLetterIndex: null == activeLetterIndex ? _self.activeLetterIndex : activeLetterIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$PhraseCharacter {

 String get value; String get guess; int get code;
/// Create a copy of PhraseCharacter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhraseCharacterCopyWith<PhraseCharacter> get copyWith => _$PhraseCharacterCopyWithImpl<PhraseCharacter>(this as PhraseCharacter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhraseCharacter&&(identical(other.value, value) || other.value == value)&&(identical(other.guess, guess) || other.guess == guess)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,value,guess,code);

@override
String toString() {
  return 'PhraseCharacter(value: $value, guess: $guess, code: $code)';
}


}

/// @nodoc
abstract mixin class $PhraseCharacterCopyWith<$Res>  {
  factory $PhraseCharacterCopyWith(PhraseCharacter value, $Res Function(PhraseCharacter) _then) = _$PhraseCharacterCopyWithImpl;
@useResult
$Res call({
 String value, String guess, int code
});




}
/// @nodoc
class _$PhraseCharacterCopyWithImpl<$Res>
    implements $PhraseCharacterCopyWith<$Res> {
  _$PhraseCharacterCopyWithImpl(this._self, this._then);

  final PhraseCharacter _self;
  final $Res Function(PhraseCharacter) _then;

/// Create a copy of PhraseCharacter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? guess = null,Object? code = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,guess: null == guess ? _self.guess : guess // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PhraseCharacter].
extension PhraseCharacterPatterns on PhraseCharacter {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String guess,  int code)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhraseCharacter() when $default != null:
return $default(_that.value,_that.guess,_that.code);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String guess,  int code)  $default,) {final _that = this;
switch (_that) {
case _PhraseCharacter():
return $default(_that.value,_that.guess,_that.code);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String guess,  int code)?  $default,) {final _that = this;
switch (_that) {
case _PhraseCharacter() when $default != null:
return $default(_that.value,_that.guess,_that.code);case _:
  return null;

}
}

}

/// @nodoc


class _PhraseCharacter extends PhraseCharacter {
  const _PhraseCharacter({required this.value, required this.guess, required this.code}): super._();
  

@override final  String value;
@override final  String guess;
@override final  int code;

/// Create a copy of PhraseCharacter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhraseCharacterCopyWith<_PhraseCharacter> get copyWith => __$PhraseCharacterCopyWithImpl<_PhraseCharacter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhraseCharacter&&(identical(other.value, value) || other.value == value)&&(identical(other.guess, guess) || other.guess == guess)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,value,guess,code);

@override
String toString() {
  return 'PhraseCharacter(value: $value, guess: $guess, code: $code)';
}


}

/// @nodoc
abstract mixin class _$PhraseCharacterCopyWith<$Res> implements $PhraseCharacterCopyWith<$Res> {
  factory _$PhraseCharacterCopyWith(_PhraseCharacter value, $Res Function(_PhraseCharacter) _then) = __$PhraseCharacterCopyWithImpl;
@override @useResult
$Res call({
 String value, String guess, int code
});




}
/// @nodoc
class __$PhraseCharacterCopyWithImpl<$Res>
    implements _$PhraseCharacterCopyWith<$Res> {
  __$PhraseCharacterCopyWithImpl(this._self, this._then);

  final _PhraseCharacter _self;
  final $Res Function(_PhraseCharacter) _then;

/// Create a copy of PhraseCharacter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? guess = null,Object? code = null,}) {
  return _then(_PhraseCharacter(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,guess: null == guess ? _self.guess : guess // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
