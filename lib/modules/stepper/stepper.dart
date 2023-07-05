import 'package:flutter/material.dart';
class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  _StepperScreenState createState() => _StepperScreenState();
}
class _StepperScreenState extends State<StepperScreen> {

// Here we have created list of steps that
// are required to complete the form
  List<Step> stepList() {
    return [
      const Step(
          title: Text('Account'), content: Center(child: Text('Account'),)),
      const Step(
          title: Text('Address'), content: Center(child: Text('Address'),)),
      const Step(
          title: Text('Confirm'), content: Center(child: Text('Confirm'),))
    ];
  }
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: const Text('Stepper',style: TextStyle(color: Colors.white), ),
        ),
        // Here we have initialized the stepper widget
        body: Stepper(
          steps: stepList(),
          currentStep: index,
          onStepCancel: (){
            if(index>0){
              setState(() {
                index--;
              });
            }
          },
          onStepContinue: (){
            if(index>=0&&index<stepList().length-1){
              setState(() {
                index++;
              });
            }
          },
          onStepTapped: (int idx){
            index=idx;
            setState(() {

            });
          },
        )
    );
  }
}
