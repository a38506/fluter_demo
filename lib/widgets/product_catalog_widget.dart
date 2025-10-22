import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:temp_project/theme/app_icons.dart';
import '../models/product.dart';

class ProductCatalogWidget extends StatelessWidget {
  final Product product;

  const ProductCatalogWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final imageUrl = (product.images.isNotEmpty) ? product.images.first : null;

    return Card(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: SizedBox(
        height: 112,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: imageUrl != null
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Image.asset(AppIcons.demoProduct1, fit: BoxFit.cover),
                    )
                  : Image.asset(AppIcons.demoProduct1, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      product.description ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).hintColor,
                          ),
                    ),
                    Row(
                      children: <Widget>[
                        RatingBarIndicator(
                          rating: 4.2, // giả lập rating
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(12)',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Text(
                      '${product.price.toStringAsFixed(0)}đ',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
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
