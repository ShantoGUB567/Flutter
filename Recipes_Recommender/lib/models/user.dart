class User {
  final String id;
  final String email;
  final String? name;
  final String? profileImageUrl;
  final List<String> dietaryPreferences;
  final List<String> cuisinePreferences;
  final List<String> allergies;
  final List<String> savedRecipes;
  final bool isLoggedIn;

  User({
    required this.id,
    required this.email,
    this.name,
    this.profileImageUrl,
    this.dietaryPreferences = const [],
    this.cuisinePreferences = const [],
    this.allergies = const [],
    this.savedRecipes = const [],
    this.isLoggedIn = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
      dietaryPreferences: List<String>.from(json['dietaryPreferences'] ?? []),
      cuisinePreferences: List<String>.from(json['cuisinePreferences'] ?? []),
      allergies: List<String>.from(json['allergies'] ?? []),
      savedRecipes: List<String>.from(json['savedRecipes'] ?? []),
      isLoggedIn: json['isLoggedIn'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'profileImageUrl': profileImageUrl,
      'dietaryPreferences': dietaryPreferences,
      'cuisinePreferences': cuisinePreferences,
      'allergies': allergies,
      'savedRecipes': savedRecipes,
      'isLoggedIn': isLoggedIn,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? profileImageUrl,
    List<String>? dietaryPreferences,
    List<String>? cuisinePreferences,
    List<String>? allergies,
    List<String>? savedRecipes,
    bool? isLoggedIn,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      dietaryPreferences: dietaryPreferences ?? this.dietaryPreferences,
      cuisinePreferences: cuisinePreferences ?? this.cuisinePreferences,
      allergies: allergies ?? this.allergies,
      savedRecipes: savedRecipes ?? this.savedRecipes,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

class DietaryPreferences {
  static const List<String> availablePreferences = [
    'Vegetarian',
    'Vegan',
    'Gluten-Free',
    'Dairy-Free',
    'Keto',
    'Paleo',
    'Low-Carb',
    'Low-Sodium',
    'High-Protein',
    'Mediterranean',
    'Pescatarian',
    'Halal',
    'Kosher',
  ];
}

class CuisinePreferences {
  static const List<String> availableCuisines = [
    'Italian',
    'Mexican',
    'Chinese',
    'Japanese',
    'Indian',
    'Thai',
    'Mediterranean',
    'French',
    'American',
    'Greek',
    'Spanish',
    'Korean',
    'Vietnamese',
    'Middle Eastern',
    'African',
    'Caribbean',
    'Latin American',
  ];
} 