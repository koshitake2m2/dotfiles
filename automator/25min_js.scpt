// https://developer.apple.com/library/archive/releasenotes/InterapplicationCommunication/RN-JavaScriptForAutomation/Articles/OSX10-10.html
var app = Application.currentApplication();
app.includeStandardAdditions = true;

// app.say('hello');

delay(25 * 60);

app.displayDialog('休憩〜〜〜！！！');

// app.displayNotification('', {
//   withTitle: '休憩〜〜〜！！！',
// });

