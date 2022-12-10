import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

void main() {
  runApp(const MyApp());
}

final _plans = <Plan>[
  Plan.full('Indian Date Night', 'Bombay House', 'Provo, Utah', '2 hours', '\$30', 'Date Night', 0),
  Plan.full('Steep Climbs', 'Hike the Y', 'Provo, Utah', '2 hours', '\$0', 'Active', 1),
  Plan.full('Take in the Arches', 'Visit the Arches', 'Moab, Utah', '2 days', '\$100', 'Family Fun', 2),
  Plan.full('Family Skiing', 'Go Skiing', 'Park City, Utah', '1 day', '\$200', 'Sports', 3),
  Plan.full('Red Rock Recreation', 'Tour Saint George', 'Saint George, Utah', '4 days', '\$600', 'Family Fun', 4),
  Plan.full('River-Wading Hike', 'Hike the Narrows', 'Saint George, Utah', '8 hours', '\$20', 'Active', 5),
  Plan.full('Caribbean Escape', 'Vacation Resort', 'Punta Cana, Dominican Republic', '7 days', '\$1500', 'Getaway', 6),
  Plan.full('Parisian Excursion', 'Tour Paris', 'Paris, France', '7 days', '\$2000', 'Getaway', 7)
];
final _drafts = <Plan>[];
final _favorites = <Plan>[];
final _myPlans = <Plan>[];
final _searchHistory = <String>[];
final _friends = <UserInfo> [
  UserInfo.full('Jaylen', 'Perry', 'June 30, 1996', 'Provo, Utah', 'jperry2@gmail.com', 'JaylenTravels', 0),
  UserInfo.full('Kate', 'Uption', 'August 12, 1990', 'Spanish Fork, Utah', 'kateUption321@gmail.com', 'Mark&Kate21', 1),
  UserInfo.full('Mason', 'Jack', 'May 5, 1977', 'Lindon, Utah', 'mjack43@gmail.com', 'TheJacks24', 3),
  UserInfo.full('Joseph', 'Dubois', 'November 3, 1988', 'Portland, Oregon', 'duboiscarl66@gmail.com', 'FrenchyIsMe', 7),
  UserInfo.full('Jessica', 'Bailey', 'October 22, 1994', 'Sacramento, California', 'imjdbailey@gmail.com', 'Mrs.Vacation', 6),
  UserInfo.full('Carl', 'Peterson', 'February 19, 1988', 'Saint George, Utah', 'cpeterson59@gmail.com', 'cArL!33', 5),
];
late UserInfo _user;

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Envisage',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xff0ea0a8),
          foregroundColor: Colors.white,
        ),
      ),
      home: const EnterPage(),
    );
  }
}

class EnterPage extends StatelessWidget
{
  const EnterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xfff87400),
              Color(0xff0ea0a8),
            ],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 300,
          child: Card(
            shape: RoundedRectangleBorder(
                // side: const BorderSide(
                //   color:  Color(0xffbd5601),
                //   width: 5,
                // ),
                borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
              ),
            elevation: 100.0,
            color: const Color(0xfffff5f1),
            child: const EnterPageChoice(),
          ),
        ),
      ),
    );
  }
}

class EnterPageChoice extends StatefulWidget
{
  const EnterPageChoice({Key? key}) : super(key: key);

  @override
  State<EnterPageChoice> createState() => _EnterPageChoiceState();
}

class _EnterPageChoiceState extends State<EnterPageChoice>
{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20,),
        Text('Envisage', style: GoogleFonts.pacifico(
          textStyle: const TextStyle(fontSize: 36),
        )),
        const Icon(
            Icons.wb_twilight_rounded,
            size: 150,
            color: Color(0xfff87400),
        ),
        const SizedBox(height: 20,),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled)
                            ? null
                            : Colors.black;
                      }),
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled)
                            ? null
                            : const Color(0xfff87400);
                      }),
                ),
                onPressed: ()
                {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: Text(
                  'Register',
                  style: GoogleFonts.lilyScriptOne(
                    textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20,),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled)
                            ? null
                            : Colors.black;
                      }),
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled)
                            ? null
                            : const Color(0xfff87400);
                      }),
                ),
                onPressed: ()
                {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                child: Text(
                  'Sign In',
                  style: GoogleFonts.lilyScriptOne(
                    textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.black
                    ),
                  ),
                ),
              ),
            ],
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}

