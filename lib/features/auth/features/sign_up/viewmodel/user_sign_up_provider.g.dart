// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpUserHash() => r'a10c90eaf7c0a3b121f7037fe58dddde4aeccd37';

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
  late final String email;
  late final String password;
  late final String confirmPassword;

  FutureOr<UserSignInState> build(
    String email,
    String password,
    String confirmPassword,
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
    String email,
    String password,
    String confirmPassword,
  ) {
    return SignUpUserProvider(
      email,
      password,
      confirmPassword,
    );
  }

  @override
  SignUpUserProvider getProviderOverride(
    covariant SignUpUserProvider provider,
  ) {
    return call(
      provider.email,
      provider.password,
      provider.confirmPassword,
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
    String email,
    String password,
    String confirmPassword,
  ) : this._internal(
          () => SignUpUser()
            ..email = email
            ..password = password
            ..confirmPassword = confirmPassword,
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
          confirmPassword: confirmPassword,
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
    required this.confirmPassword,
  }) : super.internal();

  final String email;
  final String password;
  final String confirmPassword;

  @override
  FutureOr<UserSignInState> runNotifierBuild(
    covariant SignUpUser notifier,
  ) {
    return notifier.build(
      email,
      password,
      confirmPassword,
    );
  }

  @override
  Override overrideWith(SignUpUser Function() create) {
    return ProviderOverride(
      origin: this,
      override: SignUpUserProvider._internal(
        () => create()
          ..email = email
          ..password = password
          ..confirmPassword = confirmPassword,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
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
    return other is SignUpUserProvider &&
        other.email == email &&
        other.password == password &&
        other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);
    hash = _SystemHash.combine(hash, confirmPassword.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SignUpUserRef on AutoDisposeAsyncNotifierProviderRef<UserSignInState> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;

  /// The parameter `confirmPassword` of this provider.
  String get confirmPassword;
}

class _SignUpUserProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SignUpUser, UserSignInState>
    with SignUpUserRef {
  _SignUpUserProviderElement(super.provider);

  @override
  String get email => (origin as SignUpUserProvider).email;
  @override
  String get password => (origin as SignUpUserProvider).password;
  @override
  String get confirmPassword => (origin as SignUpUserProvider).confirmPassword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
