import 'package:abadus/abadus.dart';
import 'package:example/700_initiatives/bloc/initiative_list_bloc/initiative_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:example/700_initiatives/models/models.dart';

class InitiativeListWidget extends StatefulWidget {
  @override
  _InitiativeListWidgetState createState() => _InitiativeListWidgetState();
}

class _InitiativeListWidgetState extends PaginationListWidgetState<
    InitiativeListWidget, InitiativeListAllBloc> {
  
  InitiativeListAllBloc _bloc;

  @override
  ApiPaginationRequestBloc get requestBloc => _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = InitiativeListAllBloc();
    requestBloc.add(RequestDataEvent(null));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget errorBuilder(BuildContext context, String message, ApiPaginationRequestBloc bloc) {
    return Text(message);
  }

  @override
  Widget itemBuilder(item) {
    if (item is Initiative) {
      return InitiativeWidget(initiative: item);
    }
    return Text('item');
  }
}



class InitiativeWidget extends StatelessWidget {
  final Initiative initiative;

  InitiativeWidget({this.initiative});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Text(initiative.id.toString()),
        title: Text(initiative.title ?? ''),
        subtitle: Text(initiative.shortDescription ?? ''),
      ),
    );
  }
}
