import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/presentation/widgets/color_picker.dart';
import 'package:flit_notes/features/collections/presentation/blocs/collection_form_cubit/collection_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sdk_helpers/sdk_helpers.dart';

class CreateCollection extends StatelessWidget {
  const CreateCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CollectionFormCubit(),
      child: const _CreateCollection(key: Key('collection_form')),
    );
  }
}

class _CreateCollection extends StatefulWidget {
  const _CreateCollection({super.key});

  @override
  State<_CreateCollection> createState() => _CreateCollectionState();
}

class _CreateCollectionState extends State<_CreateCollection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          ColoredBox(
            color: context.colors.secondary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => context.maybePop(false),
                ),

                Text(
                  context.tr.createCollection,
                  style: context.textTheme.titleLarge,
                ),

                BlocBuilder<CollectionFormCubit, CollectionFormState>(
                  buildWhen: (prev, current) => prev.status != current.status,
                  builder: (context, state) {
                    // TODO(BRANDOM): Create a base widget for this and add loading, error, and disable indicators/states
                    return TextButton(
                      onPressed:
                          state.status.isLoading
                              ? null
                              : () => _saveChanges(context, state),
                      child: Text(
                        context.tr.done,
                        style: context.textTheme.labelLarge,
                      ),
                    );
                  },
                ),
              ],
            ).addVertical(10),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<CollectionFormCubit, CollectionFormState>(
                builder: (context, state) {
                  return ColorPicker(
                    selected: state.color,
                    onColorSelected:
                        context.read<CollectionFormCubit>().setColor,
                  );
                },
              ),
              // TODO(BRANDOM): Add icon picker
            ],
          ).addHorizontal(18),

          TextFormField(
            validator: (value) {
              return value.isNullOrEmpty
                  ? context.tr.collectionNameRequired
                  : null;
            },
            decoration: BorderlessInputDecoration(
              hintText: context.tr.collectionName,
            ),
            onChanged: context.read<CollectionFormCubit>().setName,
          ),

          TextFormField(
            maxLines: 5,
            decoration: BorderlessInputDecoration(
              hintText: context.tr.collectionDescription,
            ),
            onChanged: context.read<CollectionFormCubit>().setDescription,
          ),
        ],
      ),
    );
  }

  void _saveChanges(BuildContext context, CollectionFormState state) {
    if (_formKey.currentState?.validate() == false) return;

    context.read<CollectionFormCubit>().save().then((_) {
      if (context.mounted) context.maybePop();
    });
  }
}
