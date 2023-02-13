import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/home_view_model.dart';

class HomePage extends  ConsumerViewModelWidget<HomePageViewModel> {
  const HomePage({Key? key}) : super(key: key);

  // @override
  // State<HomePage> createState() => _HomePageState();

  @override
  AutoDisposeProvider<HomePageViewModel> viewModelProvider() => secondScreenControllerProvider;

  @override
  Widget buildWidget(BuildContext context, WidgetRef ref, HomePageViewModel viewModel) {
    print("widget build");
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(ref),
    );
  }

  Widget buildBody(WidgetRef ref) {
    return Column(
      children: [
        const Expanded(child: Center(child: CounterText())),
        Padding(
          padding: const EdgeInsets.all(16),
          child: MaterialButton(
            onPressed: () {
              viewModel(ref).increaseCounter();
            },
            child: const Text("+"),
          ),
        )
      ],
    );
  }
}



class CounterText extends ConsumerViewModelWidget<HomePageViewModel> {

  const CounterText({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, WidgetRef ref, HomePageViewModel viewModel) {
    final counterState = ref.watch(viewModel.counterChange);
    return Text("Your are pressed $counterState ");
  }

  @override
  AutoDisposeProvider<HomePageViewModel> viewModelProvider() => secondScreenControllerProvider;
}






class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Text("Home page"),
    );
  }
}
