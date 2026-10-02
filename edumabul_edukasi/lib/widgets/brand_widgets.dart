import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class EdumabulLogo extends StatelessWidget {
  final double size;
  final bool showText;
  final Color textColor;

  const EdumabulLogo({
    Key? key,
    this.size = 40,
    this.showText = true,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.primaryYellow,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.shield,
              color: AppColors.primaryDark,
              size: size * 0.6,
            ),
          ),
        ),
        if (showText) ...[
          const SizedBox(width: 10),
          Text(
            'EDUMABUL',
            style: TextStyle(
              fontSize: size * 0.45,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ],
    );
  }
}

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onInstagramTap;

  const SocialLoginButtons({
    Key? key,
    this.onGoogleTap,
    this.onFacebookTap,
    this.onInstagramTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Icon
        _buildSocialItem(
          assetPath: 'assets/images/google.png',
          onTap: onGoogleTap ?? () {},
        ),
        const SizedBox(width: 16),

        // Facebook Icon
        _buildSocialItem(
          assetPath: 'assets/images/facebook.png',
          onTap: onFacebookTap ?? () {},
        ),
        const SizedBox(width: 16),

        // Instagram Icon
        _buildSocialItem(
          assetPath: 'assets/images/instagram.png',
          onTap: onInstagramTap ?? () {},
        ),
      ],
    );
  }

  Widget _buildSocialItem({
    required String assetPath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(
          11,
        ), // Padding agar logo tidak menempel ke garis tepi
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain, // Memastikan logo utuh & tidak terpotong
        ),
      ),
    );
  }
}
