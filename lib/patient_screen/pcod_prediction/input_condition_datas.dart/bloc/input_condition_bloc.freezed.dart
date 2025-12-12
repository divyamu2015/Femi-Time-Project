// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_condition_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InputConditionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputConditionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputConditionEvent()';
}


}

/// @nodoc
class $InputConditionEventCopyWith<$Res>  {
$InputConditionEventCopyWith(InputConditionEvent _, $Res Function(InputConditionEvent) __);
}


/// Adds pattern-matching-related methods to [InputConditionEvent].
extension InputConditionEventPatterns on InputConditionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _PcodInputDetails value)?  pcodInputDetails,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PcodInputDetails() when pcodInputDetails != null:
return pcodInputDetails(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _PcodInputDetails value)  pcodInputDetails,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _PcodInputDetails():
return pcodInputDetails(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _PcodInputDetails value)?  pcodInputDetails,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PcodInputDetails() when pcodInputDetails != null:
return pcodInputDetails(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( int userId,  int age,  double weight,  double height,  double bmi,  int fastFoodConsumption,  String bloodGroup,  double pulseRate,  int cycleRegularity,  int hairGrowth,  int acne,  int moodSwings,  int skinDarkening,  File pdfFile)?  pcodInputDetails,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PcodInputDetails() when pcodInputDetails != null:
return pcodInputDetails(_that.userId,_that.age,_that.weight,_that.height,_that.bmi,_that.fastFoodConsumption,_that.bloodGroup,_that.pulseRate,_that.cycleRegularity,_that.hairGrowth,_that.acne,_that.moodSwings,_that.skinDarkening,_that.pdfFile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( int userId,  int age,  double weight,  double height,  double bmi,  int fastFoodConsumption,  String bloodGroup,  double pulseRate,  int cycleRegularity,  int hairGrowth,  int acne,  int moodSwings,  int skinDarkening,  File pdfFile)  pcodInputDetails,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _PcodInputDetails():
return pcodInputDetails(_that.userId,_that.age,_that.weight,_that.height,_that.bmi,_that.fastFoodConsumption,_that.bloodGroup,_that.pulseRate,_that.cycleRegularity,_that.hairGrowth,_that.acne,_that.moodSwings,_that.skinDarkening,_that.pdfFile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( int userId,  int age,  double weight,  double height,  double bmi,  int fastFoodConsumption,  String bloodGroup,  double pulseRate,  int cycleRegularity,  int hairGrowth,  int acne,  int moodSwings,  int skinDarkening,  File pdfFile)?  pcodInputDetails,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PcodInputDetails() when pcodInputDetails != null:
return pcodInputDetails(_that.userId,_that.age,_that.weight,_that.height,_that.bmi,_that.fastFoodConsumption,_that.bloodGroup,_that.pulseRate,_that.cycleRegularity,_that.hairGrowth,_that.acne,_that.moodSwings,_that.skinDarkening,_that.pdfFile);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements InputConditionEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputConditionEvent.started()';
}


}




/// @nodoc


class _PcodInputDetails implements InputConditionEvent {
  const _PcodInputDetails({required this.userId, required this.age, required this.weight, required this.height, required this.bmi, required this.fastFoodConsumption, required this.bloodGroup, required this.pulseRate, required this.cycleRegularity, required this.hairGrowth, required this.acne, required this.moodSwings, required this.skinDarkening, required this.pdfFile});
  

 final  int userId;
 final  int age;
 final  double weight;
 final  double height;
 final  double bmi;
 final  int fastFoodConsumption;
 final  String bloodGroup;
 final  double pulseRate;
 final  int cycleRegularity;
 final  int hairGrowth;
 final  int acne;
 final  int moodSwings;
 final  int skinDarkening;
 final  File pdfFile;

/// Create a copy of InputConditionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PcodInputDetailsCopyWith<_PcodInputDetails> get copyWith => __$PcodInputDetailsCopyWithImpl<_PcodInputDetails>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PcodInputDetails&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.age, age) || other.age == age)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.height, height) || other.height == height)&&(identical(other.bmi, bmi) || other.bmi == bmi)&&(identical(other.fastFoodConsumption, fastFoodConsumption) || other.fastFoodConsumption == fastFoodConsumption)&&(identical(other.bloodGroup, bloodGroup) || other.bloodGroup == bloodGroup)&&(identical(other.pulseRate, pulseRate) || other.pulseRate == pulseRate)&&(identical(other.cycleRegularity, cycleRegularity) || other.cycleRegularity == cycleRegularity)&&(identical(other.hairGrowth, hairGrowth) || other.hairGrowth == hairGrowth)&&(identical(other.acne, acne) || other.acne == acne)&&(identical(other.moodSwings, moodSwings) || other.moodSwings == moodSwings)&&(identical(other.skinDarkening, skinDarkening) || other.skinDarkening == skinDarkening)&&(identical(other.pdfFile, pdfFile) || other.pdfFile == pdfFile));
}


@override
int get hashCode => Object.hash(runtimeType,userId,age,weight,height,bmi,fastFoodConsumption,bloodGroup,pulseRate,cycleRegularity,hairGrowth,acne,moodSwings,skinDarkening,pdfFile);

@override
String toString() {
  return 'InputConditionEvent.pcodInputDetails(userId: $userId, age: $age, weight: $weight, height: $height, bmi: $bmi, fastFoodConsumption: $fastFoodConsumption, bloodGroup: $bloodGroup, pulseRate: $pulseRate, cycleRegularity: $cycleRegularity, hairGrowth: $hairGrowth, acne: $acne, moodSwings: $moodSwings, skinDarkening: $skinDarkening, pdfFile: $pdfFile)';
}


}

