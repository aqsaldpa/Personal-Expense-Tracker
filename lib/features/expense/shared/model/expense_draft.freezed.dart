// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpenseDraft {

 String get title; double get amount; DateTime get date; ExpenseCategory get category;
/// Create a copy of ExpenseDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseDraftCopyWith<ExpenseDraft> get copyWith => _$ExpenseDraftCopyWithImpl<ExpenseDraft>(this as ExpenseDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseDraft&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,title,amount,date,category);

@override
String toString() {
  return 'ExpenseDraft(title: $title, amount: $amount, date: $date, category: $category)';
}


}

/// @nodoc
abstract mixin class $ExpenseDraftCopyWith<$Res>  {
  factory $ExpenseDraftCopyWith(ExpenseDraft value, $Res Function(ExpenseDraft) _then) = _$ExpenseDraftCopyWithImpl;
@useResult
$Res call({
 String title, double amount, DateTime date, ExpenseCategory category
});




}
/// @nodoc
class _$ExpenseDraftCopyWithImpl<$Res>
    implements $ExpenseDraftCopyWith<$Res> {
  _$ExpenseDraftCopyWithImpl(this._self, this._then);

  final ExpenseDraft _self;
  final $Res Function(ExpenseDraft) _then;

/// Create a copy of ExpenseDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? amount = null,Object? date = null,Object? category = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ExpenseCategory,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseDraft].
extension ExpenseDraftPatterns on ExpenseDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseDraft() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseDraft value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseDraft():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseDraft value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseDraft() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  double amount,  DateTime date,  ExpenseCategory category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseDraft() when $default != null:
return $default(_that.title,_that.amount,_that.date,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  double amount,  DateTime date,  ExpenseCategory category)  $default,) {final _that = this;
switch (_that) {
case _ExpenseDraft():
return $default(_that.title,_that.amount,_that.date,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  double amount,  DateTime date,  ExpenseCategory category)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseDraft() when $default != null:
return $default(_that.title,_that.amount,_that.date,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _ExpenseDraft implements ExpenseDraft {
  const _ExpenseDraft({required this.title, required this.amount, required this.date, this.category = ExpenseCategory.other});
  

@override final  String title;
@override final  double amount;
@override final  DateTime date;
@override@JsonKey() final  ExpenseCategory category;

/// Create a copy of ExpenseDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseDraftCopyWith<_ExpenseDraft> get copyWith => __$ExpenseDraftCopyWithImpl<_ExpenseDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseDraft&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,title,amount,date,category);

@override
String toString() {
  return 'ExpenseDraft(title: $title, amount: $amount, date: $date, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ExpenseDraftCopyWith<$Res> implements $ExpenseDraftCopyWith<$Res> {
  factory _$ExpenseDraftCopyWith(_ExpenseDraft value, $Res Function(_ExpenseDraft) _then) = __$ExpenseDraftCopyWithImpl;
@override @useResult
$Res call({
 String title, double amount, DateTime date, ExpenseCategory category
});




}
/// @nodoc
class __$ExpenseDraftCopyWithImpl<$Res>
    implements _$ExpenseDraftCopyWith<$Res> {
  __$ExpenseDraftCopyWithImpl(this._self, this._then);

  final _ExpenseDraft _self;
  final $Res Function(_ExpenseDraft) _then;

/// Create a copy of ExpenseDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? amount = null,Object? date = null,Object? category = null,}) {
  return _then(_ExpenseDraft(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as ExpenseCategory,
  ));
}


}

// dart format on
