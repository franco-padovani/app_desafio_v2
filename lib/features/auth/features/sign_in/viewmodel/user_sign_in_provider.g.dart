// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_in_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInUserHash() => r'496682e9f6708eb0c4ed683a48ab5cc6e42f0b2e';

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

abstract class _$SignInUser
    extends BuildlessAutoDisposeAsyncNotifier<UserSignInState> {
  late final SignInState signInState;

  FutureOr<UserSignInState> build(
    SignInState signInState,
  );
}

/// See also [SignInUser].
@ProviderFor(SignInUser)
const signInUserProvider = SignInUserFamily();

/// See also [SignInUser].
class SignInUserFamily extends Family<AsyncValue<UserSignInState>> {
  /// See also [SignInUser].
  const SignInUserFamily();

  /// See also [SignInUser].
  SignInUserProvider call(
    SignInState signInState,
  ) {
    return SignInUserProvider(
      signInState,
    );
  }

  @override
  SignInUserProvider getProviderOverride(
    covariant SignInUserProvider provider,
  ) {
    return call(
      provider.signInState,
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
  String? get name => r'signInUserProvider';
}

/// See also [SignInUser].
class SignInUserProvider
    extends AutoDisposeAsyncNotifierProviderImpl<SignInUser, UserSignInState> {
  /// See also [SignInUser].
  SignInUserProvider(
    SignInState signInState,
  ) : this._internal(
          () => SignInUser()..signInState = signInState,
          from: signInUserProvider,
          name: r'signInUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signInUserHash,
          dependencies: SignInUserFamily._dependencies,
          allTransitiveDependencies:
              SignInUserFamily._allTransitiveDependencies,
          signInState: signInState,
        );

  SignInUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.signInState,
  }) : super.internal();

  final SignInState signInState;

  @override
  FutureOr<UserSignInState> runNotifierBuild(
    covariant SignInUser notifier,
  ) {
    return notifier.build(
      signInState,
    );
  }

  @override
  Override overrideWith(SignInUser Function() create) {
    return ProviderOverride(
      origin: this,
      override: SignInUserProvider._internal(
        () => create()..signInState = signInState,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        signInState: signInState,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SignInUser, UserSignInState>
      createElement() {
    return _SignInUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignInUserProvider && other.signInState == signInState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, signInState.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignInUserRef on AutoDisposeAsyncNotifierProviderRef<UserSignInState> {
  /// The parameter `signInState` of this provider.
  SignInState get signInState;
}

class _SignInUserProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SignInUser, UserSignInState>
    with SignInUserRef {
  _SignInUserProviderElement(super.provider);

  @override
  SignInState get signInState => (origin as SignInUserProvider).signInState;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
