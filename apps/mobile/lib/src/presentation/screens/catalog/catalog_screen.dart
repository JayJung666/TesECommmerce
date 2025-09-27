import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:atlantis_core/atlantis_core.dart';

import '../../widgets/common/app_bar.dart';
import '../../widgets/product/product_grid.dart';
import '../../widgets/common/shimmer_grid.dart';

class CatalogScreen extends ConsumerStatefulWidget {
  const CatalogScreen({super.key});

  @override
  ConsumerState<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends ConsumerState<CatalogScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Load initial products
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ref.read(catalogControllerProvider.notifier).loadProducts();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final catalogState = ref.watch(catalogControllerProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Atlantis Shop',
        showBackButton: false,
        actions: [
          // CartIconButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // await ref.read(catalogControllerProvider.notifier).refresh();
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: _buildSearchBar(context),
              ),
            ),
            
            // Categories (Horizontal scroll)
            SliverToBoxAdapter(
              child: _buildCategoriesSection(),
            ),
            
            // Featured Products Banner
            SliverToBoxAdapter(
              child: _buildFeaturedBanner(),
            ),
            
            // Products Grid
            SliverPadding(
              padding: const EdgeInsets.all(AppSpacing.md),
              sliver: _buildProductsGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to search screen
        // context.push('/search');
      },
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          children: [
            const SizedBox(width: AppSpacing.md),
            const Icon(
              Icons.search,
              color: AppColors.grey500,
              size: AppSpacing.iconMd,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                'Search products...',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.grey500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection() {
    // Mock categories for now
    final categories = [
      'Electronics',
      'Fashion',
      'Home & Garden',
      'Sports',
      'Books',
      'Toys',
    ];

    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = index == 0; // Mock selection
          
          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                // Handle category selection
              },
              backgroundColor: AppColors.grey100,
              selectedColor: AppColors.primary.withOpacity(0.2),
              checkmarkColor: AppColors.primary,
              labelStyle: AppTextStyles.labelMedium.copyWith(
                color: isSelected ? AppColors.primary : AppColors.grey700,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeaturedBanner() {
    return Container(
      margin: const EdgeInsets.all(AppSpacing.md),
      height: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
      ),
      child: Stack(
        children: [
          Positioned(
            left: AppSpacing.lg,
            top: AppSpacing.lg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Special Offer',
                  style: AppTextStyles.titleLarge.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Up to 50% off',
                  style: AppTextStyles.displaySmall.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to special offers
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: AppSpacing.sm,
                    ),
                  ),
                  child: const Text('Shop Now'),
                ),
              ],
            ),
          ),
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 120,
              color: AppColors.white.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsGrid() {
    // Mock loading state for now
    const isLoading = true;
    
    if (isLoading) {
      return const ShimmerGrid();
    }
    
    return const ProductGrid(
      products: [], // Will be populated from state
    );
  }
}