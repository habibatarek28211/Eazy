import 'package:eazy/core/config/app_palette.dart';
import 'package:eazy/core/config/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final ScrollController _scrollController = ScrollController();

  // مفاتيح الأسئلة
  final List<GlobalKey> _questionKeys = List.generate(4, (index) => GlobalKey());

  // التنقل للسؤال
  void _scrollToQuestion(int index) {
    final context = _questionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // عشان النصوص بالعربي
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "النتائج",
            style: TextStyle(
              color: AppPalette.textBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppPalette.textBlack),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // المؤشر الدائري للأرقام
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                      (index) => GestureDetector(
                    onTap: () => _scrollToQuestion(index),
                    child: _buildStepCircle("${index + 1}", index == 0),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // تكرار الأسئلة
              Column(
                children: List.generate(
                  4,
                      (index) => _buildQuestionCard(key: _questionKeys[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // تصميم الدائرة للأرقام
  Widget _buildStepCircle(String number, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive ? AppPalette.redPrimary : AppPalette.primary,
        shape: BoxShape.circle,
      ),
      child: Text(
        number,
        style: const TextStyle(
          color: AppPalette.textLight,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // تصميم كل سؤال
  Widget _buildQuestionCard({Key? key}) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:  [

              SvgPicture.asset(
                ImagesManager.mcq,
                width: 19,
                height: 17.25,
              ),

              SizedBox(width: 6),
              Text(
                "اختيار متعدد",
                style: TextStyle(fontSize: 14, color: AppPalette.primary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "نص السؤال هنا والذي عادة ما يتكون من عدة اسطر ؟",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),

          // الإجابات
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildAnswerButton("الإجابة الخطأ", AppPalette.redPrimary),
              _buildAnswerButton("الإجابة الصحيحة", AppPalette.primary),
              _buildAnswerButton("الإجابة الخطأ", AppPalette.redPrimary),
              _buildAnswerButton("الإجابة الخطأ", AppPalette.redPrimary),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // تصميم زر الإجابة
  Widget _buildAnswerButton(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: AppPalette.textLight,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
