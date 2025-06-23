import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/recipe_provider.dart';
import '../constants/app_colors.dart';
import '../models/user.dart';
import '../widgets/recipe_card.dart';
import 'recipe_details_screen.dart';
import 'welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _selectedDietaryPreferences = [];
  List<String> _selectedCuisinePreferences = [];
  List<String> _selectedAllergies = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadUserPreferences();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _loadUserPreferences() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.currentUser;
    if (user != null) {
      setState(() {
        _selectedDietaryPreferences = List.from(user.dietaryPreferences);
        _selectedCuisinePreferences = List.from(user.cuisinePreferences);
        _selectedAllergies = List.from(user.allergies);
      });
    }
  }

  void _savePreferences() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.updateUserPreferences(
      dietaryPreferences: _selectedDietaryPreferences,
      cuisinePreferences: _selectedCuisinePreferences,
      allergies: _selectedAllergies,
    );
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Preferences saved successfully!'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _signOut() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.signOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          final user = authProvider.currentUser;
          
          if (user == null) {
            return const Center(
              child: Text('Please sign in to view your profile'),
            );
          }

          return Column(
            children: [
              // Profile Header
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Profile Image
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: user.profileImageUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(
                              user.profileImageUrl!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: AppColors.white,
                                );
                              },
                            ),
                          )
                        : const Icon(
                            Icons.person,
                            size: 40,
                            color: AppColors.white,
                          ),
                    ),
                    const SizedBox(height: 16),
                    
                    // User Info
                    Text(
                      user.name ?? 'User',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.email,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.mediumGrey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem(
                          context,
                          'Saved Recipes',
                          user.savedRecipes.length.toString(),
                          Icons.favorite,
                        ),
                        _buildStatItem(
                          context,
                          'Dietary Preferences',
                          user.dietaryPreferences.length.toString(),
                          Icons.restaurant_menu,
                        ),
                        _buildStatItem(
                          context,
                          'Cuisine Preferences',
                          user.cuisinePreferences.length.toString(),
                          Icons.public,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Tab Bar
              Container(
                color: AppColors.white,
                child: TabBar(
                  controller: _tabController,
                  labelColor: AppColors.primaryOrange,
                  unselectedLabelColor: AppColors.mediumGrey,
                  indicatorColor: AppColors.primaryOrange,
                  tabs: const [
                    Tab(text: 'Preferences'),
                    Tab(text: 'Saved Recipes'),
                    Tab(text: 'Settings'),
                  ],
                ),
              ),
              
              // Tab Views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildPreferencesTab(),
                    _buildSavedRecipesTab(),
                    _buildSettingsTab(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primaryOrange, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.mediumGrey,
          ),
        ),
      ],
    );
  }

  Widget _buildPreferencesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dietary Preferences
          Text(
            'Dietary Preferences',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: DietaryPreferences.availablePreferences.map((preference) {
              final isSelected = _selectedDietaryPreferences.contains(preference);
              return FilterChip(
                label: Text(preference),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedDietaryPreferences.add(preference);
                    } else {
                      _selectedDietaryPreferences.remove(preference);
                    }
                  });
                },
              );
            }).toList(),
          ),
          
          const SizedBox(height: 32),
          
          // Cuisine Preferences
          Text(
            'Cuisine Preferences',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: CuisinePreferences.availableCuisines.map((cuisine) {
              final isSelected = _selectedCuisinePreferences.contains(cuisine);
              return FilterChip(
                label: Text(cuisine),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedCuisinePreferences.add(cuisine);
                    } else {
                      _selectedCuisinePreferences.remove(cuisine);
                    }
                  });
                },
              );
            }).toList(),
          ),
          
          const SizedBox(height: 32),
          
          // Allergies
          Text(
            'Allergies & Restrictions',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Add any food allergies or restrictions you have:',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.mediumGrey,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(
              hintText: 'e.g., peanuts, shellfish, gluten',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty && !_selectedAllergies.contains(value)) {
                setState(() {
                  _selectedAllergies.add(value);
                });
              }
            },
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _selectedAllergies.map((allergy) {
              return Chip(
                label: Text(allergy),
                onDeleted: () {
                  setState(() {
                    _selectedAllergies.remove(allergy);
                  });
                },
              );
            }).toList(),
          ),
          
          const SizedBox(height: 32),
          
          // Save Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _savePreferences,
              child: const Text('Save Preferences'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedRecipesTab() {
    return Consumer2<AuthProvider, RecipeProvider>(
      builder: (context, authProvider, recipeProvider, child) {
        final savedRecipeIds = authProvider.currentUser?.savedRecipes ?? [];
        final savedRecipes = recipeProvider.getSavedRecipes(savedRecipeIds);
        
        if (savedRecipes.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 64,
                  color: AppColors.mediumGrey,
                ),
                const SizedBox(height: 16),
                Text(
                  'No saved recipes yet',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.mediumGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Save recipes you like to find them here later',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.mediumGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }
        
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: savedRecipes.length,
          itemBuilder: (context, index) {
            final recipe = savedRecipes[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: RecipeCard(
                recipe: recipe,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailsScreen(recipe: recipe),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSettingsTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildSettingsSection(
          context,
          'Account',
          [
            _buildSettingsItem(
              context,
              Icons.person_outline,
              'Edit Profile',
              'Update your personal information',
              () {},
            ),
            _buildSettingsItem(
              context,
              Icons.email_outlined,
              'Change Email',
              'Update your email address',
              () {},
            ),
            _buildSettingsItem(
              context,
              Icons.lock_outline,
              'Change Password',
              'Update your password',
              () {},
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        
        _buildSettingsSection(
          context,
          'App Settings',
          [
            _buildSettingsItem(
              context,
              Icons.notifications_outlined,
              'Notifications',
              'Manage notification preferences',
              () {},
            ),
            _buildSettingsItem(
              context,
              Icons.language_outlined,
              'Language',
              'Change app language',
              () {},
            ),
            _buildSettingsItem(
              context,
              Icons.dark_mode_outlined,
              'Dark Mode',
              'Switch between light and dark themes',
              () {},
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        
        _buildSettingsSection(
          context,
          'Support',
          [
            _buildSettingsItem(
              context,
              Icons.help_outline,
              'Help & FAQ',
              'Get help and find answers',
              () {},
            ),
            _buildSettingsItem(
              context,
              Icons.feedback_outlined,
              'Send Feedback',
              'Share your thoughts with us',
              () {},
            ),
            _buildSettingsItem(
              context,
              Icons.info_outline,
              'About',
              'App version and information',
              () {},
            ),
          ],
        ),
        
        const SizedBox(height: 32),
        
        // Sign Out Button
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: _signOut,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: const BorderSide(color: AppColors.error),
            ),
            child: const Text('Sign Out'),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primaryOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryOrange),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.mediumGrey,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.mediumGrey),
      onTap: onTap,
    );
  }
} 