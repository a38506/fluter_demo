import 'package:flutter/material.dart';
import 'package:temp_project/theme/constants.dart';

class BannerSimple1Widget extends StatelessWidget {
  final String image;
  final String title;

  const BannerSimple1Widget(this.image, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final imageProvider = image.contains('http')
        ? NetworkImage(image)
        : AssetImage(image) as ImageProvider;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // ảnh nền
            AspectRatio(
              aspectRatio: 16 / 9, // tỉ lệ đẹp cho banner
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),

            // gradient overlay để nổi chữ
            Container(
              height: 160,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

            // tiêu đề
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                            color: Colors.black45,
                            offset: Offset(0, 1),
                            blurRadius: 4)
                      ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
