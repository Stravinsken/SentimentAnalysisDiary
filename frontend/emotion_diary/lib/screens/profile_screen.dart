import 'package:flutter/material.dart';
import '../styles/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Map<String, dynamic> _userProfile = {
    'name': '사용자',
    'email': 'user@example.com',
    'joinDate': '2024년 1월',
    'totalDiaries': 42,
    'totalComforts': 15,
    'streak': 7,
  };

  final List<Map<String, dynamic>> _statistics = [
    {'label': '총 일기 수', 'value': '42', 'icon': Icons.edit_note},
    {'label': '위로한 횟수', 'value': '15', 'icon': Icons.favorite},
    {'label': '연속 기록', 'value': '7일', 'icon': Icons.local_fire_department},
    {'label': '가입일', 'value': '2024.01', 'icon': Icons.calendar_today},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // 헤더
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    '프로필',
                    style: AppTextStyles.h2.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // TODO: 설정 화면으로 이동
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    // 프로필 카드
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: AppDecorations.cardDecoration,
                      child: Column(
                        children: [
                          // 프로필 이미지
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          
                          // 사용자 정보
                          Text(
                            _userProfile['name'],
                            style: AppTextStyles.h3,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            _userProfile['email'],
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.md,
                              vertical: AppSpacing.xs,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              '${_userProfile['joinDate']} 가입',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // 통계 카드
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: AppDecorations.cardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '나의 통계',
                            style: AppTextStyles.h4,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: AppSpacing.md,
                              mainAxisSpacing: AppSpacing.md,
                              childAspectRatio: 2.5,
                            ),
                            itemCount: _statistics.length,
                            itemBuilder: (context, index) {
                              final stat = _statistics[index];
                              return _buildStatCard(stat);
                            },
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // 메뉴 카드
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: AppDecorations.cardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '설정',
                            style: AppTextStyles.h4,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          _buildMenuItem(
                            icon: Icons.person_outline,
                            title: '프로필 편집',
                            subtitle: '이름, 이메일 등 개인정보 수정',
                            onTap: () {
                              // TODO: 프로필 편집 화면으로 이동
                            },
                          ),
                          _buildMenuItem(
                            icon: Icons.notifications_outlined,
                            title: '알림 설정',
                            subtitle: '푸시 알림 및 이메일 알림 설정',
                            onTap: () {
                              // TODO: 알림 설정 화면으로 이동
                            },
                          ),
                          _buildMenuItem(
                            icon: Icons.privacy_tip_outlined,
                            title: '개인정보 보호',
                            subtitle: '데이터 수집 및 개인정보 처리방침',
                            onTap: () {
                              // TODO: 개인정보 보호 화면으로 이동
                            },
                          ),
                          _buildMenuItem(
                            icon: Icons.help_outline,
                            title: '도움말',
                            subtitle: '앱 사용법 및 FAQ',
                            onTap: () {
                              // TODO: 도움말 화면으로 이동
                            },
                          ),
                          _buildMenuItem(
                            icon: Icons.info_outline,
                            title: '앱 정보',
                            subtitle: '버전 정보 및 라이선스',
                            onTap: () {
                              // TODO: 앱 정보 화면으로 이동
                            },
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // 로그아웃 버튼
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _showLogoutDialog(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.error,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg,
                            vertical: AppSpacing.md,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        icon: const Icon(Icons.logout),
                        label: Text(
                          '로그아웃',
                          style: AppTextStyles.buttonMedium,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(Map<String, dynamic> stat) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              stat['icon'],
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stat['value'],
                  style: AppTextStyles.h4.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  stat['label'],
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: AppColors.primary,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.bodyMedium.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextStyles.caption,
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.textLight,
      ),
      onTap: onTap,
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          '로그아웃',
          style: AppTextStyles.h4,
        ),
        content: Text(
          '정말 로그아웃하시겠습니까?',
          style: AppTextStyles.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: 로그아웃 로직 구현
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('로그아웃되었습니다')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('로그아웃'),
          ),
        ],
      ),
    );
  }
} 