import 'package:abadus/src/blocs/api_request_bloc/api_request_bloc.dart';
import 'package:abadus/src/blocs/pagination_list_bloc/pagination_list_bloc.dart';
import 'package:abadus/src/models/api_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class PaginationListWidget<T extends ApiPaginationRequestBloc>
    extends StatefulWidget {
  final Function(bool)? scrollUpDown;
  final EdgeInsetsGeometry padding;
  final Widget Function(dynamic) itemBuilder;
  final Bloc? bloc;
  final dynamic request;

  PaginationListWidget({
    Key? key,
    required this.itemBuilder,
    this.scrollUpDown,
    this.padding = const EdgeInsets.symmetric(vertical: 60.0),
    this.bloc,
    this.request,
  }) : super(key: key);

  @override
  PaginationListWidgetState createState() =>
      PaginationListWidgetState<PaginationListWidget, T>();
}

class PaginationListWidgetState<T extends StatefulWidget,
    Bloc extends ApiPaginationRequestBloc> extends State<T> {
  dynamic Function()? get request => null;

  ApiPaginationRequestBloc get requestBloc => BlocProvider.of<Bloc>(context);

  ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  final _scrollThreshold = 200.0;

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      scrollUpDown(true);
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      scrollUpDown(false);
    }

    if (maxScroll - currentScroll <= _scrollThreshold) {
      requestBloc.add(RequestDataEvent(request));
    }
  }

  Widget? builder(BuildContext context, ApiPaginationRequestBloc bloc) => null;

  Widget loadingBuilder(BuildContext context) => CircularProgressIndicator();

  Widget? errorBuilder(BuildContext context, String message,
          ApiPaginationRequestBloc bloc) =>
      null;

  Widget? failBuilder(BuildContext context, Map<String, dynamic> fail,
          ApiPaginationRequestBloc bloc) =>
      null;

  Widget? itemBuilder(dynamic item) => null;

  Widget? noDataBuilder(BuildContext context) => null;

  Widget loadingIndicator() {
    return Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget successBuilder(
      BuildContext context,
      Pagination<dynamic> success,
      ApiPaginationRequestBloc bloc,
      ScrollController scrollController,
      bool hasMore) {
    if (success.data?.length == 0) {
      noDataBuilder(context);
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return index >= success.data!.length
            ? loadingIndicator()
            : itemBuilder(success.data!.elementAt(index))!;
      },
      itemCount: hasMore ? success.data!.length + 1 : success.data!.length,
      controller: scrollController,
    );
  }

  void onStateChange(BuildContext context, BlocState state) => null;

  void onLoading(BuildContext context) => null;

  void onError(BuildContext context, String message,
          ApiPaginationRequestBloc bloc) =>
      null;

  void onFail(BuildContext context, Map<String?, dynamic>? fail,
          ApiPaginationRequestBloc bloc) =>
      null;

  void onSuccess(BuildContext context, Pagination<dynamic> success,
          ApiPaginationRequestBloc bloc) =>
      null;

  void scrollUpDown(bool upDown) => null;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
    //_bloc = requestBloc ?? BlocProvider.of<Bloc>(context);
    SchedulerBinding.instance!.addPostFrameCallback((_) => scrollUpDown(false));
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///BlocProvider dignuti gore kad dodju tabovi

    return BlocListener<Bloc, BlocState>(
      bloc: requestBloc as Bloc?,
      // condition: (previous, current) =>
      //     previous.runtimeType != current.runtimeType,
      listener: (context, state) {
        if (state is LoadingState) {
          onLoading(context);
        }
        if (state is ErrorState) {
          onError(context, state.message, requestBloc);
        }
        if (state is FailState) {
          onFail(context, state.fail, requestBloc);
        }
        if (state is SuccessState) {
          onSuccess(context, state.response, requestBloc);
        }
      },
      child: BlocBuilder<Bloc, BlocState>(
        bloc: requestBloc as Bloc?,
        builder: (context, state) {
          Pagination<dynamic>? _pagination =
              requestBloc.getCurrentStatePagination();
          if (_pagination == null) {
            // if (state is PaginationListInitial &&
            //     T == PaginationListSearchBloc) {
            //   return Container();
            // }
            if (state is InitState || state is LoadingState) {
              return loadingBuilder(context);
            }
            if (state is ErrorState) {
              return errorBuilder(context, state.message, requestBloc)!;
            }
          }
          return successBuilder(context, _pagination!, requestBloc,
              scrollController, _pagination.nextPageUrl != null);
        },
      ),
    );
    //return _widget;
  }
}
