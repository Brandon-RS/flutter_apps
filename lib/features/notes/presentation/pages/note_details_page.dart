import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/features/notes/presentation/blocs/note_details_cubit/note_details_cubit.dart';
import 'package:flit_notes/features/notes/presentation/widgets/note_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class NoteDetailsPage extends StatelessWidget {
  const NoteDetailsPage({
    @PathParam() required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => NoteDetailsCubit(),
        child: NoteDetails(id: id),
      ),
    );
  }
}
