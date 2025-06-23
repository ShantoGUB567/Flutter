import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:image_picker/image_picker.dart';
import '../providers/auth_provider.dart';
import '../providers/recipe_provider.dart';
import '../constants/app_colors.dart';
import '../widgets/ingredient_chip.dart';
import '../widgets/input_method_button.dart';
import 'recipe_suggestions_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  
  final TextEditingController _ingredientController = TextEditingController();
  final SpeechToText _speechToText = SpeechToText();
  final ImagePicker _imagePicker = ImagePicker();
  
  bool _isListening = false;
  bool _isProcessingImage = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));
    
    _animationController.forward();
    _initializeSpeech();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _ingredientController.dispose();
    super.dispose();
  }

  Future<void> _initializeSpeech() async {
    await _speechToText.initialize();
  }

  void _addIngredient() {
    final ingredient = _ingredientController.text.trim();
    if (ingredient.isNotEmpty) {
      final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
      recipeProvider.addIngredient(ingredient);
      _ingredientController.clear();
    }
  }

  Future<void> _startVoiceInput() async {
    if (!_speechToText.isAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Speech recognition not available'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() {
      _isListening = true;
    });

    await _speechToText.listen(
      onResult: (result) {
        if (result.finalResult) {
          final recognizedWords = result.recognizedWords.toLowerCase();
          final ingredients = recognizedWords.split(RegExp(r'[,.\s]+'))
              .where((word) => word.length > 2)
              .toList();
          
          final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
          for (final ingredient in ingredients) {
            recipeProvider.addIngredient(ingredient);
          }
          
          setState(() {
            _isListening = false;
          });
        }
      },
      listenFor: const Duration(seconds: 10),
      pauseFor: const Duration(seconds: 3),
      partialResults: false,
      localeId: 'en_US',
    );
  }

  Future<void> _stopVoiceInput() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });
  }

  Future<void> _pickImage() async {
    setState(() {
      _isProcessingImage = true;
    });

    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      if (image != null) {
        // Simulate AI image processing
        await Future.delayed(const Duration(seconds: 2));
        
        // Mock ingredients from image
        final mockIngredients = ['tomato', 'onion', 'garlic', 'olive oil'];
        final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
        for (final ingredient in mockIngredients) {
          recipeProvider.addIngredient(ingredient);
        }
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ingredients detected from image!'),
              backgroundColor: AppColors.success,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error processing image: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      setState(() {
        _isProcessingImage = false;
      });
    }
  }

  Future<void> _getRecommendations() async {
    final recipeProvider = Provider.of<RecipeProvider>(context, listen: false);
    final ingredients = recipeProvider.ingredients;
    
    if (ingredients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add some ingredients first'),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    await recipeProvider.getRecipeRecommendations(ingredients);
    
    if (mounted) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RecipeSuggestionsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: SafeArea(
            child: Column(
              children: [
                // App Bar
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryOrange.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.primaryOrange,
                              AppColors.secondaryOrange,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryOrange.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.restaurant_menu,
                          color: AppColors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Food Bank',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.primaryOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'AI Recipe Recommendations',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.mediumGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person_outline),
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.accentOrange,
                          foregroundColor: AppColors.primaryOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Welcome Message
                        Consumer<AuthProvider>(
                          builder: (context, authProvider, child) {
                            final userName = authProvider.currentUser?.name ?? 'Chef';
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, $userName! 👋',
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'What ingredients do you have? Let\'s find the perfect recipe!',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.mediumGrey,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Input Methods
                        Text(
                          'Add Ingredients',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Input Method Buttons
                        Row(
                          children: [
                            Expanded(
                              child: InputMethodButton(
                                onPressed: _isListening ? _stopVoiceInput : _startVoiceInput,
                                icon: _isListening ? Icons.mic : Icons.mic_none,
                                label: _isListening ? 'Listening...' : 'Voice',
                                color: _isListening ? AppColors.error : AppColors.primaryOrange,
                                isLoading: _isListening,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: InputMethodButton(
                                onPressed: _isProcessingImage ? null : _pickImage,
                                icon: Icons.camera_alt_outlined,
                                label: 'Camera',
                                color: AppColors.tomatoRed,
                                isLoading: _isProcessingImage,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Text Input
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _ingredientController,
                                decoration: const InputDecoration(
                                  hintText: 'Type ingredients (e.g., chicken, rice)',
                                  prefixIcon: Icon(Icons.edit_outlined),
                                ),
                                onSubmitted: (_) => _addIngredient(),
                              ),
                            ),
                            const SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: _addIngredient,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Ingredients List
                        Consumer<RecipeProvider>(
                          builder: (context, recipeProvider, child) {
                            final ingredients = recipeProvider.ingredients;
                            
                            if (ingredients.isEmpty) {
                              return Container(
                                padding: const EdgeInsets.all(32),
                                decoration: BoxDecoration(
                                  color: AppColors.accentOrange.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: AppColors.primaryOrange.withOpacity(0.3),
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.inventory_2_outlined,
                                      size: 48,
                                      color: AppColors.primaryOrange.withOpacity(0.6),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'No ingredients added yet',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: AppColors.mediumGrey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Add ingredients using voice, camera, or typing',
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                        color: AppColors.mediumGrey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            }
                            
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Your Ingredients (${ingredients.length})',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: recipeProvider.clearIngredients,
                                      child: const Text('Clear All'),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: ingredients.map((ingredient) {
                                    return IngredientChip(
                                      ingredient: ingredient,
                                      onRemove: () => recipeProvider.removeIngredient(ingredient),
                                    );
                                  }).toList(),
                                ),
                              ],
                            );
                          },
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Get Recommendations Button
                        SizedBox(
                          width: double.infinity,
                          child: Consumer<RecipeProvider>(
                            builder: (context, recipeProvider, child) {
                              return ElevatedButton(
                                onPressed: recipeProvider.ingredients.isEmpty ? null : _getRecommendations,
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  backgroundColor: recipeProvider.ingredients.isEmpty 
                                    ? AppColors.lightGrey 
                                    : AppColors.primaryOrange,
                                  elevation: recipeProvider.ingredients.isEmpty ? 0 : 8,
                                  shadowColor: AppColors.primaryOrange.withOpacity(0.3),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.auto_awesome),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Get AI Recommendations',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Quick Tips
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.warmBeige,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primaryOrange.withOpacity(0.2),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primaryOrange.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb_outline,
                                    color: AppColors.goldenYellow,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Quick Tips',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '• Use voice input for hands-free ingredient addition\n'
                                '• Take a photo of your ingredients for automatic detection\n'
                                '• Add as many ingredients as you have for better recommendations\n'
                                '• The AI will suggest recipes based on your dietary preferences',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.darkGrey,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 