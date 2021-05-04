const functions = require("firebase-functions");


const admin = require("firebase-admin");


admin.initializeApp(functions.config().firebase);
var msgData;


exports.offerTrigger = functions.firestore.document(
    "AmbulanceRequests/{RequestId}"
).onCreate((snapshot)=>{
  msgData = snapshot.data();

  admin.firestore().collection("tokens").get().then((snapshots)=>{
    var tokens = [];
    if (snapshots.empty) {
      console.log("No Devices Found");
    } else {
      for (const pushTokens of snapshots.docs) {
        tokens.push(pushTokens.data().token);
      }

      const payload ={
        "notification": {
          "title": "From " + msgData.name,
          "body": "Case is : " + msgData.details,
          "sound": "default",
        },
        "data": {
          "sendername": msgData.name,
          "message": msgData.details,
        },
      };

      return admin.messaging().sendToDevice(tokens, payload).then(() => {
        console.log("pushed them all");
      }).catch((err) => {
        console.log(err);
      });
    }
  });
});
