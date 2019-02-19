/// LibIds are also submitted to our backend for determining which oauth token has been transmitted. */

// GOOGLE +++++++++++++++++++++++++++++++++
const String GOOGLE_LIB_ID = "google";
const String GOOGLE_CLIENT_ID = "589912983695-6nigddgkn7qr21s8jj024fctnmomi4lu.apps.googleusercontent.com";
//web: const String GOOGLE_CLIENT_ID = "589912983695-oimjjfvvqpo40mpvmnn082dkgsmjor3c.apps.googleusercontent.com";
const String GOOGLE_CLIENT_SECRET = "8CsuqrVk8yrLwu8ymbco3Xs5";
//web: const String GOOGLE_CLIENT_SECRET = "pzyjjsuT1vJOxPhHL-B3Qr91";
const String GOOGLE_REDIRECT_URI = "http://localhost:8080";
const List<String> GOOGLE_PERMISSIONS = [
  "https://www.googleapis.com/auth/userinfo.profile",
  "https://www.googleapis.com/auth/userinfo.email"
];

// LINKEDIN ++++++++++++++++++++++++++++++++
//static const REDIRECT_URL = "intent://codeing.io/oauth2/linkedin#Intent;scheme=http;package=io.flutter.app.FlutterApplication;category=android.intent.category.BROWSABLE;component=io.flutter.app.FlutterApplication.MainActivity;action=android.intent.action.VIEW;end";
const String LINKEDIN_LIB_ID = "linkedin";
const String LINKEDIN_REDIRECT_URI = "http://localhost:8080";
const String LINKEDIN_CLIENT_ID = "867keehgjcqcws";
const String LINKEDIN_CLIENT_SECRET = "HtHpCG3CBSSEuyfT";

// FACEBOOK ++++++++++++++++++++++++++++++++
const String FACEBOOK_LIB_ID = "facebook";
const String FACEBOOK_CLIENT_ID = "413694329403514"; // app-id
const String FACEBOOK_CLIENT_SECRET = "994ada9e15bc4e4da5fe93482b5e2ccb"; // App secret
const String FACEBOOK_REDIRECT_URI = "http://localhost:8080";

// GITHUB ++++++++++++++++++++++++++++++++++
const String GITHUB_LIB_ID = "github";
const String GITHUB_CLIENT_ID = "15352ae3ad04a43190d4";
const String GITHUB_CLIENT_SECRET = "749392dbd86b5402f0db89b935ebbd79b7ffd0d4";
const String GITHUB_REDIRECT_URI = "http://localhost:8080";
const List<String> GITHUB_PERMISSIONS = [
  "user"
];

// DROPBOX +++++++++++++++++++++++++++++++++
const String DROPBOX_LIB_ID = "dropbox";
const String DROPBOX_CLIENT_ID = "8ciuqphro73ld1l";
const String DROPBOX_CLIENT_SECRET = "61aybqkjshnsnqn";
const String DROPBOX_REDIRECT_URI = "http://localhost:8080";

// INSTAGRAM +++++++++++++++++++++++++++++++
const String INSTAGRAM_LIB_ID = "instagram";
const String INSTAGRAM_CLIENT_ID = "77733d17fd634e07af5c1011ddea788d";
const String INSTAGRAM_CLIENT_SECRET = "d12054baf70e43fb905610b959ed232f";
const String INSTAGRAM_REDIRECT_URI = "http://localhost:8080";

// AMAZON
const String AMAZON_LIB_ID = "amazon";
const String AMAZON_CLIENT_ID = "amzn1.application-oa2-client.871de8cbdbb04ec19dab22fec703dc25";
const String AMAZON_CLIENT_SECRET = "ceb4b468a3b409545cb48924f8c1e307477e1940ce6c9dca0b20bf26344591f0";
const String AMAZON_REDIRECT_URI = "http://localhost:8080";
const List<String> AMAZON_PERMISSIONS = ["profile:user_id"]; // a lot data to verify :)