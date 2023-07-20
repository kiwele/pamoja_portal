/* eslint-disable no-underscore-dangle */
/* eslint-disable import/extensions */
import createError from 'http-errors';
import express from 'express';
import cookieParser from 'cookie-parser';
import path from 'path';

import bodyParser from 'body-parser';
import logger from 'morgan';
import { fileURLToPath } from 'url';
import cors from 'cors';
import userRouter from './routes/user.js';
import memberRouter from './routes/member.js';
import refresh from './routes/refresh.js';

import db from './database.js';

const __filename = fileURLToPath(import.meta.url);
// eslint-disable-next-line no-unused-vars
const __dirname = path.dirname(__filename);

db.sequelize.sync({ alter: true });
// db.sequelize.sync({ force: true });

const app = express();

const corsOptions = {
  // origin: 'http://localhost:3000',
  origin: 'http://13.48.59.172',
  // origin: ['http://localhost:3000', 'http://localhost:4000'],
  optionsSuccessStatus: 200,
  methods: ['GET', 'PUT', 'POST'],
  allowedHeaders: ['Content-Type', 'Authorization', 'x-csrf-token'],
  credentials: true,
};

// app.use(cors());
app.use(logger('dev'));
app.use(express.json());
app.use(cookieParser());
app.use(express.static('public'));
app.use(express.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors(corsOptions));

// app.use('/', userRouter);

app.use('/', refresh);
app.use('/', userRouter);
app.use('/', memberRouter);

// catch 404 and forward to error handler
app.use((req, res, next) => {
  next(createError(404));
});

// error handler
app.use((err, req, res) => {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.send(err.status);
});
const PORT = process.env.PORT || '5000';

app.listen(PORT, () => {
  console.log(`server listen on port ${PORT}`);
});
export default app;
