// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_expense_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditExpenseVm)
const editExpenseVmProvider = EditExpenseVmProvider._();

final class EditExpenseVmProvider
    extends $NotifierProvider<EditExpenseVm, AsyncValue<void>> {
  const EditExpenseVmProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editExpenseVmProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editExpenseVmHash();

  @$internal
  @override
  EditExpenseVm create() => EditExpenseVm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$editExpenseVmHash() => r'5efadb6abf89459030b450751c342cd97bad8b23';

abstract class _$EditExpenseVm extends $Notifier<AsyncValue<void>> {
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
