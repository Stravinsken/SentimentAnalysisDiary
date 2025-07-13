import 'package:flutter/material.dart';
import '../styles/styles.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDate = DateTime.now();
  
  // 샘플 감정 데이터 (실제로는 데이터베이스에서 가져올 예정)
  final Map<String, Color> _emotionData = {
    '2024-01-15': AppColors.happy,
    '2024-01-16': AppColors.sad,
    '2024-01-17': AppColors.excited,
    '2024-01-18': AppColors.calm,
    '2024-01-19': AppColors.love,
    '2024-01-20': AppColors.angry,
    '2024-01-21': AppColors.neutral,
  };

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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '감정 일기장',
                        style: AppTextStyles.h2.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
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
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    '당신의 감정을 한눈에 확인하세요',
                    style: AppTextStyles.bodyMedium.copyWith(
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
                    // 감정 통계 카드
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: AppDecorations.cardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '이번 달 감정 통계',
                            style: AppTextStyles.h4,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Row(
                            children: [
                              Expanded(
                                child: _buildEmotionStat('행복', AppColors.happy, 5),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: _buildEmotionStat('슬픔', AppColors.sad, 2),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              Expanded(
                                child: _buildEmotionStat('신남', AppColors.excited, 3),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // 캘린더
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: AppDecorations.cardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '감정 캘린더',
                            style: AppTextStyles.h4,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          _buildCalendar(),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // 감정 설명
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: AppDecorations.cardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '감정 색상 설명',
                            style: AppTextStyles.h4,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          _buildEmotionLegend(),
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
    );
  }

  Widget _buildEmotionStat(String emotion, Color color, int count) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.favorite,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          emotion,
          style: AppTextStyles.caption,
          textAlign: TextAlign.center,
        ),
        Text(
          '$count일',
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    return Column(
      children: [
        // 월 네비게이션
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _focusedDate = DateTime(_focusedDate.year, _focusedDate.month - 1);
                });
              },
              icon: const Icon(Icons.chevron_left),
            ),
            Text(
              '${_focusedDate.year}년 ${_focusedDate.month}월',
              style: AppTextStyles.h4,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _focusedDate = DateTime(_focusedDate.year, _focusedDate.month + 1);
                });
              },
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
        
        const SizedBox(height: AppSpacing.md),
        
        // 요일 헤더
        Row(
          children: ['일', '월', '화', '수', '목', '금', '토'].map((day) {
            return Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                child: Text(
                  day,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }).toList(),
        ),
        
        const SizedBox(height: AppSpacing.sm),
        
        // 캘린더 그리드
        _buildCalendarGrid(),
      ],
    );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = DateTime(_focusedDate.year, _focusedDate.month, 1);
    final lastDayOfMonth = DateTime(_focusedDate.year, _focusedDate.month + 1, 0);
    final firstWeekday = firstDayOfMonth.weekday % 7;
    final daysInMonth = lastDayOfMonth.day;
    
    List<Widget> calendarDays = [];
    
    // 이전 달의 마지막 날들
    for (int i = 0; i < firstWeekday; i++) {
      calendarDays.add(const Expanded(child: SizedBox()));
    }
    
    // 현재 달의 날들
    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(_focusedDate.year, _focusedDate.month, day);
      final dateString = '${date.year}-${date.month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
      final emotionColor = _emotionData[dateString];
      final isToday = date.isAtSameMomentAs(DateTime.now());
      final isSelected = date.isAtSameMomentAs(_selectedDate);
      
      calendarDays.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
              _showDayDetail(date);
            },
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: emotionColor ?? Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: isToday
                    ? Border.all(color: AppColors.primary, width: 2)
                    : isSelected
                        ? Border.all(color: AppColors.secondary, width: 2)
                        : null,
              ),
              child: Center(
                child: Text(
                  day.toString(),
                  style: AppTextStyles.caption.copyWith(
                    color: emotionColor != null ? Colors.white : AppColors.textPrimary,
                    fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    
    // 6주로 고정하기 위해 빈 칸 추가
    while (calendarDays.length < 42) {
      calendarDays.add(const Expanded(child: SizedBox()));
    }
    
    return Column(
      children: [
        for (int week = 0; week < 6; week++)
          Row(
            children: calendarDays.sublist(week * 7, (week + 1) * 7),
          ),
      ],
    );
  }

  Widget _buildEmotionLegend() {
    final emotions = [
      {'name': '행복', 'color': AppColors.happy, 'icon': Icons.sentiment_satisfied},
      {'name': '슬픔', 'color': AppColors.sad, 'icon': Icons.sentiment_dissatisfied},
      {'name': '신남', 'color': AppColors.excited, 'icon': Icons.sentiment_very_satisfied},
      {'name': '차분', 'color': AppColors.calm, 'icon': Icons.sentiment_neutral},
      {'name': '사랑', 'color': AppColors.love, 'icon': Icons.favorite},
      {'name': '화남', 'color': AppColors.angry, 'icon': Icons.sentiment_very_dissatisfied},
    ];
    
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.sm,
      children: emotions.map((emotion) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: emotion['color'] as Color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                emotion['icon'] as IconData,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                emotion['name'] as String,
                style: AppTextStyles.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  void _showDayDetail(DateTime date) {
    final dateString = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    final emotionColor = _emotionData[dateString];
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          '${date.month}월 ${date.day}일',
          style: AppTextStyles.h4,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (emotionColor != null) ...[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: emotionColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                '감정이 기록된 날입니다',
                style: AppTextStyles.bodyMedium,
              ),
            ] else ...[
              const Icon(
                Icons.edit_note,
                size: 60,
                color: AppColors.textLight,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                '아직 감정이 기록되지 않았습니다',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('닫기'),
          ),
          if (emotionColor == null)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // TODO: 일기쓰기 화면으로 이동
              },
              style: AppDecorations.primaryButtonStyle,
              child: const Text('일기쓰기'),
            ),
        ],
      ),
    );
  }
} 