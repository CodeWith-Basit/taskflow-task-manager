import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String avatarUrl =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeaderCard(),
            const SizedBox(height: 20),
            _buildSectionHeader("ACCOUNT & PREFERENCES"),
            const SizedBox(height: 10),
            _buildAccountPreferencesCard(),
            const SizedBox(height: 20),
            _buildSectionHeader("SUPPORT & APP"),
            const SizedBox(height: 10),
            _buildSupportAppCard(),
            const SizedBox(height: 20),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  // --- Top Profile Header Card ---
  Widget _buildProfileHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF0EDFB), width: 1),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.45],
          colors: [
            Color(0xFFF7F5FF),
            Colors.white,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar with purple border & camera badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(3.5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary,
                    width: 2.5,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    avatarUrl,
                    width: 82,
                    height: 82,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 82,
                      height: 82,
                      color: AppColors.primary.withValues(alpha: 0.1),
                      child: const Icon(
                        Icons.person,
                        size: 42,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 2,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.photo_camera_rounded,
                    size: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // User Name
          Text(
            "Alex Morgan",
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          // User Email
          Text(
            "alex@example.com",
            style: GoogleFonts.inter(
              fontSize: 13.5,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 10),
          // Pro Achiever Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFFF3EFFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.verified_outlined,
                  size: 14,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 5),
                Text(
                  "Pro Achiever",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          // Stats Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8FD),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatItem(
                    value: "142",
                    label: "Completed",
                    valueColor: AppColors.primary,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    value: "12 🔥",
                    label: "Day Streak",
                    valueColor: AppColors.textPrimary,
                  ),
                ),
                Expanded(
                  child: _buildStatItem(
                    value: "94%",
                    label: "On-time",
                    valueColor: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String value,
    required String label,
    required Color valueColor,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  // --- Section Header ---
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  // --- Account & Preferences Card ---
  Widget _buildAccountPreferencesCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF0F0F8), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.person_outline_rounded,
            title: "Edit Profile",
            subtitle: "Name, avatar & email",
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.notifications_none_rounded,
            title: "Notifications",
            subtitle: "Push alerts, daily briefing",
            trailingWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEDE9FE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Enabled",
                style: GoogleFonts.inter(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.palette_outlined,
            title: "Appearance & Theme",
            subtitle: "Lavender Clean style",
            trailingText: "Light Mode",
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.track_changes_outlined,
            title: "Focus & Reminders",
            subtitle: "Smart nudge intervals & DND",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // --- Support & App Card ---
  Widget _buildSupportAppCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF0F0F8), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSettingsTile(
            icon: Icons.shield_outlined,
            title: "Privacy & Security",
            subtitle: "Biometrics & cloud backup",
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.help_outline_rounded,
            title: "Help & Feedback",
            subtitle: "Guides, FAQs & chat support",
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingsTile(
            icon: Icons.info_outline_rounded,
            title: "About TaskFlow",
            subtitle: "Release notes & licensing",
            trailingText: "v1.4.0",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // --- Settings Tile ---
  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailingWidget,
    String? trailingText,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1EEFF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailingWidget != null) ...[
                trailingWidget,
                const SizedBox(width: 6),
              ],
              if (trailingText != null) ...[
                Text(
                  trailingText,
                  style: GoogleFonts.inter(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: 6),
              ],
              const Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: Color(0xFFB0B0C4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Divider between items inside cards
  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      indent: 70,
      endIndent: 16,
      color: Color(0xFFF4F4F8),
    );
  }

  // --- Log Out Button ---
  Widget _buildLogoutButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFFDECEE), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDECEE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.logout_rounded,
                    color: Color(0xFFE5484D),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 14),
                Text(
                  "Log Out",
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFE5484D),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_rounded,
                  color: Color(0xFFE5484D),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
