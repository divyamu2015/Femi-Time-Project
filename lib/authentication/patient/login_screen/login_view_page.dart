import 'package:animated_input_border/animated_input_border.dart';
import 'package:femitime_project/authentication/patient/login_screen/bloc/login_screen_bloc.dart';
import 'package:femitime_project/authentication/patient/registration_screen/registration_page_view.dart';
import 'package:femitime_project/other_screen/role_wise.dart';
import 'package:femitime_project/patient_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:typewritertext/typewritertext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  late AnimationController _animationController;
  bool isloading = false;
   bool _obscurePassword = true;
  final String _selectedUserType = 'user';
  int? userId;
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..forward();
  }

  Future<void> loginState() async {
    print(123);
    FocusScope.of(context).unfocus();
    setState(() {
      isloading = true;
    });
    String emplId = emailController.text.trim();
    String emplPass = passController.text.trim();

    print('after validation');

    if (emplId.isEmpty || emplPass.isEmpty) {
      showError("Please enter all details");
      setState(() => isloading = false);
      return;
    }
    context.read<LoginScreenBloc>().add(
      LoginScreenEvent.userLogin(
        role: _selectedUserType,
        email: emplId,
        password: emplPass,
      ),
    );
  }

  Future<void> storeUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', userId);
    print('User ID stored: $userId');
  }

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    print("Retrieved User ID: $userId");
    return userId;
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  Widget _buildTextField(
  String label, {
  bool obscureText = false,
  required TextEditingController controller,
  required String? Function(String?)? validator,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: TextFormField(
      obscureText: obscureText ? _obscurePassword : false,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        border: AnimatedInputBorder(
          animationValue: _animationController.value,
        ),
        focusedBorder: AnimatedInputBorder(
          animationValue: _animationController.value,
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(width: 2.0, color: Color(0xFF163A57)),
        ),
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              )
            : null,
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 193, 209),
          leadingWidth: 70, // give enough space for column
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.personal_injury,
                  color: const Color.fromARGB(255, 128, 50, 76),
                  size: 28,
                ),
                const SizedBox(height: 2),
                TypeWriter.text(
                  "Femi Time",
                  maintainSize: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 187, 88, 121),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  duration: const Duration(milliseconds: 150),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
              ),
              icon: Icon(
                Icons.rotate_left_outlined,
                color: const Color.fromARGB(255, 122, 67, 98),
                size: 40,
              ),
            ),
          ],
        ),

        body: BlocConsumer<LoginScreenBloc, LoginScreenState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {
                setState(() {
                  isloading = true;
                });
              },
              success: (response) async {
                await storeUserId(response.userId);
                userId = await getUserId();
                setState(() {
                  isloading = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("User login successful"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen(userId: userId!);
                        //HealthProfileScreen(userId: userId!);
                        // ChatScreen(userId: userId!);
                        // HomeScreen(userId: userId!);
                      },
                    ),
                  );
                });
              },
              error: (error) {
                setState(() {
                  isloading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Error: $error"),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
          builder: (context, state) => SingleChildScrollView(
            child: SizedBox(
              height: h,
              width: w,

              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     opacity: 0.4,
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/loogo.jpeg'),
              //   ),
              // ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    // begin: Alignment.,
                    //end: Alignment.bottomRight,
                    colors: [
                      Colors.pink[100]!,
                      Colors.pink[50]!,
                      Colors.pink[100]!,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 55.0),
                  child: Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.purple.shade50],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: Offset(0, 8),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.purple.shade300,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child:
                              ClipOval(
                                child: Image.asset(
                                  "assets/images/logo2.JPG",
                                  width: h * 0.25,
                                  height: h * 0.25,
                                  fit: BoxFit.cover,
                                ),
                              ).animate().scale(
                                duration: 3.5.seconds,
                                curve: Curves.easeOutBack,
                              ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) => Form(
                            key: _fromKey,
                            child: Card(
                              child: Column(
                                children: [
                                  _buildTextField(
                                    "Email",
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter your Email";
                                      }

                                      return null;
                                    },
                                  ),
                                  _buildTextField(
                                    "Password",
                                    obscureText: true,
                                    //  keyboardType: TextInputType.pas,
                                    controller: passController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Enter your Password";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(
                              Size(w * 0.9, 50),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(
                              const Color.fromARGB(255, 156, 80, 122),
                            ),
                          ),
                          onPressed: isloading ? null : loginState,
                          child: isloading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegistrationPage();
                                },
                              ),
                            );
                          },
                          child: const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: 'Don\'t have an account?'),
                                TextSpan(
                                  text: 'SignUp',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 49, 25, 43),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    //);
  }
}
