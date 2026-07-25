// ===== Flutter & Core Packages =====
export 'dart:convert';
export 'package:flutter/material.dart';
export 'package:flutter_gap/flutter_gap.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';

// ===== Core Constants, Services, & Global Widgets =====
export 'package:to_do/core/constants/app_assets.dart';

export 'package:to_do/core/widgets/custom_button.dart';
export 'package:to_do/core/widgets/custom_text_form.dart';
export 'package:to_do/core/widgets/custom_svg.dart';

// ===== Models =====
export 'package:to_do/models/task_model.dart';
// ===theme===
export 'core/theme/dark_theme.dart';
// ===== Features =====
// Splash
export 'package:to_do/features/splash/splash_screen.dart';

// Auth / Onboarding
export 'package:to_do/features/auth_onboarding/user_details_screen.dart';
export 'package:to_do/features/auth_onboarding/welcome_screen.dart';
export 'package:to_do/core/services/Preferences_Manager.dart';

// Navigation
export 'package:to_do/features/navigation/main_navigation_screen.dart';

// Tasks

export 'package:to_do/features/tasks/screens/completed_screen.dart';
export 'package:to_do/features/tasks/screens/new_task_screen.dart';
export 'package:to_do/features/tasks/screens/todo_screen.dart';
export 'package:to_do/features/tasks/widgets/high_priority_card.dart';
export 'package:to_do/features/tasks/widgets/task_list_item.dart';
export 'package:to_do/features/tasks/widgets/task_progress_card.dart';

// Profile
export 'package:to_do/features/profile/profile_screen.dart';

// theme
export 'core/theme/theme_controller.dart';
