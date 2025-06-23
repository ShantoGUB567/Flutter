class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTime; // in minutes
  final int cookTime; // in minutes
  final int servings;
  final double matchScore; // AI match score (0-100)
  final List<String> tags; // e.g., ["vegan", "gluten-free", "quick"]
  final String cuisine; // e.g., "Italian", "Mexican"
  final NutritionInfo nutritionInfo;
  final List<String> substitutions;
  final bool isSaved;
  final double rating;
  final int reviewCount;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
    required this.prepTime,
    required this.cookTime,
    required this.servings,
    required this.matchScore,
    required this.tags,
    required this.cuisine,
    required this.nutritionInfo,
    required this.substitutions,
    this.isSaved = false,
    this.rating = 0.0,
    this.reviewCount = 0,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
      prepTime: json['prepTime'] ?? 0,
      cookTime: json['cookTime'] ?? 0,
      servings: json['servings'] ?? 1,
      matchScore: (json['matchScore'] ?? 0.0).toDouble(),
      tags: List<String>.from(json['tags'] ?? []),
      cuisine: json['cuisine'] ?? '',
      nutritionInfo: NutritionInfo.fromJson(json['nutritionInfo'] ?? {}),
      substitutions: List<String>.from(json['substitutions'] ?? []),
      isSaved: json['isSaved'] ?? false,
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTime': prepTime,
      'cookTime': cookTime,
      'servings': servings,
      'matchScore': matchScore,
      'tags': tags,
      'cuisine': cuisine,
      'nutritionInfo': nutritionInfo.toJson(),
      'substitutions': substitutions,
      'isSaved': isSaved,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }

  Recipe copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    List<String>? ingredients,
    List<String>? instructions,
    int? prepTime,
    int? cookTime,
    int? servings,
    double? matchScore,
    List<String>? tags,
    String? cuisine,
    NutritionInfo? nutritionInfo,
    List<String>? substitutions,
    bool? isSaved,
    double? rating,
    int? reviewCount,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      prepTime: prepTime ?? this.prepTime,
      cookTime: cookTime ?? this.cookTime,
      servings: servings ?? this.servings,
      matchScore: matchScore ?? this.matchScore,
      tags: tags ?? this.tags,
      cuisine: cuisine ?? this.cuisine,
      nutritionInfo: nutritionInfo ?? this.nutritionInfo,
      substitutions: substitutions ?? this.substitutions,
      isSaved: isSaved ?? this.isSaved,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }
}

class NutritionInfo {
  final double calories;
  final double protein;
  final double carbs;
  final double fat;
  final double fiber;
  final double sugar;
  final double sodium;

  NutritionInfo({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.fiber,
    required this.sugar,
    required this.sodium,
  });

  factory NutritionInfo.fromJson(Map<String, dynamic> json) {
    return NutritionInfo(
      calories: (json['calories'] ?? 0.0).toDouble(),
      protein: (json['protein'] ?? 0.0).toDouble(),
      carbs: (json['carbs'] ?? 0.0).toDouble(),
      fat: (json['fat'] ?? 0.0).toDouble(),
      fiber: (json['fiber'] ?? 0.0).toDouble(),
      sugar: (json['sugar'] ?? 0.0).toDouble(),
      sodium: (json['sodium'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'fiber': fiber,
      'sugar': sugar,
      'sodium': sodium,
    };
  }
} 