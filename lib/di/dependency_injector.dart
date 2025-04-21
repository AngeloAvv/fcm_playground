import 'package:fcm_playground/blocs/configuration/configuration_bloc.dart';
import 'package:fcm_playground/features/database/fcm_playground_database.dart';
import 'package:fcm_playground/misc/constants.dart';
import 'package:fcm_playground/misc/mappers/message/message_mapper.dart';
import 'package:fcm_playground/misc/mappers/project/project_mapper.dart';
import 'package:fcm_playground/repositories/configuration_repository.dart';
import 'package:fcm_playground/repositories/file_picker_repository.dart';
import 'package:fcm_playground/repositories/notification_repository.dart';
import 'package:fcm_playground/repositories/project_repository.dart';
import 'package:fcm_playground/services/configuration_service.dart';
import 'package:fcm_playground/services/database/project_service.dart' as db;
import 'package:fcm_playground/services/local/file_picker_service.dart';
import 'package:fcm_playground/services/local/project_service.dart';
import 'package:fcm_playground/services/network/notification_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_launch_arguments/flutter_launch_arguments.dart';
import 'package:pine/pine.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker/talker.dart';

part 'blocs.dart';

part 'providers.dart';

part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        blocs: _blocs,
        providers: _providers,
        repositories: _repositories,
        child: child,
      );
}
