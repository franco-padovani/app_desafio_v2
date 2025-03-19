// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpUserHash() => r'7092a8c9aa76d7393f258d23858201ac3935a974';

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

/// See also [signUpUser].
@ProviderFor(signUpUser)
const signUpUserProvider = SignUpUserFamily();

/// See also [signUpUser].
class SignUpUserFamily extends Family<AsyncValue<User>> {
  /// See also [signUpUser].
  const SignUpUserFamily();

  /// See also [signUpUser].
  SignUpUserProvider call(
    String email,
    String password,
  ) {
    return SignUpUserProvider(
      email,
      password,
    );
  }

  @override
  SignUpUserProvider getProviderOverride(
    covariant SignUpUserProvider provider,
  ) {
    return call(
      provider.email,
      provider.password,
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

/// See also [signUpUser].
class SignUpUserProvider extends AutoDisposeFutureProvider<User> {
  /// See also [signUpUser].
  SignUpUserProvider(
    String email,
    String password,
  ) : this._internal(
          (ref) => signUpUser(
            ref as SignUpUserRef,
            email,
            password,
          ),
          from: signUpUserProvider,
          name: r'signUpUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signUpUserHash,
          dependencies: SignUpUserFamily._dependencies,
          allTransitiveDependencies:
              SignUpUserFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  SignUpUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<User> Function(SignUpUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignUpUserProvider._internal(
        (ref) => create(ref as SignUpUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<User> createElement() {
    return _SignUpUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpUserProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignUpUserRef on AutoDisposeFutureProviderRef<User> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _SignUpUserProviderElement extends AutoDisposeFutureProviderElement<User>
    with SignUpUserRef {
  _SignUpUserProviderElement(super.provider);

  @override
  String get email => (origin as SignUpUserProvider).email;
  @override
  String get password => (origin as SignUpUserProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
