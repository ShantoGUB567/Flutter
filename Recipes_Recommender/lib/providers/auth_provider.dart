import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _currentUser?.isLoggedIn ?? false;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<bool> signInWithEmail(String email, String password) async {
    setLoading(true);
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    // Mock user data
    _currentUser = User(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      name: email.split('@')[0],
      isLoggedIn: true,
    );
    
    setLoading(false);
    notifyListeners();
    return true;
  }

  Future<bool> signUpWithEmail(String email, String password, String name) async {
    setLoading(true);
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    // Mock user data
    _currentUser = User(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      name: name,
      isLoggedIn: true,
    );
    
    setLoading(false);
    notifyListeners();
    return true;
  }

  Future<bool> signInWithGoogle() async {
    setLoading(true);
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    // Mock user data
    _currentUser = User(
      id: 'google_user_${DateTime.now().millisecondsSinceEpoch}',
      email: 'user@gmail.com',
      name: 'Google User',
      profileImageUrl: 'https://via.placeholder.com/150',
      isLoggedIn: true,
    );
    
    setLoading(false);
    notifyListeners();
    return true;
  }

  Future<bool> signInWithApple() async {
    setLoading(true);
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    // Mock user data
    _currentUser = User(
      id: 'apple_user_${DateTime.now().millisecondsSinceEpoch}',
      email: 'user@icloud.com',
      name: 'Apple User',
      isLoggedIn: true,
    );
    
    setLoading(false);
    notifyListeners();
    return true;
  }

  void signOut() {
    _currentUser = null;
    notifyListeners();
  }

  void updateUserPreferences({
    List<String>? dietaryPreferences,
    List<String>? cuisinePreferences,
    List<String>? allergies,
  }) {
    if (_currentUser != null) {
      _currentUser = _currentUser!.copyWith(
        dietaryPreferences: dietaryPreferences,
        cuisinePreferences: cuisinePreferences,
        allergies: allergies,
      );
      notifyListeners();
    }
  }

  void toggleSavedRecipe(String recipeId) {
    if (_currentUser != null) {
      final savedRecipes = List<String>.from(_currentUser!.savedRecipes);
      
      if (savedRecipes.contains(recipeId)) {
        savedRecipes.remove(recipeId);
      } else {
        savedRecipes.add(recipeId);
      }
      
      _currentUser = _currentUser!.copyWith(savedRecipes: savedRecipes);
      notifyListeners();
    }
  }

  bool isRecipeSaved(String recipeId) {
    return _currentUser?.savedRecipes.contains(recipeId) ?? false;
  }
} 