import 'package:abadus/src/blocs/api_request_bloc/api_request_bloc.dart';
import 'package:abadus/src/functions/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ApiRequestWidgetState<T extends StatefulWidget, Response>
    extends State<T> {
  ApiRequestBloc? get requestBloc => null;

  ApiRequestBloc? _apiRequestBloc;

  Widget? builder(BuildContext context, ApiRequestBloc? bloc) => null;

  Widget? loadingBuilder(BuildContext context) => null;

  Widget? errorBuilder(
          BuildContext context, String message, ApiRequestBloc? bloc) =>
      null;

  Widget? failBuilder(BuildContext context, Map<String?, dynamic>? fail,
          ApiRequestBloc? bloc) =>
      null;

  Widget? successBuilder(
          BuildContext context, Response success, ApiRequestBloc? bloc) =>
      null;

  void onStateChange(BuildContext context, BlocState state) => null;

  void onLoading(BuildContext context) => null;

  void onError(BuildContext context, String message, ApiRequestBloc? bloc) =>
      null;

  void onFail(BuildContext context, Map<String?, dynamic>? fail,
          ApiRequestBloc? bloc) =>
      null;

  void onSuccess(
          BuildContext context, Response success, ApiRequestBloc? bloc) =>
      null;

  @override
  void initState() {
    super.initState();
    _apiRequestBloc = requestBloc;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _apiRequestBloc!,
      child: BlocConsumer(
        bloc: _apiRequestBloc,
        listener: (context, dynamic state) {
          onStateChange(context, state);
          if (state is LoadingState) {
            onLoading(context);
          }
          if (state is ErrorState) {
            onError(context, state.message, _apiRequestBloc);
          }
          if (state is FailState) {
            onFail(context, state.fail, _apiRequestBloc);
          }
          if (state is SuccessState) {
            onSuccess(context, state.response, _apiRequestBloc);
          }
        },
        builder: (context, dynamic state) {
          Widget? _builderWidget = builder(context, _apiRequestBloc);
          if (_builderWidget != null) {
            return _builderWidget;
          }
          if (state is LoadingState) {
            return loadingBuilder(context) ?? Container();
          }
          if (state is ErrorState) {
            return errorBuilder(context, state.message, _apiRequestBloc) ??
                Container();
          }
          if (state is FailState) {
            return failBuilder(context, state.fail, _apiRequestBloc) ??
                Container();
          }

          if (state is SuccessState) {
            return successBuilder(context, state.response, _apiRequestBloc) ??
                Container();
          }
          return Container();
        },
      ),
    );
  }
}

abstract class ApiPostFormWidgetState<T extends StatefulWidget, Response,
    FState extends State<StatefulWidget>> extends State<T> {
  ApiRequestBloc? get requestBloc => null;

  GlobalKey<FState>? get globalKey => null;

  ApiRequestBloc? _apiRequestBloc;

  GlobalKey<FState>? _fbKey;

  @override
  void initState() {
    super.initState();
    _apiRequestBloc = requestBloc;
    _fbKey = globalKey;
  }

  String? apiValidator(String field) {
    if (!_hasErrors) {
      return Api.apiValidator<FailState>(_apiRequestBloc, field)();
    }
    return null;
  }

  void onStateChange(BuildContext context, BlocState state) => null;

  void onLoading(BuildContext context) => null;

  void onError(BuildContext context, String message, ApiRequestBloc? bloc) =>
      null;

  void onFail(BuildContext context, Map<String?, dynamic>? fail,
          ApiRequestBloc? bloc) =>
      null;

  void onSuccess(
          BuildContext context, Response success, ApiRequestBloc? bloc) =>
      null;

  Widget? buildForm(
          BuildContext context,
          ApiRequestBloc? bloc,
          GlobalKey<FState>? formKey,
          Function(String apiFieldName) apiValidator) =>
      null;

  bool _hasErrors = false;

  bool validate(GlobalKey<FState>? formKey) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _apiRequestBloc!,
      child: BlocListener(
        bloc: _apiRequestBloc,
        listener: (context, BlocState state) {
          onStateChange(context, state);
          _hasErrors = false;
          if (state is LoadingState) {
            onLoading(context);
          }
          if (state is ErrorState) {
            onError(context, state.message, _apiRequestBloc);
          }
          if (state is FailState) {
            _hasErrors = !validate(_fbKey);
            //requestBloc.add(SetToInitEvent());
            onFail(context, state.fail, _apiRequestBloc);
          }

          if (state is SuccessState) {
            onSuccess(context, state.response, _apiRequestBloc);
          }
        },
        child: BlocBuilder(
          bloc: _apiRequestBloc,
          builder: (context, dynamic state) {
            return buildForm(
              context,
              _apiRequestBloc,
              _fbKey,
              (field) => apiValidator(field),
            )!;
          },
        ),
      ),
    );
  }
}
