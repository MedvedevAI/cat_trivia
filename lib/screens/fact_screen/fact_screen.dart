import 'dart:typed_data';

import 'package:cat_trivia/screens/cached_cat_facts/cached_cat_facts.dart';
import 'package:cat_trivia/screens/fact_screen/bloc/fact_bloc.dart';
import 'package:cat_trivia/ui/colors.dart';
import 'package:cat_trivia/ui/spacings.dart';
import 'package:cat_trivia/widgets/custom_button.dart';
import 'package:cat_trivia/widgets/shimmer_sceleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactScreen extends StatelessWidget {
  const FactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B2124),
      body: BlocBuilder<FactBloc, FactState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => _LoadFact(),
            loaded: (state) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      _CatImage(image: state.catFact.image),
                      Spacings.s24,
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            state.catFact.fact,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                      ),
                      Spacings.s24,
                      CustomButton(
                        text: 'Fact history',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CachedCatFacts()),
                        ),
                      ),
                      Spacings.s8,
                      CustomButton(
                        text: 'Another fact!',
                        onTap: () => context.read<FactBloc>().add(FactEvent.fetch()),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (state) => Center(
              child: Text(state.failure),
            ),
          );
        },
      ),
    );
  }
}

class _CatImage extends StatelessWidget {
  const _CatImage({Key? key, required this.image}) : super(key: key);

  final Uint8List image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF31393D),
        borderRadius: BorderRadius.circular(16),
      ),
      width: height * .4,
      height: height * .4,
      child: Image.memory(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _LoadFact extends StatelessWidget {
  const _LoadFact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ShimmerContainer(
              width: height * .4,
              height: height * .4,
            ),
            Spacer(),
            ShimmerContainer(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                '',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Spacings.s8,
            ShimmerContainer(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                '',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
