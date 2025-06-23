import 'package:flutter/material.dart';
import '../models/recipe.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> _filteredRecipes = [];
  List<String> _ingredients = [];
  bool _isLoading = false;
  String _searchQuery = '';

  List<Recipe> get recipes => _recipes;
  List<Recipe> get filteredRecipes => _filteredRecipes;
  List<String> get ingredients => _ingredients;
  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void addIngredient(String ingredient) {
    if (!_ingredients.contains(ingredient.toLowerCase())) {
      _ingredients.add(ingredient.toLowerCase());
      notifyListeners();
    }
  }

  void removeIngredient(String ingredient) {
    _ingredients.remove(ingredient.toLowerCase());
    notifyListeners();
  }

  void clearIngredients() {
    _ingredients.clear();
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    _filterRecipes();
    notifyListeners();
  }

  void _filterRecipes() {
    if (_searchQuery.isEmpty) {
      _filteredRecipes = _recipes;
    } else {
      _filteredRecipes = _recipes.where((recipe) {
        return recipe.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               recipe.tags.any((tag) => tag.toLowerCase().contains(_searchQuery.toLowerCase())) ||
               recipe.cuisine.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  Future<void> getRecipeRecommendations(List<String> ingredients) async {
    setLoading(true);
    
    // Simulate AI API call
    await Future.delayed(const Duration(seconds: 3));
    
    // Mock recipe data
    _recipes = [
      Recipe(
        id: '1',
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
      ),
      Recipe(
        id: '2',
        title: 'Quinoa Buddha Bowl',
        description: 'Healthy and colorful quinoa bowl with roasted vegetables',
        imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=400',
        ingredients: [
          'quinoa',
          'sweet potato',
          'chickpeas',
          'kale',
          'avocado',
          'tahini',
          'lemon',
          'olive oil'
        ],
        instructions: [
          'Cook quinoa according to package instructions',
          'Roast sweet potato and chickpeas at 400°F for 25 minutes',
          'Massage kale with olive oil and lemon juice',
          'Assemble bowl with quinoa, vegetables, and avocado',
          'Drizzle with tahini dressing'
        ],
        prepTime: 15,
        cookTime: 30,
        servings: 2,
        matchScore: 88.0,
        tags: ['vegan', 'gluten-free', 'healthy'],
        cuisine: 'Mediterranean',
        nutritionInfo: NutritionInfo(
          calories: 380,
          protein: 12,
          carbs: 45,
          fat: 16,
          fiber: 8,
          sugar: 6,
          sodium: 450,
        ),
        substitutions: [
          'Use brown rice instead of quinoa',
          'Replace tahini with hummus'
        ],
        rating: 4.8,
        reviewCount: 95,
      ),
      Recipe(
        id: '3',
        title: 'Spicy Thai Curry',
        description: 'Aromatic Thai curry with coconut milk and fresh herbs',
        imageUrl: 'https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?w=400',
        ingredients: [
          'coconut milk',
          'curry paste',
          'vegetables',
          'tofu',
          'fish sauce',
          'lime',
          'basil',
          'rice'
        ],
        instructions: [
          'Sauté curry paste in oil until fragrant',
          'Add coconut milk and bring to simmer',
          'Add vegetables and tofu',
          'Simmer for 15 minutes',
          'Season with fish sauce and lime juice',
          'Garnish with fresh basil'
        ],
        prepTime: 20,
        cookTime: 25,
        servings: 4,
        matchScore: 82.0,
        tags: ['vegan', 'spicy', 'curry'],
        cuisine: 'Thai',
        nutritionInfo: NutritionInfo(
          calories: 320,
          protein: 14,
          carbs: 28,
          fat: 22,
          fiber: 6,
          sugar: 4,
          sodium: 1200,
        ),
        substitutions: [
          'Use soy sauce instead of fish sauce for vegan',
          'Replace tofu with chicken for non-vegetarian'
        ],
        rating: 4.6,
        reviewCount: 203,
      ),
      Recipe(
        id: '4',
        title: 'Mediterranean Salmon',
        description: 'Baked salmon with Mediterranean herbs and vegetables',
        imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=400',
        ingredients: [
          'salmon fillet',
          'olive oil',
          'lemon',
          'herbs',
          'tomatoes',
          'olives',
          'garlic',
          'white wine'
        ],
        instructions: [
          'Preheat oven to 400°F',
          'Place salmon on baking sheet',
          'Drizzle with olive oil and lemon juice',
          'Add herbs, tomatoes, and olives',
          'Bake for 15-20 minutes',
          'Serve with white wine sauce'
        ],
        prepTime: 10,
        cookTime: 20,
        servings: 2,
        matchScore: 75.0,
        tags: ['pescatarian', 'high-protein', 'mediterranean'],
        cuisine: 'Mediterranean',
        nutritionInfo: NutritionInfo(
          calories: 420,
          protein: 35,
          carbs: 8,
          fat: 28,
          fiber: 3,
          sugar: 4,
          sodium: 650,
        ),
        substitutions: [
          'Use chicken breast instead of salmon',
          'Replace white wine with vegetable broth'
        ],
        rating: 4.7,
        reviewCount: 156,
      ),
      Recipe(
        id: '5',
        title: 'Chocolate Avocado Smoothie',
        description: 'Creamy chocolate smoothie with hidden avocado goodness',
        imageUrl: 'https://images.unsplash.com/photo-1553530666-ba11a7da3888?w=400',
        ingredients: [
          'avocado',
          'cocoa powder',
          'banana',
          'almond milk',
          'honey',
          'vanilla extract',
          'ice'
        ],
        instructions: [
          'Blend all ingredients until smooth',
          'Add more ice if needed for desired consistency',
          'Pour into glass and enjoy immediately'
        ],
        prepTime: 5,
        cookTime: 0,
        servings: 1,
        matchScore: 70.0,
        tags: ['vegan', 'quick', 'smoothie', 'dessert'],
        cuisine: 'American',
        nutritionInfo: NutritionInfo(
          calories: 280,
          protein: 6,
          carbs: 32,
          fat: 18,
          fiber: 8,
          sugar: 24,
          sodium: 120,
        ),
        substitutions: [
          'Use maple syrup instead of honey for vegan',
          'Replace almond milk with coconut milk'
        ],
        rating: 4.3,
        reviewCount: 89,
      ),
    ];
    
    _filterRecipes();
    setLoading(false);
  }

  Recipe? getRecipeById(String id) {
    try {
      return _recipes.firstWhere((recipe) => recipe.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Recipe> getSavedRecipes(List<String> savedIds) {
    return _recipes.where((recipe) => savedIds.contains(recipe.id)).toList();
  }

  List<Recipe> getRecipesByCuisine(String cuisine) {
    return _recipes.where((recipe) => recipe.cuisine.toLowerCase() == cuisine.toLowerCase()).toList();
  }

  List<Recipe> getRecipesByTag(String tag) {
    return _recipes.where((recipe) => recipe.tags.contains(tag)).toList();
  }
} 