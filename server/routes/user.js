/* eslint-disable import/extensions */
// /* eslint-disable import/extensions */
import express from 'express';
import multer from 'multer';
import path from 'path';

import { register, userLogin, logout } from '../controllers/auth.js';
import { getUser, resetPassword, uploadPicture } from '../controllers/user.js';
import { verifyaccessToken } from '../middlewares/auth.js';

const router = express.Router();

// handle upload issues
const storage = multer.diskStorage({
  destination(req, file, cb) {
    cb(null, 'public/uploads/');
  },
  filename: (req, file, cb) => {
    cb(
      null,
      `${file.fieldname}-${Date.now()}${path.extname(file.originalname)}`,
    );
  },
});

const upload = multer({ storage });

router.post('/register', upload.none(), register);

// user login
router.post('/login', upload.none(), userLogin);

// get user route
router.get('/picture', verifyaccessToken, getUser);

// reset password
router.post('/reset_password', upload.none(), verifyaccessToken, resetPassword);

// upload picture
router.post('/update_picture', upload.single('file'), verifyaccessToken, uploadPicture);

// handle user logout
router.get('/logout', logout);

const userRouter = router;
export default userRouter;
