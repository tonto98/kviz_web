# abadus

Abadus Framework

## Included

1. Env 
2. Application (package info, bloc logger, current language), 
3. Api provider (dio, api request with automatic token, logger, packageInfo - version)
4. ApiModels (RestApiModel, RestApiFail, PaginationModel)
5. Functions (FileSerialization (from cache), apiValidator)
6. AppCacheManager
7. Log
8. Api Blocs 
  * ApiRequestBloc 
  * ApiPaginationRequestBloc, 
9. Api Widgets
  * ApiRequestWidgetState<T extends StatefulWidget, Response> - za dohvat podataka
  * ApiPostFormWidgetState<T extends StatefulWidget, Response> - za slanje podataka sa ugrađenim builderom s formKey
  * PaginationListWidgetState<T extends StatefulWidget, Bloc extends ApiPaginationRequestBloc> extends State<T> - widget za prikaz paginacije
10. Auth
  * AuthenticationRepository
  * AuthBloc



## Kako koristiti

### 1. Env

```
void main() => Development();

class Development extends Env {
  final String appName = 'MyApp';
  final String baseUrl = 'https://api-url.com/api';
  final Color primarySwatch = Colors.red;
  EnvType environmentType = EnvType.DEVELOPMENT;

  @override
  Widget get firstWidget => MyApp();
}
```

### 2. Application

```
class ApplicationCore extends Application {
  ApplicationCore._privateConstructor();

  static final ApplicationCore _instance =
      ApplicationCore._privateConstructor();

  factory ApplicationCore() {
    return _instance;
  }

  //navigator Key
  static GlobalKey<NavigatorState> _navigatorKey;

  
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  String get getCurrentLanguage => 'en';

  @override
  Future<String> get getToken async => Future.value(null);
  
  @override
  Future<void> onCreate() async {
    await super.onCreate();
    //init navigator key
    _navigatorKey = GlobalKey<NavigatorState>();
  }
}
```

### 3. Api provider

Api provider u sebi ima ugradjeno:
* AppCacheManager -> cacheManager
* PaginationApiHelper -> paginationApiHelper

```
  Stream<PaginationModel<MyData>> getMyDataListWithCache() {
    return paginationApiHelper.getDataListWithCache<MyData>(
      fromJson: (object) => MyData.fromObject(object),
      url: '/my-data/',
      headers: {
        "requires-token": "",
        "default-headers": "",
      },
    );
  }

  Future<PaginationModel<MyData>> getMyDataList(
      String nextPageUrl) async {    
    return await paginationApiHelper.getDataList<MyData>(
      'my-data/,
      headers: {
        "requires-token": "",
        "default-headers": "",
      },
      fromJson: (object) => MyData.fromObject(object),
    );
  }
```
* Dio -> dio sa interceptorima za logging, transformer za pretty print podataka iz cachea, interceptori za api callove
* baseUrl -> izlaci iz Env

Funkcija za dohvat podataka iz cache-a:
```
Stream<T> getCachedData<T>(
      {@required T Function(Object) serializationFunction,
      String url,
      Map<String, String> headers,
      Stream<FileInfo> Function() fetcher}) async* {}

```
### 4. ApiModels

### 8. Api Blocs

#### ApiRequestBloc

Slanje i primanje podataka.

**Events**

* `SetToInitEvent` - postavlja InitState
* `RequestDataEvent<T>(T request)` - request event, moze biti za post i za get
* `RefreshDataEvent<T>(T data)` - refresh postojeceg state s novim objektom

**States**

* `InitState`
* `LoadingState` - u vrijeme upita na api
* `SuccessState<T>(T response)` - uspjesno smo dohvatili podatke s apija
* `FailState(Map<String, dynamic> fail)` - state koji sadrzi fail (automatic RestApiFail model serialization)
* `ErrorState (String message)` - state s error-om parsanim od strane api responsa, sadrzi message (error)

**Functions**
  `Stream<Response> request(Request request)` - api request (required)
  `void init()` - inicijalizacija bloca
  `void afterSuccess(Response successResponse)` - success
  `void onFail(Map<String, dynamic> fail)` - onFail
  `void onErrorResponse(String message)` - onError

**Example**
```
class PasswordResetBloc extends ApiRequestBloc<String, bool> {
  @override
  Stream<bool> request(String request) {
    return LogInRepository().forgotPassword(request);
  }
}
```

#### ApiPaginationRequestBloc

**Events**

* `SetToInitEvent` - postavlja InitState
* `RequestDataEvent<T>(T request)` - request event, moze biti za post i za get
* `RefreshDataEvent<T>(T data)` - refresh postojeceg state s novim objektom
* `PaginationDeleteFromListEvent(int id)` - brise item iz liste prema id-u
* `PaginationAddToListEvent<T>(T data)` - dodaje item u listu
* `PaginationRefreshFromListEvent<T>` - refresha item po id-u. Potrebno u blocu override funkcije kako bi znali kako doci do id-a object
  `int dataId(Response data) => null;`

**States**

* `InitState`
* `PaginationListErrorState<T>` - sadrzi error message i trenutni state paginacije
* `PaginationListLoadingState<T>` - sadrzi loading i trenutni state paginacije 
* `PaginationListSuccessState<T>` - sadrzi trenutni state paginacije uvecan za nove iteme

**Functions**
  `Stream<Response> request(Request request)` - api request (required)
  `int dataId(Response data)` - funkcija za dohvacanje id iz objekta, potrebno za refresh itema u listi, brisanje itema iz liste
  `void init()` - inicijalizacija bloca
  `void afterSuccess(Response successResponse)` - success
  `void onFail(Map<String, dynamic> fail)` - onFail
  `void onErrorResponse(String message)` - onError

