import 'package:calendar_schedular/component/custom_text_field.dart';
import 'package:calendar_schedular/const/colors.dart';
import 'package:calendar_schedular/model/schedule_model.dart';
import 'package:calendar_schedular/provider/schedule_provider.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:get_it/get_it.dart';
import 'package:calendar_schedular/database/drift_database.dart';
import 'package:provider/provider.dart';

import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const ScheduleBottomSheet({
    required this.selectedDate,
    Key ?key
    }):super(key:key);

  @override
  State<ScheduleBottomSheet> createState()=> _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet>{
  final GlobalKey<FormState> formkey = GlobalKey();
  int? startTime;
  int? endTime;
  String? content;

  @override
  Widget build(BuildContext context){
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Form(
      key: formkey,
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height/2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: '시작 시간',
                        isTime: true,
                        onSaved: (String? val){
                          startTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(width: 16.0,),
                    Expanded(
                      child: CustomTextField(
                        label: '종료 시간', 
                        isTime: true, 
                        onSaved: (String? val){
                          endTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),                  
                  ],
                ),
                SizedBox(height: 8.0,),
                Expanded(
                  child: CustomTextField(
                    label: '내용', 
                    isTime: false,
                    onSaved: (String? val) {
                      content =val;
                    },
                    validator: contentValidator,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => onSavePressed(context),
                    style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR,
                    ),
                    child: Text('저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    
  }

  void onSavePressed(BuildContext context) async {
    if(formkey.currentState!.validate()){
      formkey.currentState!.save();

      final schedule = ScheduleModel(
        id: Uuid().v4(), 
        content: content!, 
        date: widget.selectedDate, 
        startTime: startTime!, 
        endTime: endTime!,
      );

      await FirebaseFirestore.instance
        .collection('schedule',)
        .doc(schedule.id)
        .set(schedule.toJson());

      Navigator.of(context).pop();
    }
  }

  String? timeValidator(String? val){
    if(val ==null){
      return '값을 입력해주세요';
    }

    int? number;

    try{
      number= int.parse(val);
    }catch(e){
      return '숫자를 입력해주세요';
    }

    if(number<0 || number >24){
      return '0시부터 24시 사이를 입력해주세요';
    }

    return null;
  }

  String? contentValidator(String? val){
    if(val == null || val.length==0){
      return '값을 입력해주세요';
    }

    return null;
  }
}