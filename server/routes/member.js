/* eslint-disable import/extensions */
// /* eslint-disable import/extensions */
import express from 'express';
import multer from 'multer';
import path from 'path';

import { addAcademicInfo, adminViewMemberAcademicInfo, adminViewMemberPersonalInfo, adminViewMemberWorkInfo, deleteMember, getAcademicInfo, getAllMembers, getworkInfo, personalInfo, registerMember, workingExperience } from '../controllers/member.js';
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
router.get('/members', verifyaccessToken, getAllMembers);
router.post('/register_member', upload.none(), verifyaccessToken, registerMember);
router.post('/academic_info', upload.none(), verifyaccessToken, addAcademicInfo);
router.post('/working_experience', upload.none(), verifyaccessToken, workingExperience);

// get user profile informations
router.get('/personal_info', verifyaccessToken, personalInfo);
router.get('/get_academic_info', verifyaccessToken, getAcademicInfo);
router.get('/get_working_info', verifyaccessToken, getworkInfo);

// admin get member informations
router.get('/get_member_personal_info/:id', verifyaccessToken, adminViewMemberPersonalInfo);
router.get('/get_member_academic_info/:id', verifyaccessToken, adminViewMemberAcademicInfo);
router.get('/get_member_working_info/:id', verifyaccessToken, adminViewMemberWorkInfo);

// admin delete member
router.post('/delete_member/:id', deleteMember);

const memberRouter = router;
export default memberRouter;
