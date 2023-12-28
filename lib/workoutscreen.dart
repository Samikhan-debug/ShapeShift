import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Workoutscreen extends StatefulWidget {
  const Workoutscreen({super.key});

  @override
  State<Workoutscreen> createState() => _WorkoutscreenState();
}

class _WorkoutscreenState extends State<Workoutscreen> {
  String img_Header = "assets/victor-freitas-WvDYdXDzkhs-unsplash.jpg";

  List<String> trainingimage = [
    "assets/jonathan-borba-lrQPTQs7nQQ-unsplash.jpg"
        "assets/anastase-maragos-FP7cfYPPUKM-unsplash.jpg"
        "assets/jared-rice-NTyBbu66_SI-unsplash.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,

            pinned: true,

            floating: false,
            title: const Text(
              "Workouts",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            toolbarHeight: 100.0,

            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              img_Header,
              fit: BoxFit.cover,
              color: Color(0xaa212121),
              colorBlendMode: BlendMode.darken,
            )),
            // bottom: PreferredSize(
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //       bottom: 24.0, left: 12.0, right: 12.0),
            //     child: TextField(),
            // ),
            //   preferredSize: Size.fromHeight(100.0),
            // ),
          ),
        ];
      },
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Our Programs",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            listItem("assets/anastase-maragos-FP7cfYPPUKM-unsplash.jpg",
                "Weight Training", 10, 50, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EListScreen()),
              );
            }),
            listItem("assets/jonathan-borba-lrQPTQs7nQQ-unsplash.jpg", "Cardio",
                7, 20, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CListScreen()),
              );
            }),
            listItem(
                "assets/jared-rice-NTyBbu66_SI-unsplash.jpg", "Yoga", 5, 30,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YListScreen()),
              );
            }),
          ],
        ),
      )),
    ));
  }
}

class YListScreen extends StatefulWidget {
  const YListScreen({Key? key}) : super(key: key);

  @override
  _YListScreenState createState() => _YListScreenState();
}

class _YListScreenState extends State<YListScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'hP25aVmxkP8',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  final List<String> yogaExercises = [
    '1. Downward-Facing Dog (Adho Mukha Svanasana)',
    '2. Tree Pose (Vrikshasana)',
    '3. Child\'s Pose (Balasana)',
    '4. Warrior II (Virabhadrasana II)',
    '5. Corpse Pose (Savasana)',
    // Add more exercises as needed
  ];

  final List<String> exerciseDescriptions = [
    'Start on your hands and knees. Lift your hips towards the ceiling, straightening your legs and arms. Form an inverted V-shape with your body.',
    'Stand on one leg and bring the sole of the other foot to the inner thigh or calf. Bring your palms together in front of your chest or reach them overhead.',
    'Kneel on the mat with your big toes touching and knees spread apart. Sit back on your heels and reach your arms forward, lowering your chest towards the mat.',
    'Stand with feet wide apart, arms extended parallel to the floor. Turn one foot outward and bend the knee, keeping the other leg straight. Gaze over the front hand.',
    'Lie on your back with legs extended and arms by your sides. Close your eyes and focus on your breath, allowing your body to relax completely.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Yoga Exercises",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              liveUIColor: Colors.amber,
            ),
            // Replace this with your YouTubePlayer widget
            SizedBox(height: 16),
            Text(
              'The list below contains the following exercises:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: yogaExercises.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        yogaExercises[index],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: index < exerciseDescriptions.length
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                exerciseDescriptions[index],
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            )
                          : null,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

