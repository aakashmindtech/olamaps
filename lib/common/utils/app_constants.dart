class AppConstants {
  //App related

  static String username = '';

  /*Shared Pref*/
  static const String apiKey = 'apiKey';
  static const String showInstruction = 'showInstruction';
  static const String eventAuthData = 'eventAuthData';
  static const String eventAuthID = 'eventAuthID';
  static const String eventAuthPassword = 'eventAuthPassword';
  static const String dropdownValue = 'dropdownValue';
  static const String scopeName = 'scopeName';
  static const String selectedIndex = 'selectedIndex';
  static const String isEventCheck = 'isEventCheck';
  static const String isAttendeeCheck = 'isAttendeeCheck';
  static const String itemCategory = 'itemCategory';
  static const String eventFeeID = 'eventFeeID';
  static const String disableDecrementing = 'disableDecrementing';
  static const String currentTime = 'currentTime';
  static const String eventId = 'eventId';
  static const String profileImagePref = 'profileImagePref';

  /*
  UI related
  */
  //dashboard
  //scan screen
  static const String checkIn = 'CHECK IN';
  static const String checkedIn = 'Checked In';
  static const String checkOut = 'CHECK OUT';
  static const String checkedOut = 'Checked Out';
  static const String redeem = 'REDEEM';
  static const String redeemed = ' REDEEMED';
  static const String attention = 'Attention';
  static const String invalidQR = 'Invalid QR';
  static const String scanAttendee = 'Scan attendee’s badge, phone or voucher';
  static const String toBeginScanning =
      'To begin scanning, select a scan scope.';
  static const String pleaseSelectScope = 'Please select a scope';

  //change scope mode
  static const String yes = 'Yes';
  static const String no = 'No';
  static const String selectScopeChange = 'Select Scope';
  static const String selectScopeChangeDetails =
      'The scope tells the app where to log the check-in/out data for the attendee. To view an attendee’s entire event registration (with the option to check in/out of each registration item), use FULL ATTENDEE PROFILE.';
  static const String eventLevelAttendance = 'EVENT LEVEL ATTENDANCE';
  static const String eventLevelACheckInOut = 'Event Level Check-In/Out';
  static const String specificSessionAttendance = 'SPECIFIC SESSION ATTENDANCE';
  static const String specificSessionAttendanceDetails =
      'If a checked-in attendee is scanned after 2 minutes following check-in, the system will record a check-out.';
  static const String fullAttendeeProfile = 'FULL ATTENDEE PROFILE';
  static const String scanToFullRegistrationProfile =
      'Scan to full registration profile';

  //check In Stats
  static const String eventLevel = 'EVENT LEVEL';
  static const String itemLevel = 'ITEM LEVEL';

  static const String conference =
      '2021 Conference on Check-in and Check-Out \nProcedures With Two Lines for The Title - Centered';

  //validation
  static const String noInternet = 'Please check your internet connection';
  static const String emptyValueEventId = 'Please enter event id';
  static const String somethingWentWrong = 'Something went wrong';
  static const String userAuthFailed = 'The user authentication got failed';
  static const String searchValidation =
      'Kindly enter two or more characters for search';
  static const String invalidDetails = 'Invalid Details';
  static const String emptyValueAuthorizationCode =
      'Please enter authorization code';

  //scan result screen
  static const String eventCheckIn = 'Event Check-In';
  static const String eventCheckOut = 'Event Check-Out';
  static const String profileName = '{Profile Name}';
  static const String balanceDue = 'BALANCE DUE';
  static const String attendeeDetails = 'Attendee Details';
  static const String checkInGuests = 'Check-In Guests';
  static const String noResults = 'No Search Result Found';
  static const String inValidQrCodeString =
      'EITHER THE ATTENDEE’S ID IS NOT ASSOCIATED WITH THIS EVENT OR THE EVENT ID IS INCORRECT. \n\nVERIFY THAT THE QR CODE WAS GENERATED FOR THIS EVENT. WE RECOMMEND HAVING AN EVENT ADMINISTRATOR CHECK THE EVENT DASHBOARD.';
  static const String miscellaneousInfo =
      'Miscellaneous information from sub classes, options, tables assignments, booths, etc.';
  static const String reviewAttendeeInfo =
      'Please review the attendee dashboard for additional details or to manually register this attendee for this session.';
  static const String notCheckedInInfo =
      'This attendee was not checked in. Please review the attendee dashboard.';

  //Search
  static const String search = 'SEARCH';
  static const String guests = ' guests)';
  static const String go = 'Go';
  static const String searchHint = 'Attendee last name (partial or full)';
  static const String nonCheckedInAttendee = 'Only non-checked-in attendees';

  //Guest list
  static const String returnTo = 'Return to Attendee Details';
  static const String tapGuests = 'Tap the guest to check them in';
  static const String checkInValidation = 'NOT CHECKED INTO EVENT';

  // check in stats
  static const String inn = 'in';
  static const String out = 'out';

  // session related strings
  static const String sessionExpired =
      'Your session has expired. Please re-authorize the app for your event.';
  static const String kindlyLoginAgain = 'Kindly login again.';
  static const String ok = 'Ok';

  // session time
  static const int timeDifference = 1;

  static const String login = 'LOGIN';
  static const String verifyOtp = 'VERIFY OTP';

  static const String register = 'REGISTER';
  static const String myAccount = 'My Account';
  static const String editPersonalDetails = 'Edit personal details';
  static const String enterOTP = 'Enter OTP';

  static const String editProfile = 'Edit profile';
  static const String address = 'Address';
  static const String referralCode = 'Referral code';
  static const String wallet = 'Wallet';

  static const String paymentMethods = 'Payment Methods';
  static const String settings = 'Settings';
  static const String helpcenter = 'Help Center';
  static const String logout = 'Logout';

  static const String loginK = "login";
  static const String dbK = "db";
  static const String save = 'save';
  static const String sendotp = 'send otp';

  //keys for pref
  static const String tokenPr = 'tokenPr';
  static const String isLoggedIn = 'isLoggedInPr';
  static const String loginPref = 'loginPref';

  static const String userIDPr = 'user_idpref';

//api keys

  static const String notesCodek = 'note_code';
  static const String uFileK = 'ufile';

  static const String userNameK = 'UserName';
  static const String passwordK = 'Password';
  static const String customerNoK = 'customer_enter_no';
  static const String noteCodeK = 'note_code';
  static const String styleCodeK = 'llc_app_style_code';
  static const String titleK = 'title';
  static const String descriptionK = 'description';

  static const String lNameK = 'lNameK';
  static const String emailK = 'email';
  static const String phoneK = 'phone';
  static const String nameK = 'name';

  static const String amountK = 'amount';
  static const String deviceTypeK = 'device_type';
  static const String addressIdK = 'address_id';
  static const String deviceRegistrationTokenK = 'device_registration_token';

  static const String typeK = 'type';
  static const String building_nameK = 'building_name';
  static const String street_nameK = 'street_name';
  static const String emirateK = 'emirate';
  static const String latitudeK = 'latitude';
  static const String longitudeK = 'longitude';

  //errors
  static const String errorLoginName = "Please enter login name";
  static const String errorLName = "Please enter last name";
  static const String errorEmail = "Please enter email";
  static const String validEmail = "Please enter valid email";
  static const String validPhone = "Please enter valid phone number";
  static const String validPhoneCode = "Phone number must start with \"971\"";
  static const String otpDoesntMatch = "Otp doesn't match";
  static const String validOtp = "Please enter valid otp";

  static const String errorName = "Please enter your name";

  static const String errorStreet = "Please enter Street";
  static const String errorAddressType = "Please enter Address Type";
  static const String errorAddressDetails = "Please enter building/Flat.no";
  static const String errorPhone = "Please enter phone number";

  static get validPwdField =>
      "kindly use a mix of upper and lowercase \nletters,numbers, symbols and minimum \n6 characters length";
  static const String errorPassword = "Please enter password";
  static const String errorNewPassword = "Please enter new password";
  static const String errorConfirmPassword = "Please enter confirm password";
  static const String errorTitle = "Please enter title";
  static const String errorDescription = "Please enter description";

  static const emirates = 'Emirates';

  static const List<String> listEmirates = [
    "Ajman",
    "Abu Dhabi",
    "Dubai",
    "Fujairah",
    "Ras al-Khaimah",
    "Sharjah",
    "Umm al-Quwain",
  ];

  static const frequency = 'Frequency';
  static const next = 'Next';
  static const b2home = 'Back to home';
  static const offers = 'Offers';

  static const serviceDetails = 'Service Details';
  static const dateandTime = 'Date & Time';
  static const scheduledServices = 'Scheduled Services';

  static const noIHaveThem = 'No, I have them';
  static const yesPlease = 'Yes, Please';

  static const dateFormatDisplay = 'yyyy-MM-dd';
  static const datetimeFormat = 'yyyy-MM-dd hh:mm:ss';
  static const dateFormatBooking = 'dd/MM/yyyy HH:mm';
  static const dayFormat = 'dd';
  static const dayNameFormat = 'EEE';
  static const dateFormat = 'dd/MM/yyyy';
  static const timeFormat = 'HH:mm';
  static const noRecord = 'No Record Found.';
}