/// @nodoc
abstract mixin class _$PcodInputDetailsCopyWith<$Res> implements $InputConditionEventCopyWith<$Res> {
  factory _$PcodInputDetailsCopyWith(_PcodInputDetails value, $Res Function(_PcodInputDetails) _then) = __$PcodInputDetailsCopyWithImpl;
@useResult
$Res call({
 int userId, int age, double weight, double height, double bmi, int fastFoodConsumption, String bloodGroup, double pulseRate, int cycleRegularity, int hairGrowth, int acne, int moodSwings, int skinDarkening, File pdfFile
});




}
/// @nodoc
class __$PcodInputDetailsCopyWithImpl<$Res>
    implements _$PcodInputDetailsCopyWith<$Res> {
  __$PcodInputDetailsCopyWithImpl(this._self, this._then);

  final _PcodInputDetails _self;
  final $Res Function(_PcodInputDetails) _then;

/// Create a copy of InputConditionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? age = null,Object? weight = null,Object? height = null,Object? bmi = null,Object? fastFoodConsumption = null,Object? bloodGroup = null,Object? pulseRate = null,Object? cycleRegularity = null,Object? hairGrowth = null,Object? acne = null,Object? moodSwings = null,Object? skinDarkening = null,Object? pdfFile = null,}) {
  return _then(_PcodInputDetails(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,bmi: null == bmi ? _self.bmi : bmi // ignore: cast_nullable_to_non_nullable
as double,fastFoodConsumption: null == fastFoodConsumption ? _self.fastFoodConsumption : fastFoodConsumption // ignore: cast_nullable_to_non_nullable
as int,bloodGroup: null == bloodGroup ? _self.bloodGroup : bloodGroup // ignore: cast_nullable_to_non_nullable
as String,pulseRate: null == pulseRate ? _self.pulseRate : pulseRate // ignore: cast_nullable_to_non_nullable
as double,cycleRegularity: null == cycleRegularity ? _self.cycleRegularity : cycleRegularity // ignore: cast_nullable_to_non_nullable
as int,hairGrowth: null == hairGrowth ? _self.hairGrowth : hairGrowth // ignore: cast_nullable_to_non_nullable
as int,acne: null == acne ? _self.acne : acne // ignore: cast_nullable_to_non_nullable
as int,moodSwings: null == moodSwings ? _self.moodSwings : moodSwings // ignore: cast_nullable_to_non_nullable
as int,skinDarkening: null == skinDarkening ? _self.skinDarkening : skinDarkening // ignore: cast_nullable_to_non_nullable
as int,pdfFile: null == pdfFile ? _self.pdfFile : pdfFile // ignore: cast_nullable_to_non_nullable
as File,
  ));
}


}

/// @nodoc
mixin _$InputConditionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputConditionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputConditionState()';
}


}

/// @nodoc
class $InputConditionStateCopyWith<$Res>  {
$InputConditionStateCopyWith(InputConditionState _, $Res Function(InputConditionState) __);
}


/// Adds pattern-matching-related methods to [InputConditionState].
extension InputConditionStatePatterns on InputConditionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _loading value)?  loading,TResult Function( _success value)?  success,TResult Function( _error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _loading() when loading != null:
return loading(_that);case _success() when success != null:
return success(_that);case _error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _loading value)  loading,required TResult Function( _success value)  success,required TResult Function( _error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _loading():
return loading(_that);case _success():
return success(_that);case _error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _loading value)?  loading,TResult? Function( _success value)?  success,TResult? Function( _error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _loading() when loading != null:
return loading(_that);case _success() when success != null:
return success(_that);case _error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( UserResponseModel response)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _success() when success != null:
return success(_that.response);case _error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( UserResponseModel response)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _loading():
return loading();case _success():
return success(_that.response);case _error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( UserResponseModel response)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _loading() when loading != null:
return loading();case _success() when success != null:
return success(_that.response);case _error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements InputConditionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputConditionState.initial()';
}


}




/// @nodoc


class _loading implements InputConditionState {
  const _loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InputConditionState.loading()';
}


}




/// @nodoc


class _success implements InputConditionState {
  const _success({required this.response});
  

 final  UserResponseModel response;

/// Create a copy of InputConditionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$successCopyWith<_success> get copyWith => __$successCopyWithImpl<_success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _success&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'InputConditionState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class _$successCopyWith<$Res> implements $InputConditionStateCopyWith<$Res> {
  factory _$successCopyWith(_success value, $Res Function(_success) _then) = __$successCopyWithImpl;
@useResult
$Res call({
 UserResponseModel response
});




}
/// @nodoc
class __$successCopyWithImpl<$Res>
    implements _$successCopyWith<$Res> {
  __$successCopyWithImpl(this._self, this._then);

  final _success _self;
  final $Res Function(_success) _then;

/// Create a copy of InputConditionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_success(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as UserResponseModel,
  ));
}


}

/// @nodoc


class _error implements InputConditionState {
  const _error({required this.error});
  

 final  String error;

/// Create a copy of InputConditionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$errorCopyWith<_error> get copyWith => __$errorCopyWithImpl<_error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'InputConditionState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class _$errorCopyWith<$Res> implements $InputConditionStateCopyWith<$Res> {
  factory _$errorCopyWith(_error value, $Res Function(_error) _then) = __$errorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$errorCopyWithImpl<$Res>
    implements _$errorCopyWith<$Res> {
  __$errorCopyWithImpl(this._self, this._then);

  final _error _self;
  final $Res Function(_error) _then;

/// Create a copy of InputConditionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_error(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
