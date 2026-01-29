const nodemailer = require("nodemailer");

const sendEmail = async (to, name) => {
  try {
    const transporter = nodemailer.createTransport({
      service: "gmail",
      auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS,
      },
    });

    const mailOptions = {
      from: `"TestPustak" <${process.env.EMAIL_USER}>`,
      to: to,
      subject: "Welcome to TestPustak 🎉",
      html: `
        <h2>Hello ${name},</h2>
        <p>Your registration is successful ✅</p>
        <p>You can now login and enjoy learning on <b>TestPustak</b>.</p>
        <br/>
        <p>Happy Learning 📚</p>
      `,
    };

    await transporter.sendMail(mailOptions);
    console.log("EMAIL SENT TO:", to);
  } catch (err) {
    console.error("EMAIL ERROR:", err.message);
  }
};

module.exports = sendEmail;
