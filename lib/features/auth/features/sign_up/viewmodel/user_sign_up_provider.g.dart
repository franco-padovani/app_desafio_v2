// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpUserHash() => r'0eb520a787df5212c547f1d053c8524bc710b7f9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SignUpUser
    extends BuildlessAutoDisposeAsyncNotifier<UserSignInState> {
  late final SignUpState signUpState;

  FutureOr<UserSignInState> build(
    SignUpState signUpState,
  );
}

/// See also [SignUpUser].
@ProviderFor(SignUpUser)
const signUpUserProvider = SignUpUserFamily();

/// See also [SignUpUser].
class SignUpUserFamily extends Family<AsyncValue<UserSignInState>> {
  /// See also [SignUpUser].
  const SignUpUserFamily();

  /// See also [SignUpUser].
  SignUpUserProvider call(
    SignUpState signUpState,
  ) {
    return SignUpUserProvider(
      signUpState,
    );
  }

  @override
  SignUpUserProvider getProviderOverride(
    covariant SignUpUserProvider provider,
  ) {
    return call(
      provider.signUpState,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'signUpUserProvider';
}

/// See also [SignUpUser].
class SignUpUserProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SignUpUser, UserSignInState> {
  /// See also [SignUpUser].
  SignUpUserProvider(
    SignUpState signUpState,
  ) : this._internal(
          () => SignUpUser()..signUpState = signUpState,
          from: signUpUserProvider,
          name: r'signUpUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signUpUserHash,
          dependencies: SignUpUserFamily._dependencies,
          allTransitiveDependencies:
              SignUpUserFamily._allTransitiveDependencies,
          signUpState: signUpState,
        );

  SignUpUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.signUpState,
  }) : super.internal();

  final SignUpState signUpState;

  @override
  FutureOr<UserSignInState> runNotifierBuild(
    covariant SignUpUser notifier,
  ) {
    return notifier.build(
      signUpState,
    );
  }

  @override
  Override overrideWith(SignUpUser Function() create) {
    return ProviderOverride(
      origin: this,
      override: SignUpUserProvider._internal(
        () => create()..signUpState = signUpState,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        signUpState: signUpState,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SignUpUser, UserSignInState>
      createElement() {
    return _SignUpUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpUserProvider && other.signUpState == signUpState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, signUpState.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignUpUserRef on AutoDisposeAsyncNotifierProviderRef<UserSignInState> {
  /// The parameter `signUpState` of this provider.
  SignUpState get signUpState;
}

class _SignUpUserProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SignUpUser, UserSignInState>
    with SignUpUserRef {
  _SignUpUserProviderElement(super.provider);

  @override
  SignUpState get signUpState => (origin as SignUpUserProvider).signUpState;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