**Example**
```
class InitiativeListAllBloc extends ApiPaginationRequestBloc<Null, Initiative> {
  @override
  Stream<PaginationModel<Initiative>> request(
          Null request, state, String nextPageUrl) =>
      InitiativeRepository().getInitiativeList(nextPageUrl: nextPageUrl);
}
```

### 9. Api Widgets

#### ApiRequestWidgetState

**Bloc**
  `ApiRequestBloc get requestBloc => myOwnBloc;`

**Builders**
  Koristimo kada zelimo prikazati nesto na ekranu!

  `Widget builder(BuildContext context, ApiRequestBloc bloc)` - builder koji vraca bloc, uglavnom se ne koristi osim ako zelimo hendlati neke nedefinirane stateove
  `Widget loadingBuilder(BuildContext context)` - builder za loading
  `Widget errorBuilder(BuildContext context, String message, ApiRequestBloc bloc)` - builder za error
  `Widget failBuilder(BuildContext context, Map<String, dynamic> fail, ApiRequestBloc bloc)` - builder za fail
  `Widget successBuilder(BuildContext context, Response success, ApiRequestBloc bloc)` - builder za success

**Callback functions**
  Koristimo kada zelimo prikazati snackbar ili da se nesto dogodi ovisno o state-u!

  `void onStateChange(BuildContext context, BlocState state)` => callback kad se mjenja state;
  `void onLoading(BuildContext context)`
  `void onError(BuildContext context, String message, ApiRequestBloc bloc)`
  `void onFail(BuildContext context, Map<String, dynamic> fail, ApiRequestBloc bloc)`
  `void onSuccess(BuildContext context, Response success, ApiRequestBloc bloc)`

#### ApiPostFormWidgetState
  Kreira sam validator i formKey, rjesava problem validacije sa apija!

**Bloc**
  `ApiPaginationRequestBloc get requestBloc => myOwnBloc;` - defaultno uzima iz BlocProvider.of<Bloc>(context);

**Builders**
  Koristimo kada zelimo prikazati nesto na ekranu!

  `Widget buildForm(BuildContext context, ApiRequestBloc bloc)` - 

**Callback functions**
  Koristimo kada zelimo prikazati snackbar ili da se nesto dogodi ovisno o state-u!

  `void onStateChange(BuildContext context, BlocState state)` => callback kad se mjenja state;
  `void onLoading(BuildContext context)`
  `void onError(BuildContext context, String message, ApiRequestBloc bloc)`
  `void onFail(BuildContext context, Map<String, dynamic> fail, ApiRequestBloc bloc)`
  `void onSuccess(BuildContext context, Response success, ApiRequestBloc bloc)`


#### PaginationListWidgetState

### 10. Auth

#### AuthenticationRepository

**Konfiguriranje AuthRepository**

Najprije trebamo konfigurirati AuthenticationRepository za object koji koristimo za autentikaciju:
To može biti jednostavni `String` koji sadrzi token.
Ili može biti objekt koji sadrži više informacija, `ime_korisnika`, `datum_isteka`, `token`, `tip_tokena`...
Po defaultu tokeni se spremaju u `shared_preferences` sa key `auth_data`

Funkcije koje sadrzi authentication_repository:
  * Future<void> deleteToken() async {} - brise token iz shared_pref
  * String objectToString(T data) {} - kako genericki objekt pretvoriti u `String` za pohranjivanje u shared_pref
  * T stringToObject(String data) {} - kako string pretvoriti u genericki objekt
  * Future<void> persistToken(T data) async {} - spremanje tokena, koristi function `objectToString`
  * Future<bool> hasToken() async {} - provjerava da li ima tokena u shared_pref
  * Future<bool> isValid() async {} - provjerava da li je token valid. implementirati api call ili provjeriti u objectu ako sadrzi datum isteka
  * Future<T> getToken() async {} - vraca token iz shared_pref, koristi funkciju `stringToObject`

Obavezan override funkcija:
  * String objectToString(T data) {}
  * Future<bool> isValid() async {}
  * Future<T> getToken() async {},

#### AuthBloc

**Events**

* AuthStarted - event se poziva prilikom startanje aplikacije, provjerava da li token postoji (shared_pref), te da li je valid (ovisno u implementaciji - _api_call_). Postavlja se state bloca ovisno o rezultatu provjere (`AuthSuccess`, `AuthFail`).
* AuthLoggedIn<T> - poziva se kada je korisnik ulogiran u sustav, proslijedjuje mu se objekt koristen za autentikaciju i taj se objekt sprema u shared_pref. Postavlja se state bloca u `AuthSuccess`.
* AuthLoggedOut - brise token iz shared_pref. Postavlja se state bloca u `AuthFail`.

**States**

* AuthInitial - pocetno stanje
* AuthLoading - provjerava status (api_call, shared_pref)
* AuthSuccess - autenticiran
* AuthFail - nije autenticiran


## Installing

**1. Depend on it**

Add this to your package's pubspec.yaml file:
```
dependencies:
  abadus:
    git: 
      url: git@gitlab.com:exevio/development/flutter-packages/abadus.git
      ref: v1.0.7
```

**2. Install it**

You can install packages from the command line:
with Flutter:
```
$ flutter pub get
```

**3. Import it**

Now in your Dart code, you can use:
```
import 'package:abadus/abadus.dart';;
```
