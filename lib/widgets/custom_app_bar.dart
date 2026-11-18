import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const FaIcon(
              FontAwesomeIcons.check,
              size: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: subtitle != null ? 18 : 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  height: 1.15,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: AppColors.textPrimary,
            size: 22,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 18,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400",
                height: 36,
                width: 36,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSORJgezgSVfKPU9hI13wkD0Sfci6HzUbCAagmVyBvbudVidHqWurj2scrO&s=10",
                  height: 36,
                  width: 36,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
