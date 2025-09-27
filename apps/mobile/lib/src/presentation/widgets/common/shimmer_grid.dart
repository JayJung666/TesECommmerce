import 'package:flutter/material.dart';
import 'package:atlantis_core/atlantis_core.dart';

class ShimmerGrid extends StatefulWidget {
  const ShimmerGrid({
    super.key,
    this.itemCount = 10,
    this.crossAxisCount = 2,
  });

  final int itemCount;
  final int crossAxisCount;

  @override
  State<ShimmerGrid> createState() => _ShimmerGridState();
}

class _ShimmerGridState extends State<ShimmerGrid>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppConstants.shimmerDuration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.crossAxisCount,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
        childAspectRatio: 0.7,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ShimmerItem(
              gradient: _createShimmerGradient(),
            );
          },
        ),
        childCount: widget.itemCount,
      ),
    );
  }

  LinearGradient _createShimmerGradient() {
    return LinearGradient(
      colors: [
        AppColors.grey200,
        AppColors.grey100,
        AppColors.grey200,
      ],
      stops: [
        0.0,
        0.5,
        1.0,
      ],
      begin: Alignment(_animation.value - 1, 0),
      end: Alignment(_animation.value, 0),
    );
  }
}

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({
    super.key,
    required this.gradient,
  });

  final LinearGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.radiusMd),
                ),
              ),
            ),
          ),
          
          // Content placeholder
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title placeholder
                  Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  
                  // Subtitle placeholder
                  Container(
                    height: 12,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
                    ),
                  ),
                  const Spacer(),
                  
                  // Price placeholder
                  Container(
                    height: 16,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}