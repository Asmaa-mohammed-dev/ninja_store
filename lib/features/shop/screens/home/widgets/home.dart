import 'package:flutter/material.dart';
import 'package:ninja_store/common/widgets/custom_shapes/containers/curved%20_edges/primary_header_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [NPrimaryHeaderContainer(child: Column(children: []))],
        ),
      ),
    );
  }
}
