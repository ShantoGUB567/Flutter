import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models
import 'models/recipe.dart';

// Providers
import 'providers/auth_provider.dart';
import 'providers/recipe_provider.dart';

// Screens
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/recipe_details_screen.dart';
import 'screens/recipe_suggestions_screen.dart';

// Widgets
import 'widgets/ingredient_chip.dart';
import 'widgets/input_method_button.dart';
import 'widgets/recipe_card.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/social_login_button.dart';

// Constants
import 'constants/app_colors.dart';
import 'constants/app_theme.dart';

void main() {
  runApp(const FoodBankDemoApp());
}

class FoodBankDemoApp extends StatelessWidget {
  const FoodBankDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: MaterialApp(
        title: 'Food Bank Demo',
        theme: AppTheme.lightTheme,
        home: const DemoHomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class DemoHomeScreen extends StatelessWidget {
  const DemoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Bank - Component Demo'),
        backgroundColor: AppColors.primaryOrange,
        foregroundColor: AppColors.white,
        elevation: 8,
        shadowColor: AppColors.primaryOrange.withOpacity(0.3),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: _demoItems.length,
        itemBuilder: (context, index) {
          final item = _demoItems[index];
          return _DemoCard(
            title: item.title,
            subtitle: item.subtitle,
            icon: item.icon,
            onTap: () => item.onTap(context),
          );
        },
      ),
    );
  }
}

class _DemoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _DemoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: AppColors.primaryOrange.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.creamWhite,
                AppColors.accentOrange,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryOrange.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(icon, size: 32, color: AppColors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.mediumGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Demo items configuration
class _DemoItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function(BuildContext) onTap;

  const _DemoItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });
}

final List<_DemoItem> _demoItems = [
  // Full Screens
  _DemoItem(
    title: 'Welcome Screen',
    subtitle: 'Login & Signup',
    icon: Icons.login,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    ),
  ),
  _DemoItem(
    title: 'Home Screen',
    subtitle: 'Ingredient Input',
    icon: Icons.home,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    ),
  ),
  _DemoItem(
    title: 'Profile Screen',
    subtitle: 'User Preferences',
    icon: Icons.person,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    ),
  ),
  _DemoItem(
    title: 'Recipe Suggestions',
    subtitle: 'Recipe List',
    icon: Icons.list,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RecipeSuggestionsScreen()),
    ),
  ),
  _DemoItem(
    title: 'Recipe Details',
    subtitle: 'Full Recipe View',
    icon: Icons.restaurant_menu,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecipeDetailsScreen(
          recipe: _createMockRecipe(),
        ),
      ),
    ),
  ),
  
  // Widget Components
  _DemoItem(
    title: 'Recipe Card',
    subtitle: 'Recipe Display Widget',
    icon: Icons.card_giftcard,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('Recipe Card Demo')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: RecipeCard(
              recipe: _createMockRecipe(),
              onTap: () {},
            ),
          ),
        ),
      ),
    ),
  ),
  _DemoItem(
    title: 'Ingredient Chip',
    subtitle: 'Ingredient Display',
    icon: Icons.label,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('Ingredient Chip Demo')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                IngredientChip(
                  ingredient: 'tomato',
                  onRemove: () {},
                ),
                const SizedBox(height: 16),
                IngredientChip(
                  ingredient: 'onion',
                  onRemove: () {},
                ),
                const SizedBox(height: 16),
                IngredientChip(
                  ingredient: 'garlic',
                  onRemove: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ),
  _DemoItem(
    title: 'Input Method Button',
    subtitle: 'Voice & Camera Input',
    icon: Icons.mic,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('Input Method Button Demo')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                InputMethodButton(
                  onPressed: () {},
                  icon: Icons.mic_none,
                  label: 'Voice',
                  color: AppColors.primaryOrange,
                ),
                const SizedBox(height: 16),
                InputMethodButton(
                  onPressed: () {},
                  icon: Icons.camera_alt_outlined,
                  label: 'Camera',
                  color: AppColors.tomatoRed,
                ),
                const SizedBox(height: 16),
                InputMethodButton(
                  onPressed: null,
                  icon: Icons.mic,
                  label: 'Loading...',
                  color: AppColors.error,
                  isLoading: true,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ),
  _DemoItem(
    title: 'Search Bar',
    subtitle: 'Search Input Widget',
    icon: Icons.search,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('Search Bar Demo')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBarWidget(
              controller: TextEditingController(),
              onChanged: (value) {},
            ),
          ),
        ),
      ),
    ),
  ),
  _DemoItem(
    title: 'Social Login Button',
    subtitle: 'OAuth Buttons',
    icon: Icons.login,
    onTap: (context) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('Social Login Button Demo')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SocialLoginButton(
                  onPressed: () {},
                  icon: Icons.g_mobiledata,
                  label: 'Google',
                  color: const Color(0xFFDB4437),
                ),
                const SizedBox(height: 16),
                SocialLoginButton(
                  onPressed: () {},
                  icon: Icons.apple,
                  label: 'Apple',
                  color: AppColors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ),
];

// Helper function to create mock recipe data
Recipe _createMockRecipe() {
  return Recipe(
    id: 'demo_recipe',
    title: 'Creamy Mushroom Pasta',
    description: 'A delicious vegetarian pasta with creamy mushroom sauce',
    imageUrl: 'https://images.unsplash.com/photo-1621996346565-e3dbc353d2e5?w=400',
    ingredients: [
      'pasta',
      'mushrooms',
      'cream',
      'garlic',
      'parmesan cheese',
      'olive oil',
      'salt',
      'pepper'
    ],
    instructions: [
      'Cook pasta according to package instructions',
      'Sauté mushrooms and garlic in olive oil',
      'Add cream and simmer for 5 minutes',
      'Toss with cooked pasta and parmesan',
      'Season with salt and pepper'
    ],
    prepTime: 10,
    cookTime: 20,
    servings: 4,
    matchScore: 95.0,
    tags: ['vegetarian', 'quick', 'pasta'],
    cuisine: 'Italian',
    nutritionInfo: NutritionInfo(
      calories: 450,
      protein: 15,
      carbs: 65,
      fat: 18,
      fiber: 4,
      sugar: 3,
      sodium: 800,
    ),
    substitutions: [
      'Use almond milk instead of cream for dairy-free',
      'Replace parmesan with nutritional yeast for vegan'
    ],
    rating: 4.5,
    reviewCount: 128,
  );
}