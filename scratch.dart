import 'dart:io';
void main()
{
  performtask();
}

void  performtask()async{
  task1();
  task2();
  task3();
}
void task1()
{
  print('Task1 Completed');
}
void task2 ()
async
{
  Duration sec=Duration(seconds: 3);
 await Future.delayed(sec);
   print('Task2 Completed');
}
void task3()
{
  print('Task3 Completed');
}
