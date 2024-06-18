
const functions = require('firebase-functions');
const admin = require('firebase-admin');
const nodemailer = require('nodemailer');

admin.initializeApp();

const transporter = nodemailer.createTransport({
  service: 'gmail', // you can use any email service
  auth: {
    // user: 'your-email@gmail.com',
    // pass: 'your-email-password',
    user: functions.config().email.user,
    pass: functions.config().email.password,
  },
});

exports.sendSignInEmail = functions.https.onCall((data, context) => {
  const email = data.email;
  const mailOptions = {
   // from: 'your-email@gmail.com',
    from: functions.config().email.user,
    to: email,
    subject: 'Successful Sign-In Notification',
    text: 'You have successfully signed into your account!',
  };

  // return transporter.sendMail(mailOptions, (error, info) => {
  //   if (error) {
  //     return { success: false, error: error.toString() };
  //   }
  //   return { success: true };

  return transporter.sendMail(mailOptions)
    .then(() => {
      return { success: true };
    })
    .catch((error) => {
      console.error('Error sending email:', error);
      return { success: false, error: error.toString() };
  });
});