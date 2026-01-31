import 'dart:io';

import 'package:femitime_project/authentication/patient/login_screen/login_view_page.dart';
import 'package:femitime_project/patient_screen/home_screen.dart';
import 'package:femitime_project/patient_screen/list_nearbyhos_doc/list_nearbyhos_doc_view.dart';
import 'package:femitime_project/patient_screen/pcod_prediction/input_condition_datas.dart/input_condition_service.dart';
import 'package:femitime_project/patient_screen/remedies/remedy_splashscreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HealthProfileScreen extends StatefulWidget {
  const HealthProfileScreen({super.key, required this.userId});
  final int userId;
  @override
  // ignore: library_private_types_in_public_api
  _HealthProfileScreenState createState() => _HealthProfileScreenState();
}

class _HealthProfileScreenState extends State<HealthProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bmiController = TextEditingController();

  // Form values
  String? age,
      weight,
      height,
      fastFoodConsumption,
      bloodGroup,
      pulseRate,
      cycleRegularity,
      lh,
      fsh,
      tsh,
      hairGrowth,
      acne,
      moodSwings,
      skinDarkness;

  // Options for dropdowns
  final List<String> _bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  final List<String> _frequencyOptions = ['Never', 'Rarely', 'Often', 'Daily'];
  final List<String> _regularityOptions = ['Regular', 'Irregular'];
  final List<String> _severityOptions = ['None', 'Mild', 'Moderate', 'Severe'];

  int? userId;
  @override
  void initState() {
    super.initState();
    userId = widget.userId;
  }

  File? selectedPdf;
  String? pdfFileName;

  Future<void> pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        selectedPdf = File(result.files.single.path!);
        pdfFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Health Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 122, 67, 98),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 600),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    LoginScreen(),
              ),
            );
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 238, 193, 209),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Personal Details'),
              _buildTextField(
                'Age (years)',
                'Enter your age',
                onChanged: (v) {
                  age = v;
                  _calculateBMI();
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      'Weight (kg)',
                      'Enter weight',
                      onChanged: (v) {
                        weight = v;
                        _calculateBMI();
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildTextField(
                      'Height (cm)',
                      'Enter height',
                      onChanged: (v) {
                        height = v;
                        _calculateBMI();
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              _buildTextField(
                'BMI',
                'Auto Calculated BMI',
                controller: _bmiController,
                enabled: false,
              ),

              SizedBox(height: 16),

              _buildSectionHeader('Lifestyle'),
              _buildDropdown('Fast Food Consumption', _frequencyOptions, (v) {
                fastFoodConsumption = v;
              }),

              _buildSectionHeader('Medical Information'),
              _buildDropdown('Blood Group', _bloodGroups, (v) {
                bloodGroup = v;
              }),
              SizedBox(height: 16),
              // _buildTextField(
              //   'Pulse Rate (bpm)',
              //   'Enter pulse rate',
              //   onChanged: (v) {
              //     pulseRate = v;
              //   },
              //   keyboardType: TextInputType.number,
              // ),

              _buildSectionHeader('Hormonal Health'),
              _buildDropdown('Cycle Regularity', _regularityOptions, (v) {
                cycleRegularity = v;
              }),

              SizedBox(height: 16),

              _buildSectionHeader('Symptoms'),
              _buildDropdown('Unwanted Hair Growth', _severityOptions, (v) {
                hairGrowth = v;
              }),
              SizedBox(height: 16),
              _buildDropdown('Acne', _severityOptions, (v) {
                acne = v;
              }),
              SizedBox(height: 16),
              _buildDropdown('Mood Swings', _severityOptions, (v) {
                moodSwings = v;
              }),
              SizedBox(height: 16),
              _buildDropdown('Skin Darkness', _severityOptions, (v) {
                skinDarkness = v;
              }),

              _buildSectionHeader("Upload Bloodtest Report (PDF)"),

              InkWell(
                onTap: pickPdf,
                child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.upload_file, color: Colors.pink),
                      SizedBox(width: 12),
                      Text(pdfFileName ?? "Select PDF report"),
                    ],
                  ),
                ),
              ),

              // SizedBox(height: 20),
              SizedBox(height: 32),
              Center(child: _buildSubmitButton()),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) => Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.pink[300],
      ),
    ),
  );

  Widget _buildTextField(
    String label,
    String hint, {
    TextInputType? keyboardType,
    ValueChanged<String>? onChanged,
    TextEditingController? controller,
    bool enabled = true,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
      enabled: enabled,
      inputFormatters: keyboardType == TextInputType.number
          ? [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))]
          : null,
      validator: (v) => v == null || v.isEmpty ? "Required" : null,
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> options,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      items: options
          .map((v) => DropdownMenuItem<String>(value: v, child: Text(v)))
          .toList(),
      onChanged: onChanged,
      borderRadius: BorderRadius.circular(12),
      validator: (v) => v == null || v.isEmpty ? "Required" : null,
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _onSubmit,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 2,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        child: Text(
          'Next',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  void _calculateBMI() {
    if (weight != null &&
        height != null &&
        weight!.isNotEmpty &&
        height!.isNotEmpty) {
      try {
        final double weightKg = double.parse(weight!);
        final double heightMeters = double.parse(height!) / 100;
        final double bmi = weightKg / (heightMeters * heightMeters);
        setState(() {
          _bmiController.text = bmi.toStringAsFixed(1);
        });
      } catch (e) {
        /* ignore parse error */
      }
    }
  }

  int mapFrequency(String? value) {
    switch (value) {
      case 'Never':
        return 0;
      case 'Rarely':
        return 1;
      case 'Often':
        return 2;
      case 'Daily':
        return 3;
      default:
        return 0;
    }
  }

  int mapRegularity(String? value) => value == 'Regular' ? 0 : 1;
  int mapSeverity(String? value) {
    switch (value) {
      case 'None':
        return 0;
      case 'Mild':
        return 1;
      case 'Moderate':
        return 2;
      case 'Severe':
        return 3;
      default:
        return 0;
    }
  }

 Future<void> _onSubmit() async {
  if (!_formKey.currentState!.validate()) return;

  if (selectedPdf == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please upload PDF")),
    );
    return;
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const Center(child: CircularProgressIndicator()),
  );

  try {
    final response = await inputHealthProfile(
      userId: userId!,
      age: int.parse(age!),
      weight: double.parse(weight!),
      height: double.parse(height!),
      bmi: double.parse(_bmiController.text),
      fastFoodConsumption: fastFoodConsumption!, // STRING
      bloodGroup: bloodGroup!,
      cycleRegularity: mapRegularity(cycleRegularity),
      hairGrowth: mapSeverity(hairGrowth),
      acne: mapSeverity(acne),
      moodSwings: mapSeverity(moodSwings),
      skinDarkening: mapSeverity(skinDarkness),
      pdfFile: selectedPdf!,
    );

    Navigator.of(context).pop();
    _showPredictionDialog(response.result);
  } catch (e) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}


 void _showPredictionDialog(String riskLevel) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => AlertDialog(
      title: Text("Result: $riskLevel"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop(); // close dialog first

            if (riskLevel == 'Likely') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RemedySplashScreen(),
                ),
              );
            } else if (riskLevel == 'High Risk') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FindHosDoctorScreen(userId: userId!),
                ),
              );
            } else {
              // Unlikely or anything else
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeScreen(userId: userId!,),
                ),
              );
            }
          },
          child: const Text("OK"),
        ),
      ],
    ),
  );
}


  @override
  void dispose() {
    _bmiController.dispose();
    super.dispose();
  }
}
