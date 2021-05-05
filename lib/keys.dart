import 'models/push_message.dart';

final String logInUrl = 'https://aicvirtualclosings.com/api/mobile/auth/';

String closingsUrl = 'https://aicvirtualclosings.com/api/mobile/closings/';

String selectedClosing = '';
String closingPlayersUrl = 'https://aicvirtualclosings.com/api/mobile/';

String apiKey = '';
String usePassword = '';
String emailAddress = '';

String selectedFolder = '';
String selectedImage = '';
String selectedImageExt = '';

String idString = '';
String expDate = '';

bool foldersOpen = false;

String firebaseToken = '';
String messageText = "";
List<PushMessage> messages = [];

bool allowBiometricUnlock = true;
