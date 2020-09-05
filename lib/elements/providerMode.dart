import 'package:flutter/cupertino.dart';

class Mode extends ChangeNotifier {
  static final Mode _singleton = Mode._internal();
  Mode._internal();

  factory Mode() {
    return _singleton;
  }
  // mode = true => professional
  // mode = false => social
  bool _mode = true;

  get mode => _mode;

  set mode(bool val) {
    _mode = val;
    notifyListeners();
  }
  
  // for feeds(sidebar)
  int _selectedFeeds = 2;

  get selectedFeeds => _selectedFeeds;

  set selectedFeeds(int val) {
    _selectedFeeds = val;
    notifyListeners();
  }

  // for alumni(sidebar)
  int _selectedAlumni = 2;

  get selectedAlumni => _selectedAlumni;

  set selectedAlumni(int val) {
    _selectedAlumni = val;
    notifyListeners();
  }

  // for feeds(bottom right FAB)
  bool _newmessage = false;

  get newmessage => _newmessage;

  set newmessage(bool val) {
    _newmessage = val;
    notifyListeners();
  }

  // for post screen (comments bottom)
  bool _comments = false;
  get comments => _comments;
  set comments(bool val) {
    _comments = val;
    notifyListeners();
  }

 

  // for bottom bar in jobs screen (in alumni)
  int _selectedJobs = 1;

  get selectedJobs => _selectedJobs;

  set selectedJobs(int val) {
    _selectedJobs = val;
    notifyListeners();
  }

 
}
