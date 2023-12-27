import 'package:flutter/material.dart';

class Exercise {
  final String name;
  final String imageUrl;

  Exercise({required this.name, required this.imageUrl});
}

class ExerciseTemplate {
  final String templateName;
  final String dayName;
  final List<Exercise> exercises;

  ExerciseTemplate({
    required this.templateName,
    required this.dayName,
    required this.exercises,
  });
}

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  List<Exercise> allExercises = [
    Exercise(name: 'Push-ups', imageUrl: 'assets/squat.jpg'),
    Exercise(name: 'Squats', imageUrl: 'assets/squat.jpg'),
    Exercise(name: 'Plank', imageUrl: 'assets/squat.jpg'),
    Exercise(name: 'Jumping Jacks', imageUrl: 'assets/squat.jpg'),
    Exercise(name: 'Push-ups', imageUrl: 'assets/squat.jpg'),
    Exercise(name: 'Squats', imageUrl: 'assets/squat.jpg'),

    // Add more exercises...
  ];

  List<Exercise> selectedExercises = [];
  List<ExerciseTemplate> templates = [];

  void _addExerciseWithRepsSets(Exercise exercise) {
    TextEditingController repsController = TextEditingController();
    TextEditingController setsController = TextEditingController();
    int maxReps = 60; // Maximum number for reps
    int maxSets = 30; // Maximum number for sets

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Reps/Sets'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Reps'),
                value: null,
                onChanged: (int? newValue) {
                  repsController.text = newValue!.toString();
                },
                items: List.generate(maxReps + 1, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(index.toString()),
                  );
                }),
              ),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(labelText: 'Sets'),
                value: null,
                onChanged: (int? newValue) {
                  setsController.text = newValue!.toString();
                },
                items: List.generate(maxSets + 1, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text(index.toString()),
                  );
                }),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (repsController.text.isNotEmpty &&
                    setsController.text.isNotEmpty) {
                  setState(() {
                    selectedExercises.add(
                      Exercise(
                        name:
                            '${exercise.name} - Reps: ${repsController.text}, Sets: ${setsController.text}',
                        imageUrl: '', // Replace with the actual imageUrl
                      ),
                    );
                  });
                  Navigator.pop(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Incomplete Information'),
                        content: Text('Please select both reps and sets.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  void _saveTemplate() {
    TextEditingController templateNameController = TextEditingController();
    String? selectedTemplateDay;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save as Template'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: templateNameController,
                decoration: InputDecoration(labelText: 'Template Name'),
              ),
              DropdownButton<String>(
                value: selectedTemplateDay,
                hint: Text('Choose a day'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTemplateDay = newValue;
                  });
                },
                items: <String>[
                  'Monday',
                  'Tuesday',
                  'Wednesday',
                  'Thursday',
                  'Friday',
                  'Saturday',
                  'Sunday'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  if (templateNameController.text.isNotEmpty &&
                      selectedTemplateDay != null &&
                      selectedExercises.isNotEmpty) {
                    templates.add(
                      ExerciseTemplate(
                        templateName: templateNameController.text,
                        dayName: selectedTemplateDay!,
                        exercises: List.from(selectedExercises),
                      ),
                    );
                    setState(() {
                      selectedExercises.clear();
                    });
                    Navigator.pop(context);
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Incomplete Information'),
                          content: Text(
                              'Please select exercises, provide a template name, and choose a day.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Tracker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _saveTemplate,
              child: Text('Save as Template'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue),
                        columns: [
                          DataColumn(label: Text('Exercise')),
                        ],
                        rows: allExercises.map((exercise) {
                          return DataRow(
                            cells: [
                              DataCell(
                                InkWell(
                                  onTap: () {
                                    _addExerciseWithRepsSets(exercise);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.fitness_center),
                                      SizedBox(width: 8),
                                      Text(exercise.name),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                        // ... (unchanged code for available exercises)
                      ),
                      // Code for available exercises DataTable remains the same...
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue),
                        columns: [
                          DataColumn(label: Text('Selected Exercises')),
                        ],
                        rows: selectedExercises.map((exercise) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(exercise.name),
                              ),
                            ],
                          );
                        }).toList(),
                        // ... (unchanged code for selected exercises)
                      ),
                      // Code for selected exercises DataTable remains the same...
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: templates.length,
                itemBuilder: (BuildContext context, int index) {
                  final template = templates[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(template.templateName),
                      subtitle: Text('Day: ${template.dayName}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.info),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TemplateDetailScreen(template: template),
                                ),
                              );

                              // Handle displaying detailed template information if needed
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                templates.removeAt(index);
                              });
                            },
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
      ),
    );
  }
}

class TemplateDetailScreen extends StatelessWidget {
  final ExerciseTemplate template;

  TemplateDetailScreen({required this.template});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Template Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Template Name: ${template.templateName}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Day: ${template.dayName}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Selected Exercises:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: template.exercises.map((exercise) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '- ${exercise.name}',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
