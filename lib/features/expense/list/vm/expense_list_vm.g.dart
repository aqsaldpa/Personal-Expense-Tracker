// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_list_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ExpenseListVm)
const expenseListVmProvider = ExpenseListVmProvider._();

final class ExpenseListVmProvider
    extends $StreamNotifierProvider<ExpenseListVm, List<Expense>> {
  const ExpenseListVmProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseListVmProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseListVmHash();

  @$internal
  @override
  ExpenseListVm create() => ExpenseListVm();
}

String _$expenseListVmHash() => r'b4f0d3f31a30d90c320c3bcef444320a32f6233a';

abstract class _$ExpenseListVm extends $StreamNotifier<List<Expense>> {
  Stream<List<Expense>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Expense>>, List<Expense>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Expense>>, List<Expense>>,
              AsyncValue<List<Expense>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ExpenseFilterVm)
const expenseFilterVmProvider = ExpenseFilterVmProvider._();

final class ExpenseFilterVmProvider
    extends $NotifierProvider<ExpenseFilterVm, ExpenseFilter> {
  const ExpenseFilterVmProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseFilterVmProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseFilterVmHash();

  @$internal
  @override
  ExpenseFilterVm create() => ExpenseFilterVm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpenseFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpenseFilter>(value),
    );
  }
}

String _$expenseFilterVmHash() => r'764ab8daf0f6d597d698ad3774c02f964a41a485';

abstract class _$ExpenseFilterVm extends $Notifier<ExpenseFilter> {
  ExpenseFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ExpenseFilter, ExpenseFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ExpenseFilter, ExpenseFilter>,
              ExpenseFilter,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(visibleExpenses)
const visibleExpensesProvider = VisibleExpensesProvider._();

final class VisibleExpensesProvider
    extends $FunctionalProvider<List<Expense>, List<Expense>, List<Expense>>
    with $Provider<List<Expense>> {
  const VisibleExpensesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'visibleExpensesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$visibleExpensesHash();

  @$internal
  @override
  $ProviderElement<List<Expense>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Expense> create(Ref ref) {
    return visibleExpenses(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Expense> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Expense>>(value),
    );
  }
}

String _$visibleExpensesHash() => r'cb1b6126cbc4381e130155affe0a9b3a9783b125';

@ProviderFor(expenseTotal)
const expenseTotalProvider = ExpenseTotalProvider._();

final class ExpenseTotalProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  const ExpenseTotalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expenseTotalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expenseTotalHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return expenseTotal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$expenseTotalHash() => r'd419cc50782a3e9915277552a3f9eb525fe83615';
