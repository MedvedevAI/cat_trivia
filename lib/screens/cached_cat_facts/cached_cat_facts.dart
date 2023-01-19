import 'package:cat_trivia/domain/model/cat_fact/cat_fact.dart';
import 'package:cat_trivia/screens/cached_cat_facts/bloc/cached_cat_facts_bloc.dart';
import 'package:cat_trivia/ui/colors.dart';
import 'package:cat_trivia/ui/spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CachedCatFacts extends StatefulWidget {
  const CachedCatFacts({Key? key}) : super(key: key);

  @override
  State<CachedCatFacts> createState() => _CachedCatFactsState();
}

class _CachedCatFactsState extends State<CachedCatFacts> {
  @override
  void initState() {
    context.read<CachedCatFactsBloc>().add(CachedCatFactsEvent.fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        title: Text('History cat facts'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<CachedCatFactsBloc, CachedCatFactsState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => Container(),
                error: (state) => Center(
                  child: Text(state.failure),
                ),
                loaded: (state) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => Spacings.s16,
                    itemCount: state.cachedCatFact.length,
                    itemBuilder: (context, index) {
                      final fact = state.cachedCatFact[index];

                      return _FactComponent(fact: fact);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _FactComponent extends StatelessWidget {
  const _FactComponent({Key? key, required this.fact}) : super(key: key);

  final CatFact fact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.memory(
                fact.image,
                fit: BoxFit.contain,
              ),
            ),
            Spacings.s16,
            Expanded(
              child: Text(
                fact.fact,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.text,
                ),
              ),
            ),
          ],
        ),
        Spacings.s8,
        Text(
          DateFormat('d MMMM y hh:mm').format(fact.creationDate),
          style: TextStyle(
            fontSize: 14,
            color: AppColors.text,
          ),
        ),
      ],
    );
  }
}
