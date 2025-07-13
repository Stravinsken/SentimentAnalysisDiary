import 'package:flutter/material.dart';
import '../styles/styles.dart';

class ComfortScreen extends StatefulWidget {
  const ComfortScreen({super.key});

  @override
  State<ComfortScreen> createState() => _ComfortScreenState();
}

class _ComfortScreenState extends State<ComfortScreen> {
  final List<Map<String, dynamic>> _sharedDiaries = [
    {
      'id': '1',
      'title': '오늘은 정말 힘든 하루였어요',
      'content': '시험 준비하느라 밤을 새웠는데 결과가 좋지 않았어요. 정말 속상하고 슬퍼요...',
      'author': '익명의 사용자',
      'date': '2024-01-15',
      'emotion': '슬픔',
      'emotionColor': AppColors.sad,
      'comfortCount': 3,
      'hasComforted': false,
    },
    {
      'id': '2',
      'title': '가족과 함께한 특별한 시간',
      'content': '오랜만에 가족들과 함께 여행을 갔어요. 정말 행복하고 즐거운 시간이었습니다!',
      'author': '익명의 사용자',
      'date': '2024-01-14',
      'emotion': '행복',
      'emotionColor': AppColors.happy,
      'comfortCount': 5,
      'hasComforted': true,
    },
    {
      'id': '3',
      'title': '새로운 도전을 시작했어요',
      'content': '새로운 취미를 시작했는데 생각보다 어려워요. 하지만 포기하지 않고 계속 해보려고 해요.',
      'author': '익명의 사용자',
      'date': '2024-01-13',
      'emotion': '신남',
      'emotionColor': AppColors.excited,
      'comfortCount': 2,
      'hasComforted': false,
    },
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '위로해주기',
                        style: AppTextStyles.h2.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO: 필터 또는 설정
                        },
                        icon: const Icon(
                          Icons.filter_list,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    '다른 사람의 마음을 위로해주세요',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: _sharedDiaries.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      itemCount: _sharedDiaries.length,
                      itemBuilder: (context, index) {
                        final diary = _sharedDiaries[index];
                        return _buildDiaryCard(diary);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(60),
            ),
            child: const Icon(
              Icons.favorite_border,
              size: 60,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            '아직 공유된 일기가 없어요',
            style: AppTextStyles.h4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            '다른 사용자가 일기를 공유하면\n여기서 확인할 수 있어요',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDiaryCard(Map<String, dynamic> diary) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      decoration: AppDecorations.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 헤더
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: diary['emotionColor'],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        diary['title'],
                        style: AppTextStyles.h4,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${diary['author']} • ${diary['date']}',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: diary['emotionColor'].withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    diary['emotion'],
                    style: AppTextStyles.caption.copyWith(
                      color: diary['emotionColor'],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // 내용
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Text(
              diary['content'],
              style: AppTextStyles.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          const SizedBox(height: AppSpacing.md),
          
          // 액션 버튼들
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _showComfortDialog(diary),
                    style: AppDecorations.secondaryButtonStyle,
                    icon: Icon(
                      diary['hasComforted'] ? Icons.favorite : Icons.favorite_border,
                      size: 20,
                    ),
                    label: Text(
                      diary['hasComforted'] ? '위로 완료' : '위로하기',
                      style: AppTextStyles.buttonSmall,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.sm,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.favorite,
                        size: 16,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        '${diary['comfortCount']}',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showComfortDialog(Map<String, dynamic> diary) {
    final comfortController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          '위로 메시지 보내기',
          style: AppTextStyles.h4,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${diary['author']}님에게 따뜻한 위로를 전해주세요',
              style: AppTextStyles.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: comfortController,
              maxLines: 3,
              decoration: AppDecorations.inputDecoration(
                hintText: '위로의 말을 작성해주세요...',
                labelText: '위로 메시지',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('취소'),
          ),
          ElevatedButton(
            onPressed: () {
              if (comfortController.text.trim().isNotEmpty) {
                _sendComfort(diary['id'], comfortController.text.trim());
                Navigator.pop(context);
              }
            },
            style: AppDecorations.primaryButtonStyle,
            child: const Text('보내기'),
          ),
        ],
      ),
    );
  }

  void _sendComfort(String diaryId, String message) {
    // TODO: 실제 위로 메시지 전송 로직 구현
    setState(() {
      final diaryIndex = _sharedDiaries.indexWhere((d) => d['id'] == diaryId);
      if (diaryIndex != -1) {
        _sharedDiaries[diaryIndex]['hasComforted'] = true;
        _sharedDiaries[diaryIndex]['comfortCount']++;
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('위로 메시지가 전송되었습니다!')),
    );
  }
} 