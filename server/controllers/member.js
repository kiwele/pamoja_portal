/* eslint-disable no-plusplus */
/* eslint-disable no-restricted-syntax */
/* eslint-disable no-console */
/* eslint-disable import/extensions */
/* eslint-disable no-useless-catch */
/* eslint-disable camelcase */
// import bcrypt from 'bcryptjs';
// import { Op } from 'sequelize';
import bcrypt from 'bcryptjs';

import db from '../database.js';
import { sendEMail } from '../middlewares/sendEmail.js';

const { Member } = db.members;
const { MemberLocation } = db.memberLocation;
const { SchoolStudied } = db.schoolstudied;
const { WorkExperience } = db.work_experience;
const { User } = db.user;
const { MaritalStatus } = db.maritalStatus;
const { ActiveStatus } = db.activeStatus;

// // get user image
// const getUser = async (req, res) => {
//   try {
//     const userFound = await User.findOne({
//       where: { userId: req.userDetails.id },
//       attribute: ['profile_picture'],
//     });

//     res.status(200).json(userFound);
//   } catch (error) {
//     throw error;
//   }
// };

// reset password
const registerMember = async (req, res) => {
  try {
    const checkMember = await User.findOne({
      where: { email: req.body.email },
    });
    if (checkMember !== null) {
      res.status(400).json({ message: 'user already exist' });
    }

    if (checkMember === null) {
      bcrypt.hash(req.body.password, 10, async (err, hash) => {
        console.log(req.body);
        const regInfo = {
          email: req.body.email,
          password: hash,
          roleId: 2,
          profile_picture: '',
        };

        // Save user in the User table
        const memberAdded = await User.create(regInfo);

        const memberInfo = {
          memberId: memberAdded.dataValues.userId,
          first_name: req.body.fname,
          middle_name: req.body.mname,
          last_name: req.body.lname,
          email: req.body.email,
          phone_number: req.body.phone,
          maritalStatusId: req.body.marital_Status,
          gender: req.body.gender[1],
        };

        await Member.create(memberInfo);

        await MemberLocation.create({
          region: req.body.region,
          memberId: memberAdded.dataValues.userId,
        });
        console.log(req.body.password);
        await sendEMail(req.body.email, req.body.password);

        res.status(204).json({
          message: 'member registered successifully',
        });
      });
    }
  } catch (error) {
    console.log(error);
  }
};

// academic informations
const addAcademicInfo = async (req, res) => {
  // console.log(req.body);
  try {
    await SchoolStudied.create({
      school_names: req.body.schoolName,
      study_taken: req.body.program,
      award: req.body.award,
      start_date: req.body.startDate,
      end_date: req.body.endDate,
      memberId: req.userDetails.id,
    });
    res.status(204).json({
      message: 'Academics added successifully',
    });
  } catch (error) {
    console.log(error);
  }
};

// working experience
const workingExperience = async (req, res) => {
  try {
    await WorkExperience.create({
      organization: req.body.organization,
      position_title: req.body.positionTitle,
      start_date: req.body.startDate,
      end_date: req.body.endDate,
      memberId: req.userDetails.id,
    });
    res.status(204).json({
      message: 'Experience added successifully',
    });
  } catch (error) {
    console.log(error);
  }
};

// Get all membersr
const getAllMembers = async (req, res) => {
  try {
    const members = await Member.findAll({
      include: [
        {
          model: SchoolStudied,
          attributes: ['school_names'],
        },
        {
          model: MemberLocation,
          attributes: ['region'],
        },
        {
          model: ActiveStatus,

        },
      ],
    });
    console.log(members);
    res.status(200).json({ data: members });
  } catch (error) {
    throw error;
  }
};

const personalInfo = async (req, res) => {
  try {
    const userInfo = await Member.findOne({
      where: { memberId: req.userDetails.id },
      include: [
        {
          model: MemberLocation,
          attributes: ['region'],
        },
        {
          model: MaritalStatus,
          attributes: ['status_name'],
        },
      ],
    });

    console.log(userInfo);
    res.status(200).json({ data: userInfo });
  } catch (error) {
    console.log(error);
  }
};

const getAcademicInfo = async (req, res) => {
  try {
    const academicInfo = await SchoolStudied.findAll({
      where: { memberId: req.userDetails.id },
      attributes: ['school_names', 'study_taken', 'award'],
    });

    res.status(200).json({ data: academicInfo });
  } catch (error) {
    console.log(error);
  }
};

const getworkInfo = async (req, res) => {
  try {
    const workInfo = await WorkExperience.findAll({
      where: { memberId: req.userDetails.id },
      attributes: ['organization', 'position_title', 'start_date'],
    });
    res.status(200).json({ data: workInfo });
  } catch (error) {
    console.log(error);
  }
};

// admin view member personal information
const adminViewMemberPersonalInfo = async (req, res) => {
  try {
    const userInfo = await Member.findOne({
      where: { memberId: req.params.id },
      include: [
        {
          model: MemberLocation,
          attributes: ['region'],
        },
        {
          model: MaritalStatus,
          attributes: ['status_name'],
        },
      ],
    });

    console.log(userInfo);
    res.status(200).json({ data: userInfo });
  } catch (error) {
    console.log(error);
  }
};

const adminViewMemberAcademicInfo = async (req, res) => {
  try {
    const academicInfo = await SchoolStudied.findAll({
      where: { memberId: req.params.id },
      attributes: ['school_names', 'study_taken', 'award'],
    });

    res.status(200).json({ data: academicInfo });
  } catch (error) {
    console.log(error);
  }
};

const adminViewMemberWorkInfo = async (req, res) => {
  try {
    const workInfo = await WorkExperience.findAll({
      where: { memberId: req.params.id },
      attributes: ['organization', 'position_title', 'start_date'],
    });
    res.status(200).json({ data: workInfo });
  } catch (error) {
    console.log(error);
  }
};

const deleteMember = async (req, res) => {
  try {
    await Member.destroy({
      where: { memberId: req.params.id },
    });
    await User.destroy({
      where: { UserId: req.params.id },
    });

    res.status(200).json({ message: 'user deleted successifully' });
  } catch (error) {
    console.log(error);
  }
};

export {
  registerMember,
  getAllMembers,
  addAcademicInfo,
  workingExperience,
  personalInfo,
  getAcademicInfo,
  getworkInfo,
  adminViewMemberPersonalInfo,
  adminViewMemberAcademicInfo,
  adminViewMemberWorkInfo,
  deleteMember,
};
