import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../providers/auth_provider.dart';
import '../constants/app_colors.dart';

class RecipeDetailsScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({
    super.key,
    required this.recipe,
  });

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool _showAppBar = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset > 200 && !_showAppBar) {
      setState(() {
        _showAppBar = true;
      });
    } else if (_scrollController.offset <= 200 && _showAppBar) {
      setState(() {
        _showAppBar = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // App Bar
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: AppColors.primaryOrange,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  final isSaved = authProvider.isRecipeSaved(widget.recipe.id);
                  return IconButton(
                    icon: Icon(
                      isSaved ? Icons.favorite : Icons.favorite_border,
                      color: AppColors.white,
                    ),
                    onPressed: () {
                      authProvider.toggleSavedRecipe(widget.recipe.id);
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.share, color: AppColors.white),
                onPressed: () {
                  // Share functionality
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.recipe.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppColors.lightGrey,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.lightGrey,
                      child: const Icon(
                        Icons.restaurant,
                        size: 100,
                        color: AppColors.mediumGrey,
                      ),
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Recipe info overlay
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Match Score
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryOrange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.auto_awesome,
                                size: 16,
                                color: AppColors.white,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${widget.recipe.matchScore.toInt()}% Match',
                                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Title
                        Text(
                          widget.recipe.title,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Quick info
                        Row(
                          children: [
                            _buildQuickInfo(
                              context,
                              Icons.schedule,
                              '${widget.recipe.prepTime + widget.recipe.cookTime} min',
                            ),
                            const SizedBox(width: 16),
                            _buildQuickInfo(
                              context,
                              Icons.people,
                              '${widget.recipe.servings} servings',
                            ),
                            const SizedBox(width: 16),
                            _buildQuickInfo(
                              context,
                              Icons.star,
                              widget.recipe.rating.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Content
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Description
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    widget.recipe.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.darkGrey,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
                // Tags
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.recipe.tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.freshGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag,
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.primaryOrange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Tab Bar
                Container(
                  color: AppColors.white,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: AppColors.primaryOrange,
                    unselectedLabelColor: AppColors.mediumGrey,
                    indicatorColor: AppColors.primaryOrange,
                    tabs: const [
                      Tab(text: 'Ingredients'),
                      Tab(text: 'Instructions'),
                      Tab(text: 'Nutrition'),
                      Tab(text: 'Substitutions'),
                    ],
                  ),
                ),
                
                // Tab Views
                SizedBox(
                  height: 600, // Fixed height for tab content
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildIngredientsTab(),
                      _buildInstructionsTab(),
                      _buildNutritionTab(),
                      _buildSubstitutionsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickInfo(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.white),
        const SizedBox(width: 4),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widget.recipe.ingredients.length,
      itemBuilder: (context, index) {
        final ingredient = widget.recipe.ingredients[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primaryOrange,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInstructionsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widget.recipe.instructions.length,
      itemBuilder: (context, index) {
        final instruction = widget.recipe.instructions[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.primaryOrange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  instruction,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.black,
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNutritionTab() {
    final nutrition = widget.recipe.nutritionInfo;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Calories
          _buildNutritionCard(
            context,
            'Calories',
            '${nutrition.calories.toInt()}',
            'kcal',
            Icons.local_fire_department,
            AppColors.goldenYellow,
          ),
          const SizedBox(height: 16),
          
          // Macronutrients
          Row(
            children: [
              Expanded(
                child: _buildNutritionCard(
                  context,
                  'Protein',
                  '${nutrition.protein.toInt()}',
                  'g',
                  Icons.fitness_center,
                  AppColors.freshGreen,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildNutritionCard(
                  context,
                  'Carbs',
                  '${nutrition.carbs.toInt()}',
                  'g',
                  Icons.grain,
                  AppColors.tomatoRed,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildNutritionCard(
                  context,
                  'Fat',
                  '${nutrition.fat.toInt()}',
                  'g',
                  Icons.water_drop,
                  AppColors.goldenYellow,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Micronutrients
          Row(
            children: [
              Expanded(
                child: _buildNutritionCard(
                  context,
                  'Fiber',
                  '${nutrition.fiber.toInt()}',
                  'g',
                  Icons.eco,
                  AppColors.primaryOrange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildNutritionCard(
                  context,
                  'Sugar',
                  '${nutrition.sugar.toInt()}',
                  'g',
                  Icons.cake,
                  AppColors.tomatoRed,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildNutritionCard(
                  context,
                  'Sodium',
                  '${nutrition.sodium.toInt()}',
                  'mg',
                  Icons.restaurant_menu,
                  AppColors.primaryOrange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionCard(
    BuildContext context,
    String title,
    String value,
    String unit,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.mediumGrey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            unit,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.mediumGrey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubstitutionsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: widget.recipe.substitutions.length,
      itemBuilder: (context, index) {
        final substitution = widget.recipe.substitutions[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primaryOrange.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primaryOrange,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.swap_horiz,
                  color: AppColors.primaryOrange,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    substitution,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
} 