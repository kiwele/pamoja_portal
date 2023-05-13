import nodemailer from 'nodemailer';

const sendEMail = async (userEmail, textm) => {
  const transporter = nodemailer.createTransport({
    service: process.env.SERVICE,
    auth: {
      user: process.env.HOST,
      pass: process.env.PWD,
    },
  });

  const mailOptions = {
    from: process.env.HOST,
    to: userEmail,
    subject: 'PAMOJA MANAGEMENT PORTAL',
    html: `<p>Dear ${userEmail} your account is successifully created in Pamoja foundation management portal
         use this password "${textm}"  to sign in 
     <span><a href="http://localhost:3000/"> Click here </a></span>  to sign in</p>`,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log(error);
    } else {
      console.log(`Email sent: ${info.response}`);
    }
  });
};

// send email for company account activation
const sendVerifyEmail = async (userEmail, textm) => {
  const transporter = nodemailer.createTransport({
    service: process.env.SERVICE,
    auth: {
      user: process.env.HOST,
      pass: process.env.PWD,
    },
  });

  const mailOptions = {
    from: process.env.HOST,
    to: userEmail,
    subject: 'Email verification',
    html: `<p> Hi ${userEmail} <br>
          We received your request for registration of account <br><span><a href="${textm}"> Click here to activate your accoutn</a></span> to reset</p>`,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log(error);
    } else {
      console.log(`Email sent: ${info.response}`);
    }
  });
};

export { sendEMail, sendVerifyEmail };
