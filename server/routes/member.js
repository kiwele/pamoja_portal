/* eslint-disable import/extensions */
// /* eslint-disable import/extensions */
import express from 'express';
import multer from 'multer';
import path from 'path';

import { addAcademicInfo, getAllMembers, registerMember, workingExperience } from '../controllers/member.js';
import { verifyaccessToken } from '../middlewares/auth.js';
// import { verifyaccessToken } from '../middlewares/auth.js';

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
router.get('/members', getAllMembers);
router.post('/register_member', upload.none(), verifyaccessToken, registerMember);
router.post('/academic_info', upload.none(), verifyaccessToken, addAcademicInfo);
router.post('/working_experience', upload.none(), verifyaccessToken, workingExperience);

const memberRouter = router;
export default memberRouter;
