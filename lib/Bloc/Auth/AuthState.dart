abstract class AuthState{}

class initialAuthState extends AuthState{}

//Login State
class LoadingLoginState extends AuthState{}
class SuccessLoginState extends AuthState{}
class ErrorLoginState extends AuthState{}
class SuccessLoginApiState extends AuthState{}
class ErrorLoginApiState extends AuthState{}

//Register State

class LoadingRegisterState extends AuthState{}
class SuccessRegisterState extends AuthState{}
class ErrorRegisterState extends AuthState{}
class SuccessRegisterApiState extends AuthState{}
class ErrorRegisterApiState extends AuthState{}

//logout state

class ErrorLogoutApiState extends AuthState{}
class SuccessLogoutApiState extends AuthState{}
class LoadingLogoutApiState extends AuthState{}

// Get Profile State
class GetProfileSuccessState extends AuthState{}
class GetProfileLoadingState extends AuthState{}
class GetProfileErrorState extends AuthState{}