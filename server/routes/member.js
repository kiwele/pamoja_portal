/* eslint-disable import/extensions */
// /* eslint-disable import/extensions */
import express from 'express';
import multer from 'multer';
import path from 'path';

import {
  addAcademicInfo,
  addProject,
  adminViewMemberAcademicInfo,
  adminViewMemberPersonalInfo,
  adminViewMemberWorkInfo,
  deleteMember,
  getAcademicInfo,
  getAllActiveStatus,
  getAllLevels,
  getAllMembers,
  getProjects,
  getworkInfo,
  manageMember,
  personalInfo,
  registerMember,
  test,
  updateAcademics,
  updateMember,
  workingExperience,
} from '../controllers/member.js';
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
router.get('/test', test);
router.get('/members', verifyaccessToken, getAllMembers);
router.post(
  '/register_member',
  upload.none(),
  verifyaccessToken,
  registerMember,
);
router.put('/update_member/:id', verifyaccessToken, updateMember);
router.post(
  '/academic_info',
  upload.none(),
  verifyaccessToken,
  addAcademicInfo,
);
router.put(
  '/update_academic_info/:id',
  upload.none(),
  verifyaccessToken,
  updateAcademics,
);
router.post(
  '/working_experience',
  upload.none(),
  verifyaccessToken,
  workingExperience,
);

router.post(
  '/add_projects',
  upload.single('file'),
  verifyaccessToken,
  addProject,
);
router.get('/projects', verifyaccessToken, getProjects);

// get user profile informations
router.get('/personal_info', verifyaccessToken, personalInfo);
router.get('/get_academic_info', verifyaccessToken, getAcademicInfo);
router.get('/get_working_info', verifyaccessToken, getworkInfo);

// admin get member informations
router.get(
  '/get_member_personal_info/:id',
  verifyaccessToken,
  adminViewMemberPersonalInfo,
);
router.get(
  '/get_member_academic_info/:id',
  verifyaccessToken,
  adminViewMemberAcademicInfo,
);
router.get(
  '/get_member_working_info/:id',
  verifyaccessToken,
  adminViewMemberWorkInfo,
);

// admin delete member
router.post('/delete_member/:id', deleteMember);
router.post('/manage/:memberId', verifyaccessToken, manageMember);
router.get('/members_activeness', verifyaccessToken, getAllActiveStatus);
router.get('/members_levels', verifyaccessToken, getAllLevels);


const memberRouter = router;
export default memberRouter;
