importScripts('https://www.gstatic.com/firebasejs/9.14.0/firebase-app-compat.js')
importScripts('https://www.gstatic.com/firebasejs/9.8.1/firebase-messaging-compat.js');

firebase.initializeApp({
    apiKey: "AIzaSyAOdtvFQ8lKYGUdxJ2lAT7-41YosjMNrUw",
    authDomain: "tradex-60922.firebaseapp.com",
    databaseURL: "https://tradex-60922-default-rtdb.firebaseio.com",
    projectId: "tradex-60922",
    storageBucket: "tradex-60922.appspot.com",
    messagingSenderId: "334985763345",
    appId: "1:334985763345:web:37d262a6635f52865a2fb0",
    measurementId: "G-QVG13YPEZD"
});

const messaging = firebase.messaging();
messaging.onBackgroundMessage((message)=> {
    console.log("log message", message);
});

