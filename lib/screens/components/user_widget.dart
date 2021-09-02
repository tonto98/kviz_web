import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:kviz_web/000_app/core/application_core.dart';
import 'package:kviz_web/repos/user_repo.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({Key? key}) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(width: 3.0),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          color: Colors.lightBlue),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(ApplicationCore()
                    .getUserRepo()
                    .imageUrl ??
                "https://static-00.iconduck.com/assets.00/avatar-default-symbolic-icon-512x488-rddkk3u9.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Text(ApplicationCore().getUserRepo().userEmail!),
        ],
      ),
    );
  }
}
