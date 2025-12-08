import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundimage,
    required this.subTitle,
    required this.title,
  });

  final String image, backgroundimage;
  final String subTitle;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundimage, fit: BoxFit.fill),
              ),
              Positioned.fill(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('تخط'),
              ),
            ],
          ),
        ),
      SizedBox(height: 64,),
      title,
      SizedBox(height: 24,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(subTitle,textAlign: TextAlign.center,),
      ),
      ],
    );
  }
}