class SignInScreen extends StatelessWidget
{
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xfff87400),
            Color(0xff0ea0a8),
          ],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 350,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
            ),
            elevation: 100.0,
            color: Color(0xfffff5f1),
            child: SignInForm(),
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget
{
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm>
{
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double _formProgress = 0;

  void _showHome() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _usernameTextController,
      _passwordTextController
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        onChanged: _updateFormProgress,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
            ),
            //AnimatedProgressIndicator(value: _formProgress),
            Text('Sign In', style: GoogleFonts.lilyScriptOne(
              textStyle: const TextStyle(fontSize: 36),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return 'Please enter username.';
                  }
                  return null;
                },
                controller: _usernameTextController,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 18, 36, 24),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return 'Please enter password.';
                  }
                  return null;
                },
                controller: _passwordTextController,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : Colors.black;
                    }),
                backgroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : const Color(0xfff87400);
                    }),
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate() && (_formProgress == 1))
                {
                  //In the real world you'd often call a server or save the information in a database.
                  _user = UserInfo(
                      'Danny',
                      'Phantom',
                      'May 29, 2000',
                      'Provo, Utah',
                      'dphantom@gmail.com',
                      _usernameTextController.text);
                  return _showHome();
                }
              },
              child: const Text('Submit',
                selectionColor: Color(0xfffff5f1),
              ),
            ),
            const SizedBox(height: 12,),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget
{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xfff87400),
            Color(0xff0ea0a8),
          ],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: 350,
          child: Card(
            shape: RoundedRectangleBorder(
              // side: BorderSide(
              //   color:  Color(0xffbd5601),
              //   width: 5,
              // ),
              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
            ),
            elevation: 100.0,
            color: Color(0xfffff5f1),
            child: RegisterForm(),
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget
{
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm>
{
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _dateOfBirthTextController = TextEditingController();
  final _locationTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double _formProgress = 0;

  void _showHome() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _usernameTextController
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _dateOfBirthTextController.dispose();
    _locationTextController.dispose();
    _emailTextController.dispose();
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        onChanged: _updateFormProgress,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
            ),
            //AnimatedProgressIndicator(value: _formProgress),
            Text('Register', style: GoogleFonts.lilyScriptOne(
              textStyle: const TextStyle(fontSize: 36),
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return 'Please enter first name.';
                  }
                  return null;
                },
                controller: _firstNameTextController,
                decoration: const InputDecoration(hintText: 'First name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return 'Please enter last name.';
                  }
                  return null;
                },
                controller: _lastNameTextController,
                decoration: const InputDecoration(hintText: 'Last name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return 'Please enter date of birth.';
                  }
                  return null;
                },
                controller: _dateOfBirthTextController,
                decoration: const InputDecoration(hintText: 'Date of Birth'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return 'Please enter your location.';
                  }
                  return null;
                },
                controller: _locationTextController,
                decoration: const InputDecoration(hintText: 'Location'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return 'Please enter email address.';
                  }
                  return null;
                },
                controller: _emailTextController,
                decoration: const InputDecoration(hintText: 'Email Address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return 'Please enter username.';
                  }
                  return null;
                },
                controller: _usernameTextController,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {
                    return 'Please enter password.';
                  }
                  return null;
                },
                controller: _passwordTextController,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : Colors.black;
                    }),
                backgroundColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return states.contains(MaterialState.disabled)
                          ? null
                          : const Color(0xfff87400);
                    }),
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate() && (_formProgress == 1))
                {
                  //In the real world you'd often call a server or save the information in a database.
                  _user = UserInfo(
                      _firstNameTextController.text,
                      _lastNameTextController.text,
                      _dateOfBirthTextController.text,
                      _locationTextController.text,
                      _emailTextController.text,
                      _usernameTextController.text);
                  return _showHome();
                }
              },
              child: const Text('Submit',
                selectionColor: Color(0xfffff5f1),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget
{
  final double value;

  const AnimatedProgressIndicator({super.key,
    required this.value,
  });

  @override
  State<StatefulWidget> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin
{
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);

    final colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.orange),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.yellow, end: Colors.green),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context)
  {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAnimation.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value?.withOpacity(0.4),
      ),
    );
  }
}

