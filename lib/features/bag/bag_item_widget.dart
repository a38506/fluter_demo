import 'package:flutter/material.dart';

class BagItemWidget extends StatelessWidget {
  final String assets;

  const BagItemWidget(this.assets, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      clipBehavior: Clip.hardEdge,
      child: IntrinsicHeight(
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.25,
              child: Image.asset(
                assets,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12).copyWith(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'T-Shirt',
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Color: Gray  ',
                                    style: textTheme.bodySmall,
                                  ),
                                  Text(
                                    'Size: L',
                                    style: textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: kElevationToShadow[1],
                          ),
                          child: const Icon(Icons.remove, size: 16),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 32,
                          height: 32,
                          child: Text(
                            '1',
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: kElevationToShadow[1],
                          ),
                          child: const Icon(Icons.add, size: 16),
                        ),
                        Expanded(
                          child: Text(
                            '43\$',
                            textAlign: TextAlign.right,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
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
