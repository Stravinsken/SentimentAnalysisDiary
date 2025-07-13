import 'package:flutter/material.dart';
import '../styles/styles.dart';

class DiaryWriteScreen extends StatefulWidget {
  const DiaryWriteScreen({super.key});

  @override
  State<DiaryWriteScreen> createState() => _DiaryWriteScreenState();
}

class _DiaryWriteScreenState extends State<DiaryWriteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String? _selectedEmotion;
  bool _isAnalyzing = false;
  bool _isSharing = false;
  Map<String, dynamic>? _analysisResult;

  final List<Map<String, dynamic>> _emotions = [
    {'name': '행복', 'color': AppColors.happy, 'icon': Icons.sentiment_satisfied},
    {'name': '슬픔', 'color': AppColors.sad, 'icon': Icons.sentiment_dissatisfied},
    {'name': '신남', 'color': AppColors.excited, 'icon': Icons.sentiment_very_satisfied},
    {'name': '차분', 'color': AppColors.calm, 'icon': Icons.sentiment_neutral},
    {'name': '사랑', 'color': AppColors.love, 'icon': Icons.favorite},
    {'name': '화남', 'color': AppColors.angry, 'icon': Icons.sentiment_very_dissatisfied},
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _analyzeDiary() {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('제목과 내용을 모두 입력해주세요')),
      );
      return;
    }

    setState(() {
      _isAnalyzing = true;
    });

    // TODO: 실제 AI 분석 로직 구현
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isAnalyzing = false;
        _analysisResult = {
          'primaryEmotion': '행복',
          'confidence': 85,
          'keywords': ['가족', '여행', '즐거움'],
          'suggestions': ['오늘 하루도 행복한 하루였네요!', '가족과 함께한 시간이 특별했나 봐요.'],
        };
      });
    });
  }

  void _shareDiary() {
    if (_analysisResult == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('먼저 일기를 분석해주세요')),
      );
      return;
    }

    setState(() {
      _isSharing = true;
    });

    // TODO: 실제 공유 로직 구현
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSharing = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('일기가 성공적으로 공유되었습니다!')),
      );
    });
  }

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
                  IconButton(
                    onPressed: () {
                      // TODO: 뒤로가기 또는 저장 확인
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: Text(
                      '일기 쓰기',
                      style: AppTextStyles.h3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    onPressed: _analyzeDiary,
                    icon: const Icon(Icons.psychology),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 감정 선택
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: AppDecorations.cardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '오늘의 감정',
                            style: AppTextStyles.h4,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Wrap(
                            spacing: AppSpacing.sm,
                            runSpacing: AppSpacing.sm,
                            children: _emotions.map((emotion) {
                              final isSelected = _selectedEmotion == emotion['name'];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedEmotion = emotion['name'];
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.md,
                                    vertical: AppSpacing.sm,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected 
                                        ? emotion['color'] 
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: emotion['color'],
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        emotion['icon'],
                                        color: isSelected 
                                            ? Colors.white 
                                            : emotion['color'],
                                        size: 20,
                                      ),
                                      const SizedBox(width: AppSpacing.xs),
                                      Text(
                                        emotion['name'],
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: isSelected 
                                              ? Colors.white 
                                              : emotion['color'],
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // 일기 작성
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: AppDecorations.cardDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '일기 작성',
                            style: AppTextStyles.h4,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          
                          // 제목 입력
                          TextFormField(
                            controller: _titleController,
                            decoration: AppDecorations.inputDecoration(
                              hintText: '일기 제목을 입력하세요',
                              labelText: '제목',
                            ),
                          ),
                          
                          const SizedBox(height: AppSpacing.md),
                          
                          // 내용 입력
                          TextFormField(
                            controller: _contentController,
                            maxLines: 10,
                            decoration: AppDecorations.inputDecoration(
                              hintText: '오늘 하루는 어땠나요? 자유롭게 작성해보세요.',
                              labelText: '내용',
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    if (_analysisResult != null) ...[
                      const SizedBox(height: AppSpacing.lg),
                      
                      // 분석 결과
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        decoration: AppDecorations.cardDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'AI 분석 결과',
                                  style: AppTextStyles.h4,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.sm,
                                    vertical: AppSpacing.xs,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.success,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    '${_analysisResult!['confidence']}%',
                                    style: AppTextStyles.caption.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.md),
                            
                            // 주요 감정
                            Row(
                              children: [
                                Icon(
                                  Icons.psychology,
                                  color: AppColors.primary,
                                  size: 20,
                                ),
                                const SizedBox(width: AppSpacing.xs),
                                Text(
                                  '주요 감정: ${_analysisResult!['primaryEmotion']}',
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: AppSpacing.sm),
                            
                            // 키워드
                            Row(
                              children: [
                                Icon(
                                  Icons.tag,
                                  color: AppColors.secondary,
                                  size: 20,
                                ),
                                const SizedBox(width: AppSpacing.xs),
                                Text(
                                  '키워드: ${_analysisResult!['keywords'].join(', ')}',
                                  style: AppTextStyles.bodyMedium,
                                ),
                              ],
                            ),
                            
                            const SizedBox(height: AppSpacing.md),
                            
                            // 제안사항
                            Container(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'AI의 한마디',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  ...(_analysisResult!['suggestions'] as List<String>).map(
                                    (suggestion) => Padding(
                                      padding: const EdgeInsets.only(top: AppSpacing.xs),
                                      child: Text(
                                        '• $suggestion',
                                        style: AppTextStyles.bodySmall,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            const SizedBox(height: AppSpacing.md),
                            
                            // 공유 버튼
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: _isSharing ? null : _shareDiary,
                                style: AppDecorations.primaryButtonStyle,
                                icon: _isSharing
                                    ? const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            Colors.white,
                                          ),
                                        ),
                                      )
                                    : const Icon(Icons.share),
                                label: Text(
                                  _isSharing ? '공유 중...' : '다른 사람에게 공유하기',
                                  style: AppTextStyles.buttonMedium,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    
                    const SizedBox(height: AppSpacing.lg),
                    
                    // 분석 버튼
                    if (_analysisResult == null)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _isAnalyzing ? null : _analyzeDiary,
                          style: AppDecorations.primaryButtonStyle,
                          icon: _isAnalyzing
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : const Icon(Icons.psychology),
                          label: Text(
                            _isAnalyzing ? '분석 중...' : 'AI로 분석하기',
                            style: AppTextStyles.buttonLarge,
                          ),
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
} 