class Home extends StatefulWidget
{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
{
  final _biggerFont = const TextStyle(fontSize: 24);

  void _pushFriends()
  {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _friends.map(
                (pair) {
              return ListTile(
                leading: IconButton(
                  icon: SizedBox(
                    height: 150, width: 150,
                    //square box; equal height and width so that it won't look like oval
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(75),
                        //set border radius more than 50% of height and width to make circle
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: Image(
                          image: getImage2(pair.imageIndex),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  onPressed: ()
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Opens Profile Screen')),
                    );
                  },
                ),
                title: getUsername(pair.imageIndex),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color:  Color(0xfff87400),
                    width: .25,
                  ),
                  borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('My Friends'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
  void _pushFavorites()
  {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _favorites.map(
                (pair) {
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 25),
                height: 500,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color:  Color(0xfff87400),
                      width: .25,
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                  elevation: 100.0,
                  color: const Color(0xfffff5f1),
                  child: InkWell(
                    onTap: ()
                    {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlanScreen(
                              thisPlan: pair),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ListTile(
                          leading: IconButton(
                            icon: SizedBox(
                              height: 150, width: 150,
                              //square box; equal height and width so that it won't look like oval
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(75),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(75),
                                  child: Image(
                                    image: getImage2(pair.imageIndex),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: ()
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Opens Profile Screen')),
                              );
                            },
                          ),
                          title: getUsername(pair.imageIndex),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color:  Color(0xfff87400),
                              width: .15,
                            ),
                            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: Text(
                            pair.name,
                            style: GoogleFonts.lobster(
                              textStyle: _biggerFont,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: getImage(pair.imageIndex),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );

          final divided = tiles.isNotEmpty
              ? tiles.toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('My Favorites'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
  void _pushPlans()
  {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _myPlans.map(
                (pair) {
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 25),
                height: 500,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color:  Color(0xfff87400),
                      width: .25,
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                  elevation: 100.0,
                  color: const Color(0xfffff5f1),
                  child: InkWell(
                    onTap: ()
                    {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlanScreen(
                              thisPlan: pair),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ListTile(
                          leading: IconButton(
                            icon: SizedBox(
                              height: 150, width: 150,
                              //square box; equal height and width so that it won't look like oval
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(75),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(75),
                                  child: Image(
                                    image: getImage2(pair.imageIndex),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: ()
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Opens Profile Screen')),
                              );
                            },
                          ),
                          title: getUsername(pair.imageIndex),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color:  Color(0xfff87400),
                              width: .15,
                            ),
                            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: Text(
                            pair.name,
                            style: GoogleFonts.lobster(
                              textStyle: _biggerFont,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: getImage(pair.imageIndex),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );

          final divided = tiles.isNotEmpty
              ? tiles.toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('My Plans'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
  void _pushDrafts()
  {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _drafts.map(
                (pair) {
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 25),
                height: 500,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color:  Color(0xfff87400),
                      width: .25,
                    ),
                    borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                  ),
                  elevation: 100.0,
                  color: const Color(0xfffff5f1),
                  child: InkWell(
                    onTap: ()
                    {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PlanScreen(
                              thisPlan: pair),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ListTile(
                          leading: IconButton(
                            icon: SizedBox(
                              height: 150, width: 150,
                              //square box; equal height and width so that it won't look like oval
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(75),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(75),
                                  child: Image(
                                    image: getImage2(pair.imageIndex),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: ()
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Opens Profile Screen')),
                              );
                            },
                          ),
                          title: getUsername(pair.imageIndex),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color:  Color(0xfff87400),
                              width: .15,
                            ),
                            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                          ),
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: Text(
                            pair.name,
                            style: GoogleFonts.lobster(
                              textStyle: _biggerFont,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: getImage(pair.imageIndex),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );

          final divided = tiles.isNotEmpty
              ? tiles.toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('My Drafts'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context)
  {
    return DefaultTabController(
        length: 4,
        child: WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  indicatorColor: Color(0xfff87400),
                  tabs: [
                    Tab(
                        icon: Icon(
                          Icons.home_outlined,
                          color: Color(0xffffeeee),
                          size: 30.0,
                        )
                    ),
                    Tab(
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: Color(0xffffeeee),
                        )
                    ),
                    Tab(
                        icon: Icon(
                          Icons.search_outlined,
                          color: Color(0xffffeeee),
                        )
                    ),
                    Tab(
                        icon: Icon(
                          Icons.person_outline_rounded,
                          color: Color(0xffffeeee),
                        )
                    ),
                  ],
                ),
                title: Text(
                  'Envisage',
                  style: GoogleFonts.pacifico(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                automaticallyImplyLeading: false,
              ),
              body: TabBarView(
                children: [
                  Container(
                    color: const Color(0x34fff5f1),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10,),
                        Text(
                          'My Feed',
                          style: GoogleFonts.lilyScriptOne(
                            fontSize: 36.0,
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.all(16.0),
                              itemCount: _plans.length,
                              itemBuilder: /*1*/ (context, i)
                              {
                                final alreadySaved = _favorites.contains(_plans[i]);
                                return Container(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
                                  height: 500,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color:  Color(0xfff87400),
                                        width: .25,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                                    ),
                                    elevation: 100.0,
                                    color: const Color(0xfffff5f1),
                                    child: InkWell(
                                      onTap: ()
                                      {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => PlanScreen(
                                                thisPlan: _plans[i]),
                                          ),
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ListTile(
                                            leading: IconButton(
                                              icon: SizedBox(
                                                height: 150, width: 150,
                                                //square box; equal height and width so that it won't look like oval
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(75),
                                                    //set border radius more than 50% of height and width to make circle
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(75),
                                                    child: Image(
                                                      image: getImage2(_plans[i].imageIndex),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onPressed: ()
                                              {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(content: Text('Opens Profile Screen')),
                                                );
                                              },
                                            ),
                                            title: getUsername(_plans[i].imageIndex),
                                            trailing: _plans[i].shared ? Text(
                                              'shared by ' + _user.username,
                                            ) : null,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                color:  Color(0xfff87400),
                                                width: .15,
                                              ),
                                              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Center(
                                            child: Text(
                                              _plans[i].name,
                                              style: GoogleFonts.lobster(
                                                textStyle: _biggerFont,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image(
                                                image: getImage(_plans[i].imageIndex),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: const Color(0xfffff5f1),
                    alignment: Alignment.center,
                    child: const CreatePlanScreen(),
                  ),
                  Container(
                    color: const Color(0x34fff5f1),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(
                          'Explore',
                          style: GoogleFonts.lilyScriptOne(
                            textStyle: const TextStyle(
                              fontSize: 48,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: [
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
                                    height: 200,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color:  Color(0xfff87400),
                                          width: .25,
                                        ),
                                        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                                      ),
                                      elevation: 100.0,
                                      color: const Color(0xfffff5f1),
                                      child: InkWell(
                                        onTap: ()
                                        {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => Explore(
                                                  searchType: 'Theme'),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            'Themes',
                                            style: GoogleFonts.lobster(
                                              textStyle: const TextStyle(
                                                fontSize: 36,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
                                    height: 200,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color:  Color(0xfff87400),
                                          width: .25,
                                        ),
                                        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                                      ),
                                      elevation: 100.0,
                                      color: const Color(0xfffff5f1),
                                      child: InkWell(
                                        onTap: ()
                                        {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => Explore(
                                                  searchType: 'Location'),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            'Location',
                                            style: GoogleFonts.lobster(
                                              textStyle: const TextStyle(
                                                fontSize: 36,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
                                    height: 200,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color:  Color(0xfff87400),
                                          width: .25,
                                        ),
                                        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                                      ),
                                      elevation: 100.0,
                                      color: const Color(0xfffff5f1),
                                      child: InkWell(
                                        onTap: ()
                                        {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => Explore(
                                                  searchType: 'Cost'),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            'Cost',
                                            style: GoogleFonts.lobster(
                                              textStyle: const TextStyle(
                                                fontSize: 36,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 25),
                                    height: 200,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color:  Color(0xfff87400),
                                          width: .25,
                                        ),
                                        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                                      ),
                                      elevation: 100.0,
                                      color: const Color(0xfffff5f1),
                                      child: InkWell(
                                        onTap: ()
                                        {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => Explore(
                                                  searchType: 'Duration'),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            'Duration',
                                            style: GoogleFonts.lobster(
                                              textStyle: const TextStyle(
                                                fontSize: 36,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ),
                      ],
                    )
                  ),
                  Container(
                    color: const Color(0xfffff5f1),
                    alignment: Alignment.center,
                    child: DefaultTabController(
                      length: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                alignment:Alignment.topCenter,
                                padding: EdgeInsets.all(15),
                                child: SizedBox(
                                    height: 350, width: 350,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color:  Color(0xfff87400),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(180), //<-- SEE HERE
                                      ),
                                      elevation: 10,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(180),
                                        child: Image(
                                          image: getImage2(25),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    )
                                )
                            ),
                            const SizedBox(height: 40,),
                            Text(
                              'My Info',
                              style: GoogleFonts.lilyScriptOne(
                                textStyle: const TextStyle(
                                  fontSize: 48,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Text('Username: ${_user.username}', style: const TextStyle(fontSize: 24),),
                            Text('Name: ${_user.firstName} ${_user.lastName}', style: const TextStyle(fontSize: 24),),
                            Text('Date of Birth: ${_user.dateOfBirth}', style: const TextStyle(fontSize: 24),),
                            Text('Location: ${_user.location}', style: const TextStyle(fontSize: 24),),
                            Text('Email: ${_user.email}', style: const TextStyle(fontSize: 24),),
                            const SizedBox(height: 20,),
                            TextButton(
                                onPressed: _pushFriends,
                                child: Text(
                                  'Friends',
                                  style: GoogleFonts.lobster(
                                    textStyle: const TextStyle(
                                        fontSize: 36,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                ),
                            ),
                            TextButton(
                              onPressed: _pushFavorites,
                              child: Text(
                                'Favorites',
                                style: GoogleFonts.lobster(
                                  textStyle: const TextStyle(
                                      fontSize: 36,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: _pushPlans,
                              child: Text(
                                'Plans',
                                style: GoogleFonts.lobster(
                                  textStyle: const TextStyle(
                                      fontSize: 36,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: _pushDrafts,
                              child: Text(
                                'Drafts',
                                style: GoogleFonts.lobster(
                                  textStyle: const TextStyle(
                                      fontSize: 36,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 80,),
                          ],
                        ),
                      ),
                    )
                  ),
                ]
              ),
            )
        )
    );
  }
}

class Explore extends StatefulWidget
{
  final String searchType;
  const Explore({Key? key, required this.searchType}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore>
{
  static const historyLength = 5;
// The filtered & ordered history that's accessed from the UI
  List<String> filteredSearchHistory = _searchHistory.reversed.toList();
// The currently searched-for term
  String selectedTerm = '';

  List<String> filterSearchTerms(String filter)
  {
    if (filter.isNotEmpty)
    {
      return _searchHistory
          .reversed
          .where((term) => term.startsWith(filter)).toList();
    }
    else
    {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term)
  {
    if (term.isEmpty) { return; }
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength)
    {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
    filteredSearchHistory = _searchHistory.reversed.toList();
  }

  void deleteSearchTerm(String term)
  {
    _searchHistory.removeWhere((element) => element == term);
    filteredSearchHistory = _searchHistory.reversed.toList();
  }

  void putSearchTermFirst(String term)
  {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  final FloatingSearchBarController fsbcontroller = FloatingSearchBarController();

  @override
  void dispose()
  {
    fsbcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Envisage',
          style: GoogleFonts.pacifico(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FloatingSearchBar(
          controller: fsbcontroller,
          body: FloatingSearchBarScrollNotifier(
            child: SearchResultsListView(
              searchTerm: selectedTerm,
              searchType: widget.searchType,
            ),
          ),
          transition: CircularFloatingSearchBarTransition(),
          physics: const BouncingScrollPhysics(),
          title: Text(
            selectedTerm.isEmpty ? 'Explore by ' + widget.searchType : selectedTerm,
          ),
          hint: 'Search Plans by ' + widget.searchType + '...',
          actions: [
            FloatingSearchBarAction.searchToClear(),
          ],
          onQueryChanged: (query)
          {
            setState(()
            {
              filteredSearchHistory = filterSearchTerms(query);
            });
          },
          onSubmitted: (query)
          {
            setState(()
            {
              addSearchTerm(query);
              selectedTerm = query;
            });
            fsbcontroller.close();
          },
          builder: (context, transition)
          {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 8,
                child: Builder(
                  builder: (context)
                  {
                    if (filteredSearchHistory.isEmpty && fsbcontroller.query.isEmpty)
                    {
                      return Container(
                        height: 56,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Start Exploring',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    }
                    else if (filteredSearchHistory.isEmpty)
                    {
                      return ListTile(
                        title: Text(fsbcontroller.query),
                        leading: const Icon(Icons.search),
                        onTap: ()
                        {
                          setState(()
                          {
                            addSearchTerm(fsbcontroller.query);
                            selectedTerm = fsbcontroller.query;
                          });
                          fsbcontroller.close();
                        },
                      );
                    }
                    else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: filteredSearchHistory.map(
                              (term) => ListTile(
                                title: Text(
                                  term,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: const Icon(Icons.history),
                                trailing: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      deleteSearchTerm(term);
                                    });
                                  },
                                ),
                                onTap: () {
                                  setState(() {
                                    putSearchTermFirst(term);
                                    selectedTerm = term;
                                  });
                                  fsbcontroller.close();
                                },
                              ),
                        ).toList(),
                      );
                    }
                  },
                ),
              ),
            );
          }
      ),
    );
  }
}

class SearchResultsListView extends StatefulWidget
{
  final String searchTerm;
  final String searchType;
  const SearchResultsListView({Key? key, required this.searchTerm, required this.searchType}) : super(key: key);

  @override
  State<SearchResultsListView> createState() => _SearchResultsListViewState();
}

class _SearchResultsListViewState extends State<SearchResultsListView>
{
  List<Plan>searchResults = [];

  void setSearchResults()
  {
      if(widget.searchType == 'Theme')
      {
        searchResults = _plans.where((plan)
        {
          String input = widget.searchTerm.toLowerCase();
          String name = plan.name.toLowerCase();
          String theme = plan.theme.toLowerCase();
          return name.contains(input) || theme.contains(input);
        }).toList();
      }
      else if(widget.searchType == 'Location')
      {
        searchResults = _plans.where((plan)
        {
          String input = widget.searchTerm.toLowerCase();
          String location = plan.location.toLowerCase();
          return location.contains(input);
        }).toList();
      }
      else if(widget.searchType == 'Cost')
      {
        searchResults = _plans.where((plan)
        {
          String input = widget.searchTerm.toLowerCase();
          String cost = plan.cost.toLowerCase();
          return cost.contains(input);
        }).toList();
      }
      else
      {
        searchResults = _plans.where((plan)
        {
          String input = widget.searchTerm.toLowerCase();
          String duration = plan.duration.toLowerCase();
          return duration.contains(input);
        }).toList();
      }

  }

  @override
  Widget build(BuildContext context)
  {
    setSearchResults();
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: searchResults.length,
      itemBuilder: (context, i)
      {
        final alreadySaved = _favorites.contains(searchResults[i]);
        return Container(
          padding: const EdgeInsets.fromLTRB(10, 45, 10, 0),
          height: 500,
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xfff87400),
                width: .25,
              ),
              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
            ),
            elevation: 100.0,
            color: const Color(0xfffff5f1),
            child: InkWell(
              onTap: ()
              {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PlanScreen(
                        thisPlan: searchResults[i]),
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ListTile(
                    leading: IconButton(
                      icon: SizedBox(
                        height: 150, width: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(75),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(75),
                            child: Image(
                              image: getImage2(searchResults[i].imageIndex),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      onPressed: ()
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Opens Profile Screen')),
                        );
                      },
                    ),
                    title: getUsername(searchResults[i].imageIndex),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color:  Color(0xfff87400),
                        width: .15,
                      ),
                      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Text(
                      searchResults[i].name,
                      style: GoogleFonts.lobster(
                        textStyle: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: getImage(searchResults[i].imageIndex),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

NetworkImage getImage(int index)
{
  switch (index)
  {
    case 0:
      return const NetworkImage('https://d2s742iet3d3t1.cloudfront.net/restaurants/restaurant-60002000000000000/banner_1666113815.jpg');
    case 1:
      return const NetworkImage('https://i2.wp.com/www.yourhikeguide.com/wp-content/uploads/DSC1867.jpg');
    case 2:
      return const NetworkImage('https://www.myutahparks.com/wp-content/uploads/2021/02/Arches-DelicateArch-LaSalMountains_DP_1600.jpg');
    case 3:
      return const NetworkImage('https://i0.wp.com/www.ski.com/blog/wp-content/uploads/2017/09/famskiin.jpg?fit=1800%2C1200&ssl=1');
    case 4:
      return const NetworkImage('https://imageio.forbes.com/i-forbesimg/media/lists/places/st-george-ut_416x416.jpg?format=jpg&height=416&width=416&fit=bounds');
    case 5:
      return const NetworkImage('https://visitutahkenticoprod.blob.core.windows.net/cmsroot/visitutah/media/site-assets/three-season-photography/mighty-5/zion/zion-national-park_the-narrows_istock.jpg');
    case 6:
      return const NetworkImage('https://www.planetware.com/wpimages/2020/12/dominican-republic-punta-cana-best-all-inclusive-resorts-hyatt-ziva-cap-cana.jpg');
    case 7:
      return const NetworkImage('https://cdn.travelpulse.com/images/faa9edf4-a957-df11-b491-006073e71405/c0594e9a-dd27-41b9-b02b-0c0362deadce/630x355.jpg');
    default:
      return const NetworkImage('https://d2rdhxfof4qmbb.cloudfront.net/wp-content/uploads/20180328202339/Barbados-FI-1.jpg');
  }
}

NetworkImage getImage2(int index)
{
  switch (index)
  {
    case 0:
      return const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsynwv-5qtogtOwJbIjaPFJUmHpzhxgqIAug&usqp=CAU');
    case 1:
      return const NetworkImage('https://tinyurl.com/yc49xjtk');
    case 2:
      return const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsynwv-5qtogtOwJbIjaPFJUmHpzhxgqIAug&usqp=CAU');
    case 3:
      return const NetworkImage('https://tinyurl.com/avtu7jft');
    case 4:
      return const NetworkImage('https://tinyurl.com/yc49xjtk');
    case 5:
      return const NetworkImage('https://tinyurl.com/46khjhuj');
    case 6:
      return const NetworkImage('https://tinyurl.com/2ppz6ass');
    case 7:
      return const NetworkImage('https://tinyurl.com/4wvy4c4m');
    default:
      return const NetworkImage('https://tinyurl.com/3k6s4ack');
  }
}

Text getUsername(int index)
{
  final _usernameFont = const TextStyle(fontSize: 14);
  switch (index)
  {
    case 0:
      return Text(
        'JaylenTravels',
        style: GoogleFonts.philosopher(
          textStyle: _usernameFont,
          ),
        );
    case 1:
      return Text(
        'Mark&Kate21',
        style: GoogleFonts.philosopher(
          textStyle: _usernameFont,
        ),
      );
    case 2:
      return Text(
        'JaylenTravels',
        style: GoogleFonts.philosopher(
          textStyle: _usernameFont,
        ),
      );
    case 3:
      return Text(
        'TheJacks24',
        style: GoogleFonts.philosopher(
          textStyle: _usernameFont,
        ),
      );
    case 4:
      return Text(
        'Mark&Kate21',
        style: GoogleFonts.philosopher(
          textStyle: _usernameFont,
        ),
      );
    case 5:
      return Text(
        'cArL!33',
        style: GoogleFonts.philosopher(
          textStyle: _usernameFont,
        ),
      );
    case 6:
      return Text(
        'Mrs.Vacation',
        style: GoogleFonts.philosopher(
          textStyle: _usernameFont,
        ),
      );
    case 7:
      return Text(
        'FrenchyIsMe',
        style: GoogleFonts.philosopher(
          textStyle: _usernameFont,
        ),
      );
    default:
      return Text(
        _user.username,
        style: GoogleFonts.philosopher(
          textStyle: _usernameFont,
        ),
      );
  }
}

class Plan
{
  String name = "";
  String activity = "";
  String location = "";
  String duration = "";
  String durationType = "";
  String cost = "";
  String theme = "";
  bool shared = false;
  int imageIndex = 25;

  Plan(this.name, this.activity, this.location, this.duration, this.cost, this.theme);
  Plan.full(this.name, this.activity, this.location, this.duration, this.cost, this.theme, this.imageIndex);
  Plan.blank();
}

class PlanScreen extends StatefulWidget
{
  final Plan thisPlan;

  const PlanScreen({Key? key, required this.thisPlan}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen>
{
  @override
  Widget build(BuildContext context)
  {
    bool alreadyFavorite = _favorites.contains(widget.thisPlan);
    final int imageIndex = widget.thisPlan.imageIndex;
    return Scaffold(
        backgroundColor: const Color(0xfffff5f1),
        appBar: AppBar(
          title: const Text(
            'Envisage',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          titleTextStyle: GoogleFonts.lilyScriptOne(),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Text(
                  widget.thisPlan.name,
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      fontSize: 48,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  width: 350,
                  child: Expanded(
                      child: Image(
                        image: getImage(imageIndex),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
                const SizedBox(height: 30,),
                Text(
                  'Activity',
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
                Text(
                    widget.thisPlan.activity,
                    style: const TextStyle(
                      fontSize: 18
                    ),
                ),
                const SizedBox(height: 20,),
                Text(
                  'Location',
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
                Text(
                  widget.thisPlan.location,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  'Duration',
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
                Text(widget.thisPlan.duration,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  'Cost',
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(widget.thisPlan.cost + ' / person',
                  style: const TextStyle(
                      fontSize: 18
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  'Theme',
                  style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(widget.thisPlan.theme,
                  style: const TextStyle(
                      fontSize: 18
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              return states.contains(MaterialState.disabled)
                                  ? null
                                  : Colors.black;
                            }),
                        backgroundColor: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              return states.contains(MaterialState.disabled)
                                  ? null
                                  : const Color(0xfff87400);
                            }),
                      ),
                      onPressed: ()
                      {
                        if (alreadyFavorite)
                        {
                          _favorites.remove(widget.thisPlan);
                          ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Removed from My Favorites')),
                          );
                        }
                        else
                        {
                          _favorites.insert(0, widget.thisPlan);
                          ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to My Favorites')),
                          );
                        }
                      },
                      child: Text(
                        alreadyFavorite ? 'Remove from My Favorites' : 'Add to My Favorites',
                      ),
                    ),
                    const SizedBox(width: 20,),
                    ElevatedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              return states.contains(MaterialState.disabled)
                                  ? null
                                  : Colors.black;
                            }),
                        backgroundColor: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              return states.contains(MaterialState.disabled)
                                  ? null
                                  : const Color(0xfff87400);
                            }),
                      ),
                      onPressed: ()
                      {
                        Plan newPlan = Plan.full(
                            widget.thisPlan.name,
                            widget.thisPlan.activity,
                            widget.thisPlan.location,
                            widget.thisPlan.duration,
                            widget.thisPlan.cost,
                            widget.thisPlan.theme,
                            widget.thisPlan.imageIndex);
                        newPlan.shared = true;
                        _plans.insert(0, newPlan);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Shared')),
                        );
                      },
                      child: const Text(
                        'Share',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48,
                ),
              ],
            )
          ),
    );
  }
}

class CreatePlanScreen extends StatefulWidget
{
  const CreatePlanScreen({Key? key}) : super(key: key);

  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen>
{
  final _nameTextController = TextEditingController();
  final _activityTextController = TextEditingController();
  final _locationTextController = TextEditingController();
  final _durationTextController = TextEditingController();
  final _costTextController = TextEditingController();
  final _themeTextController = TextEditingController();
  Plan _newPlan = Plan.blank();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    _nameTextController.dispose();
    _activityTextController.dispose();
    _locationTextController.dispose();
    _durationTextController.dispose();
    _costTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12,),
            Text(
              'Create A Plan',
              style: GoogleFonts.lilyScriptOne(
                textStyle: const TextStyle(
                  fontSize: 48,
                ),
              ),
            ),
            const SizedBox(height: 12,),
            const SizedBox(
              height: 250,
              width: 375,
              child:
                Card(
                  color: Color(0xffffc09d),
                  child: Center(
                    child: Icon(
                      //icon: Icon(
                        Icons.add_a_photo_rounded,
                        size: 100,
                        color: Color(0xff0ea0a8),
                      ),
                      //onPressed: null,
                    //),
                  ),
                ),
            ),
            const SizedBox(height: 20,),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty)
                        {
                          return 'Please enter plan name.';
                        }
                        return null;
                      },
                      controller: _nameTextController,
                      decoration: const InputDecoration(hintText: 'Plan Name'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
                    child: TextFormField(
                      controller: _activityTextController,
                      decoration: const InputDecoration(hintText: 'Activity'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
                    child: TextFormField(
                      controller: _locationTextController,
                      decoration: const InputDecoration(hintText: 'Location'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
                    child: TextFormField(
                      controller: _durationTextController,
                      decoration: const InputDecoration(hintText: 'Duration'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
                    child: TextFormField(
                      controller: _costTextController,
                      decoration: const InputDecoration(hintText: 'Cost'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
                    child: TextFormField(
                      controller: _themeTextController,
                      decoration: const InputDecoration(hintText: 'Theme'),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith(
                                  (Set<MaterialState> states) {
                                return states.contains(MaterialState.disabled)
                                    ? null
                                    : Colors.black;
                              }),
                          backgroundColor: MaterialStateProperty.resolveWith(
                                  (Set<MaterialState> states) {
                                return states.contains(MaterialState.disabled)
                                    ? null
                                    : const Color(0xfff87400);
                              }),
                        ),
                        onPressed: ()
                        {
                          if (_formKey.currentState!.validate())
                          {
                            _newPlan = Plan(
                                _nameTextController.text,
                                _activityTextController.text,
                                _locationTextController.text,
                                _durationTextController.text,
                                _costTextController.text,
                                _themeTextController.text
                            );

                            if (_activityTextController.text.isEmpty
                            || _locationTextController.text.isEmpty
                            || _durationTextController.text.isEmpty
                            || _costTextController.text.isEmpty
                            || _themeTextController.text.isEmpty)
                            {
                              _drafts.insert(0, _newPlan);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Added to Drafts')),
                              );
                            }
                            else
                            {
                              _myPlans.insert(0, _newPlan);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Added to Completed')),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Add to My Plans',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.resolveWith(
                                  (Set<MaterialState> states) {
                                return states.contains(MaterialState.disabled)
                                    ? null
                                    : Colors.black;
                              }),
                          backgroundColor: MaterialStateProperty.resolveWith(
                                  (Set<MaterialState> states) {
                                return states.contains(MaterialState.disabled)
                                    ? null
                                    : const Color(0xfff87400);
                              }),
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate())
                          {
                            //In the real world you'd often call a server or save the information in a database.
                            _newPlan = Plan(
                                _nameTextController.text,
                                _activityTextController.text,
                                _locationTextController.text,
                                _durationTextController.text,
                                _costTextController.text,
                                _themeTextController.text
                            );
                            if (_activityTextController.text.isEmpty
                                || _locationTextController.text.isEmpty
                                || _durationTextController.text.isEmpty
                                || _costTextController.text.isEmpty
                                || _themeTextController.text.isEmpty)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Cannot Post. Plan is Incomplete.')),
                              );
                            }
                            else
                            {
                              _plans.insert(0, _newPlan);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Posted to My Feed')),
                              );
                            }

                          }
                        },
                        child: const Text(
                          'Post',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                ],
              ),
            ),
          ],
        )
    );
  }
}

class UserInfo
{
  String firstName = "";
  String lastName = "";
  String dateOfBirth = "";
  String location = "";
  String email = "";
  String username = "";
  int imageIndex = 25;

  UserInfo(this.firstName, this.lastName, this.dateOfBirth, this.location, this.email, this.username);
  UserInfo.full(this.firstName, this.lastName, this.dateOfBirth, this.location, this.email, this.username, this.imageIndex);
}