Widget listItem(
    String bg, String title, int exercises, int time, Function() onTap) {
  return GestureDetector(
    onTap: onTap, // Call the provided onTap function when the item is tapped
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(bg),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Color(0x60212121), BlendMode.darken),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 19.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "${exercises} Exercises",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "${time} Minutes Per Day",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class EListScreen extends StatefulWidget {
  final String videoID = "0sacQ4oo-P0";
  const EListScreen({super.key});

  @override
  State<EListScreen> createState() => _EListScreenState();
}

class _EListScreenState extends State<EListScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoID,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        showLiveFullscreenButton: true,
      ),
    )..addListener(_onPlayerStateChange);
  }

  void _onPlayerStateChange() {
    //  if (_controller.value.hasError) {
    //   debugPrint('Error: ${_controller.value.errorCode}');
    // }
    if (_controller.value.isReady) {
      // Now you can perform operations on the controller
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    // List of cardio exercises

    final List<String> cardioExercises = [
      '1. Squat:',
      '2. Deadlift:',
      '3. Bench Press:',
      '4. Overhead Press:',
      '5. Bent Over Rows:',
      '6. Pull-Ups:',
      '7. Lunges',
      '8. Plank:',
      '9. Leg Press:',
      '10. Dumbbell Curl and Press:',
      // Add more exercises as needed
    ];

    final List<String> exerciseDescriptions = [
      'Stand with feet shoulder-width apart. Lower your body by bending your knees and hips. Keep your back straight and chest up.',
      'Stand with feet hip-width apart, holding a barbell in front of you. Hinge at the hips and lower the barbell to the ground. Keep your back straight and engage your core.',
      'Lie on a flat bench, holding a barbell above your chest. Lower the barbell to your chest and push it back up.',
      'Stand with feet shoulder-width apart, holding a barbell at shoulder height. Press the barbell overhead, fully extending your arms.',
      'Bend at the hips, keeping your back straight, and hold a barbell with hands shoulder-width apart. Pull the barbell towards your lower chest.',
      'Hang from a pull-up bar with palms facing away. Pull your body up until your chin is above the bar.',
      'Step forward with one leg and lower your body until both knees form 90-degree angles. Return to the starting position and switch legs.',
      'Hold a push-up position with arms straight. Keep your body in a straight line from head to heels.',
      'Sit on a leg press machine with feet on the platform. Push the platform away by extending your knees.',
      'Hold a dumbbell in each hand. Curl the weights to shoulder height and then press them overhead.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cardio Exercises",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              liveUIColor: Colors.amber,
            ),
            // Replace this with your YouTubePlayer widget

            SizedBox(height: 16),
            Text(
              'The list below contains the following exercises:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cardioExercises.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        cardioExercises[index],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: index < exerciseDescriptions.length
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                exerciseDescriptions[index],
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            )
                          : null,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class CListScreen extends StatefulWidget {
  const CListScreen({Key? key}) : super(key: key);

  @override
  _CListScreenState createState() => _CListScreenState();
}

class _CListScreenState extends State<CListScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '-KvQrW76CjQ', // Replace with the actual video ID
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  Widget build(BuildContext context) {
    @override
    final List<String> cardioExercises = [
      '1. Jumping Jacks',
      '2. Running in Place',
      '3. Jump Rope',
      '4. High Knees',
      '5. Burpees',
      '6. Squat Jumps',
      '7. Lunges',
      // Add more exercises as needed
    ];

    final List<String> exerciseDescriptions = [
      'Jumping jacks are a full-body workout that engages all the major muscle groups.',
      'Running in place is an effective cardio exercise that requires minimal space and equipment.',
      'Jump rope is a fantastic way to improve cardiovascular health and coordination.',
      'High knees help elevate the heart rate and strengthen the lower body.',
      'Burpees are a high-intensity exercise that combines strength and cardio.',
      'Squat jumps are great for building lower body strength and explosive power.',
      'Lunges are effective for targeting the legs and glutes while improving balance.',
      // Add more exercise descriptions
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cardio Exercises",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              liveUIColor: Colors.amber,
            ),
            // Replace this with your YouTubePlayer widget

            SizedBox(height: 16),
            Text(
              'The list below contains the following exercises:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: cardioExercises.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        cardioExercises[index],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: index < exerciseDescriptions.length
                          ? Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                exerciseDescriptions[index],
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            )
                          : null,
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
