import 'package:femitime_project/screens/menstrual_track/input_cycle/bloc/input_cycle_bloc.dart';
import 'package:femitime_project/screens/menstrual_track/table_calender/table_calender_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeriodInputScreen extends StatefulWidget {
  const PeriodInputScreen({super.key, required this.userId});
  final int userId;

  @override
  // ignore: library_private_types_in_public_api
  _PeriodInputScreenState createState() => _PeriodInputScreenState();
}

class _PeriodInputScreenState extends State<PeriodInputScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  DateTime? _lastPeriodDate;
  final TextEditingController _cycleLengthController = TextEditingController();
  final TextEditingController _periodDurationController =
      TextEditingController();
  String flowIntensity = 'Medium';
  String symptoms = 'Cramps';
  final TextEditingController _descriptionController = TextEditingController();
  int? userId;
  Future<void> _pickDate() async {
    DateTime initialDate = _lastPeriodDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (picked != null && picked != _lastPeriodDate) {
      setState(() {
        _lastPeriodDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    userId = widget.userId;
    print('PeriodInputScreen=$userId');
  }

  Future<void> submitDetails() async {
    FocusScope.of(context).unfocus();

    if (_lastPeriodDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select the last day of your period."),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final int duration = int.tryParse(_periodDurationController.text) ?? 0;
    final int cycleLength = int.tryParse(_cycleLengthController.text) ?? 0;
    final String description = _descriptionController.text;

    setState(() {
      isloading = true;
    });

    context.read<InputCycleBloc>().add(
      InputCycleEvent.saveInputCycle(
        userId: userId!,
        dayofperiod: _lastPeriodDate!.toIso8601String().split('T')[0],
        duration: duration,
        cycleLength: cycleLength,
        flowIntensity: flowIntensity,
        symptoms: symptoms,
        description: description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_sharp,
        color: const Color.fromARGB(255, 177, 11, 66),)),
        title: Text('Period Cycle Details'),
        backgroundColor: Colors.pink[100],
      ),
      body: BlocConsumer<InputCycleBloc, InputCycleState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {
              setState(() => isloading = true);
            },
            success: (response) {
              setState(() => isloading = false);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Registration Successful"),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return PeriodCalendarScreen(
                      lastPeriodStart: _lastPeriodDate!,
                      cycleLength:
                          int.tryParse(_cycleLengthController.text) ?? 0,
                      periodLength:
                          int.tryParse(_periodDurationController.text) ?? 0,
                      userId: userId!,
                    );
                  },
                ),
              );
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
        builder: (context, state) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Last day of periods (date picker)
                Text(
                  'Periods Start Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: _pickDate,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(
                      _lastPeriodDate == null
                          ? 'Select Date'
                          : '${_lastPeriodDate!.day}/${_lastPeriodDate!.month}/${_lastPeriodDate!.year}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Cycle length
                TextFormField(
                  controller: _cycleLengthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Average Cycle Length (days)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Enter cycle length'
                      : null,
                ),
                SizedBox(height: 24),

                // Periods duration
                TextFormField(
                  controller: _periodDurationController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Average Period Duration (days)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  validator: (value) => (value == null || value.isEmpty)
                      ? 'Enter duration'
                      : null,
                ),
                SizedBox(height: 24),

                // Flow intensity dropdown
                Text(
                  'Flow Intensity',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: flowIntensity,
                  items: ['Light', 'Medium', 'Heavy'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      flowIntensity = value!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Symptoms dropdown
                Text('Symptoms', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: symptoms,
                  items: ['Cramps', 'Mood Swings', 'Cravings'].map((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      symptoms = value!;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Description TextFormField
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  maxLines: 4,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 32),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submitDetails();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[200],
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
