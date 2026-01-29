const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
require("dotenv").config();

const app = express();

// middlewares
app.use(cors());
app.use(express.json());

// MongoDB connect
mongoose
  .connect(process.env.MONGO_URI)
  .then(() => console.log("Local MongoDB Connected"))
  .catch((err) => console.log("Mongo Error:", err));

// test route
app.get("/", (req, res) => {
  res.send("Backend running");
});

// server start
app.listen(5000, () => {
  console.log("Server running on port 5000");
});


app.use("/api/users", require("./routes/userRoutes"));
