import 'package:flutter/material.dart';

class UserTypeSelection extends StatefulWidget {

  @override
  UserTypeSelectionState createState() => UserTypeSelectionState();
  String Return_Type(){

    return UserTypeSelectionState().selectedUserType;
  }
}

class UserTypeSelectionState extends State<UserTypeSelection> {
  String selectedUserType = 'User';



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedUserType = 'User';
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  primary: selectedUserType == 'User'
                      ? Colors.orange[800]
                      : Colors.white,
                ),
                child: Container(
                  width: 100,
                  child: Center(
                    child: Text(
                      'User',
                      style: TextStyle(
                        color: selectedUserType == 'User'
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedUserType = 'Delivery Man';
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  primary: selectedUserType == 'Delivery Man'
                      ? Colors.orange[800]
                      : Colors.white,
                ),
                child: Container(width: 100,
                  child: Center(
                    child: Text(
                      'Delivery Man',
                      style: TextStyle(
                        color: selectedUserType == 'Delivery Man'
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text('Selected Type: $selectedUserType'),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
