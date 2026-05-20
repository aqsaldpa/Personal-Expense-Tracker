// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_expense_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddExpenseVm)
const addExpenseVmProvider = AddExpenseVmProvider._();

final class AddExpenseVmProvider
    extends $NotifierProvider<AddExpenseVm, AsyncValue<void>> {
  const AddExpenseVmProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addExpenseVmProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addExpenseVmHash();

  @$internal
  @override
  AddExpenseVm create() => AddExpenseVm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$addExpenseVmHash() => r'247b8d3a206c9107d6763985f6b1136f229798cd';

abstract class _$AddExpenseVm extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
