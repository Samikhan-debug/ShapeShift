import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shop_Page.dart';
import 'package:ionicons/ionicons.dart';

class FAQScreen extends StatelessWidget {
  final List<FAQItem> faqItems = [
    FAQItem(
      question:
          'What are the key benefits of incorporating both cardio and strength training into a workout routine?',
      answer:
          'Incorporating both cardio and strength training boosts cardiovascular health, burns calories, and promotes muscle growth and endurance. Combining these exercises enhances overall fitness, leading to a more balanced and functional body.',
    ),
    FAQItem(
      question:
          'How can one design an effective at-home workout regimen without any specialized equipment?',
      answer:
          'Bodyweight exercises like squats, push-ups, and lunges are excellent for at-home workouts. Additionally, utilizing household items like chairs for tricep dips or filled water bottles for weights can add variety and intensity.',
    ),
    FAQItem(
      question:
          'What role does adequate hydration play in optimizing fitness performance, and how can one create a personalized water intake plan?',
      answer:
          'Hydration is crucial for regulating body temperature, lubricating joints, and transporting nutrients. A general guideline is to drink at least eight 8-ounce glasses of water daily, but individual needs vary based on activity level, climate, and personal factors. Monitoring urine color and thirst cues helps gauge hydration status.',
    ),
    FAQItem(
      question:
          'What are some practical strategies for maintaining a balanced diet while managing a busy schedule?',
      answer:
          'Planning meals and snacks in advance can help maintain a balanced diet amid a hectic schedule. Batch cooking, prepping healthy snacks, and keeping nutritious options easily accessible can prevent reliance on convenience foods when time is tight.',
    ),
    FAQItem(
      question:
          'How does consistency in exercise routines contribute to achieving long-term fitness goals, and what are some tips for staying motivated throughout the process?',
      answer:
          'Consistency in exercise routines is key for achieving fitness goals. Setting achievable, measurable goals, varying workouts to prevent boredom, finding a workout buddy for accountability, and celebrating milestones along the way can help maintain motivation for the long haul.',
    ),
    FAQItem(
      question:
          'What are the benefits of incorporating flexibility and mobility exercises into a workout routine?',
      answer:
          'Flexibility and mobility exercises improve joint range of motion, reduce the risk of injury, and enhance overall functional movement. They help maintain muscle elasticity, improve posture, and can aid in recovery after intense workouts.',
    ),
    FAQItem(
      question:
          'How can one strike a balance between enjoying occasional treats and maintaining a healthy diet?',
      answer:
          'Moderation is key. Embracing a balanced approach where the majority of meals consist of nutrient-dense foods while leaving room for occasional treats can help sustain a healthy diet. Planning indulgences mindfully, savoring them without guilt, and focusing on overall dietary patterns rather than isolated moments of indulgence supports a healthy relationship with food.',
    ),
    // Add more FAQ items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2757),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blue, // You can change the color here
            child: Center(
              child: Text(
                "FAQ's",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Change text color if needed
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: faqItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    shadowColor: Colors.blue,
                    elevation: 4.0,
                    child: ExpansionTile(
                      title: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          faqItems[index].question,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            faqItems[index].answer,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
