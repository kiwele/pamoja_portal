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
import schoolstudied from '../models/schoolstudied.js';

const { Member } = db.members;
const { MemberLocation } = db.memberLocation;
const { SchoolStudied } = db.schoolstudied;
const { WorkExperience } = db.work_experience;
const { User } = db.user;

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
      res
        .status(400)
        .json({ message: 'user already exist' });
    }

    if (checkMember === null) {
      bcrypt.hash(req.body.password, 10, async (err, hash) => {
        const regInfo = {
          email: req.body.email,
          password: hash,
          roleId: 2,
          profile_picture: '',
        };

        // Save user in the User table
        const memberAdded = await User.create(regInfo);

        console.log(memberAdded.dataValues.userId);

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
  try {
    await SchoolStudied.create({
      school_names: req.body.school,
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
  console.log(req.body);
  console.log(req.userDetails);
  try {
    await WorkExperience.create({
      organization: req.body.organization,
      position_title: req.body.positionTitle,
      start_date: req.body.startDate,
      end_date: req.body.endDate,
      // memberId: req.userDetails.id,
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
      includes: [
        {
          model: schoolstudied,
          attributes: ['school_names'],
        },
        {
          model: MemberLocation,
          attributes: ['region'],
        },
      ],
    });
    res.status(200).json({ data: members });
  } catch (error) {
    throw error;
  }
};

export {
  registerMember, getAllMembers, addAcademicInfo, workingExperience,
};
