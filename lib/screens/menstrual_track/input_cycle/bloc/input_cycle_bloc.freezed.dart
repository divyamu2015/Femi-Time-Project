// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_cycle_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InputCycleEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputCycleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputCycleEvent()';
}


}

/// @nodoc
class $InputCycleEventCopyWith<$Res>  {
$InputCycleEventCopyWith(InputCycleEvent _, $Res Function(InputCycleEvent) __);
}


/// Adds pattern-matching-related methods to [InputCycleEvent].
extension InputCycleEventPatterns on InputCycleEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SaveInputCycle value)?  saveInputCycle,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveInputCycle() when saveInputCycle != null:
return saveInputCycle(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SaveInputCycle value)  saveInputCycle,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SaveInputCycle():
return saveInputCycle(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SaveInputCycle value)?  saveInputCycle,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SaveInputCycle() when saveInputCycle != null:
return saveInputCycle(_that);case _:
  return null;

}
}
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int userId,  String dayofperiod,  int duration,  int cycleLength,  String flowIntensity,  String symptoms,  String description)?  saveInputCycle,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveInputCycle() when saveInputCycle != null:
return saveInputCycle(_that.userId,_that.dayofperiod,_that.duration,_that.cycleLength,_that.flowIntensity,_that.symptoms,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int userId,  String dayofperiod,  int duration,  int cycleLength,  String flowIntensity,  String symptoms,  String description)  saveInputCycle,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SaveInputCycle():
return saveInputCycle(_that.userId,_that.dayofperiod,_that.duration,_that.cycleLength,_that.flowIntensity,_that.symptoms,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int userId,  String dayofperiod,  int duration,  int cycleLength,  String flowIntensity,  String symptoms,  String description)?  saveInputCycle,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SaveInputCycle() when saveInputCycle != null:
return saveInputCycle(_that.userId,_that.dayofperiod,_that.duration,_that.cycleLength,_that.flowIntensity,_that.symptoms,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements InputCycleEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputCycleEvent.started()';
}


}




/// @nodoc


class _SaveInputCycle implements InputCycleEvent {
  const _SaveInputCycle({required this.userId, required this.dayofperiod, required this.duration, required this.cycleLength, required this.flowIntensity, required this.symptoms, required this.description});
  

 final  int userId;
 final  String dayofperiod;
 final  int duration;
 final  int cycleLength;
 final  String flowIntensity;
 final  String symptoms;
 final  String description;

/// Create a copy of InputCycleEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaveInputCycleCopyWith<_SaveInputCycle> get copyWith => __$SaveInputCycleCopyWithImpl<_SaveInputCycle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaveInputCycle&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.dayofperiod, dayofperiod) || other.dayofperiod == dayofperiod)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.cycleLength, cycleLength) || other.cycleLength == cycleLength)&&(identical(other.flowIntensity, flowIntensity) || other.flowIntensity == flowIntensity)&&(identical(other.symptoms, symptoms) || other.symptoms == symptoms)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,userId,dayofperiod,duration,cycleLength,flowIntensity,symptoms,description);

@override
String toString() {
  return 'InputCycleEvent.saveInputCycle(userId: $userId, dayofperiod: $dayofperiod, duration: $duration, cycleLength: $cycleLength, flowIntensity: $flowIntensity, symptoms: $symptoms, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SaveInputCycleCopyWith<$Res> implements $InputCycleEventCopyWith<$Res> {
  factory _$SaveInputCycleCopyWith(_SaveInputCycle value, $Res Function(_SaveInputCycle) _then) = __$SaveInputCycleCopyWithImpl;
@useResult
$Res call({
 int userId, String dayofperiod, int duration, int cycleLength, String flowIntensity, String symptoms, String description
});




}
/// @nodoc
class __$SaveInputCycleCopyWithImpl<$Res>
    implements _$SaveInputCycleCopyWith<$Res> {
  __$SaveInputCycleCopyWithImpl(this._self, this._then);

  final _SaveInputCycle _self;
  final $Res Function(_SaveInputCycle) _then;

/// Create a copy of InputCycleEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? dayofperiod = null,Object? duration = null,Object? cycleLength = null,Object? flowIntensity = null,Object? symptoms = null,Object? description = null,}) {
  return _then(_SaveInputCycle(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,dayofperiod: null == dayofperiod ? _self.dayofperiod : dayofperiod // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,cycleLength: null == cycleLength ? _self.cycleLength : cycleLength // ignore: cast_nullable_to_non_nullable
as int,flowIntensity: null == flowIntensity ? _self.flowIntensity : flowIntensity // ignore: cast_nullable_to_non_nullable
as String,symptoms: null == symptoms ? _self.symptoms : symptoms // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$InputCycleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputCycleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputCycleState()';
}


}

/// @nodoc
class $InputCycleStateCopyWith<$Res>  {
$InputCycleStateCopyWith(InputCycleState _, $Res Function(InputCycleState) __);
}


/// Adds pattern-matching-related methods to [InputCycleState].
extension InputCycleStatePatterns on InputCycleState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Error():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Error() when error != null:
return error(_that);case _:
  return null;

}
}
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PeriodInputCycle response)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.response);case _Error() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PeriodInputCycle response)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.response);case _Error():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PeriodInputCycle response)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.response);case _Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements InputCycleState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputCycleState.initial()';
}


}




/// @nodoc


class _Loading implements InputCycleState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputCycleState.loading()';
}


}




/// @nodoc


class _Success implements InputCycleState {
  const _Success({required this.response});
  

 final  PeriodInputCycle response;

/// Create a copy of InputCycleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'InputCycleState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $InputCycleStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 PeriodInputCycle response
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of InputCycleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_Success(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as PeriodInputCycle,
  ));
}


}

/// @nodoc


class _Error implements InputCycleState {
  const _Error({required this.error});
  

 final  String error;

/// Create a copy of InputCycleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'InputCycleState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $InputCycleStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of InputCycleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_Error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
