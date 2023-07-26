/* eslint-disable no-plusplus */
/* eslint-disable no-restricted-syntax */
/* eslint-disable no-console */
/* eslint-disable import/extensions */
/* eslint-disable no-useless-catch */
/* eslint-disable camelcase */
// import bcrypt from 'bcryptjs';
import { Op } from 'sequelize';
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
const { Projects } = db.project;
const { Level } = db.level;


const registerMember = async (req, res) => {
  try {
    const checkMember = await User.findOne({
      where: { email: req.body.email },
    });
    if (checkMember !== null) {
      return res.status(400).json({ message: 'user already exist' });
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

        const memberInfo = {
          memberId: memberAdded.dataValues.userId,
          first_name: req.body.fname,
          middle_name: req.body.mname,
          last_name: req.body.lname,
          email: req.body.email,
          phone_number: req.body.phone,
          parentName: req.body.parentName,
          parentPhone: req.body.parentPhone,
          maritalStatusId: req.body.marital_Status,
          gender: req.body.gender[1],
        };

        await Member.create(memberInfo);

        await MemberLocation.create({
          region: req.body.region,
          memberId: memberAdded.dataValues.userId,
        });
        await sendEMail(req.body.email, req.body.password);

        return res.status(204).json({
          message: 'member registered successifully',
        });
      });
    }
  } catch (error) {
    return res.sendStatus(500);
  }
};

// update member
const updateMember = async (req, res) => {
  try {
    const checkMember = await User.findOne({
      where: { email: req.body.data.email },
    });
    if (checkMember === null) {
      res.status(400).json({ message: 'user doest not exist' });
    }

    if (checkMember !== null) {
      // update user in the User table
      await User.update(
        {
          email: req.body.data.email,
        },
        {
          where: { userId: req.params.id },
        },
      );

      const memberInfo = {
        first_name: req.body.data.fname,
        middle_name: req.body.data.mname,
        last_name: req.body.data.lname,
        email: req.body.data.email,
        phone_number: req.body.data.phone,
        maritalStatusId: req.body.MaritalStatus,
        gender: req.body.selectedValue,
      };

      await Member.update(memberInfo, {
        where: { memberId: req.params.id },
      });

      await MemberLocation.update(
        {
          region: req.body.data.region,
        },
        {
          where: { memberId: req.params.id },
        },
      );

      res.status(204).json({
        message: 'member updated  successifully',
      });
    }
  } catch (error) {
    console.log(error);
  }
};

// add academic informations
const addAcademicInfo = async (req, res) => {
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

// add projects informations
const addProject = async (req, res) => {
  const { title, description } = req.body;

  const data = {
    title,
    description,
    file: req.file.filename,
    memberId: req.userDetails.id,
  };
  try {
    await Projects.create(data);
    return res.status(200).json({
      message: 'Project added successifully',
    });
  } catch (error) {
    return res.status(500).json({ message: 'internal server error' });
  }
};

const getProjects = async (req, res) => {
  try {
    const projectsInfo = await Projects.findAll({
      where: { memberId: req.userDetails.id },
      // attributes: ['projectId ', 'title', 'description', 'file'],
    });

    console.log(projectsInfo);

    return res.status(200).json({ data: projectsInfo });
  } catch (error) {
    return res.status(500).json({ message: 'internal server error' });
  }
};
// add academic informations
const updateAcademics = async (req, res) => {
  console.log(req.body);
  try {
    await SchoolStudied.update(
      {
        school_names: req.body.schoolName,
        study_taken: req.body.program,
        award: req.body.award,
        start_date: req.body.startDate,
        end_date: req.body.endDate,
      },
      {
        where: {
          schoolId: req.params.id,
        },
      },
    );
    res.status(204).json({
      message: 'Academics updated successifully',
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
        {
          model: Level,
        },
      ],
    });
    return res.status(200).json({ data: members });
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

    return res.status(200).json({ data: userInfo });
  } catch (error) {
    console.log(error);
  }
};

const getAcademicInfo = async (req, res) => {
  try {
    const academicInfo = await SchoolStudied.findAll({
      where: { memberId: req.userDetails.id },
      attributes: [
        'school_names',
        'study_taken',
        'award',
        'memberId',
        'schoolId',
      ],
    });

    return res.status(200).json({ data: academicInfo });
  } catch (error) {
    console.log(error);
    // return res.status(500).json({ message: 'internal server error' });
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

const manageMember = async (req, res) => {
  const { Level, status } = req.body;
  try {
    await Member.update({
      levelId: Level,
      activeId: status,
    }, {
      where: { memberId: req.params.memberId },
    });

    return res.status(200).json({ message: 'updated successifully' });
  } catch (error) {
    return res.status(400).json({ message: 'Something went wrong' });
  }
};

// Get all membersr
const getAllActiveStatus = async (req, res) => {
  try {
    const membersActiveness = await ActiveStatus.findAll({
      attributes: [
        'status_name',
      ],
      include: {
        model: Member,
        attributes: [
          'activeId',
        ],
      },
    });

    const info = [];

    await membersActiveness.forEach((x) => {
      info.push(x.dataValues.members?.length);
    });
    return res.status(200).json({ data: info });
  } catch (error) {
    throw error;
  }
};

// Get all members levels
const getAllLevels = async (req, res) => {
  try {
    const membersLevels = await Level.findAll({
      attributes: [
        'level_name',
      ],
      include: {
        model: Member,
        attributes: [
          'levelId',
        ],
      },
    });

    const info = [];

    await membersLevels.forEach((x) => {
      info.push(x.dataValues.members?.length);
    });

    return res.status(200).json({ data: info, membersLevels });
  } catch (error) {
    throw error;
  }
};

const test = (req, res) => {
  res.status(200).json({ message: 'route reached' });
};

export {
  test,
  registerMember,
  updateMember,
  getAllMembers,
  getAllActiveStatus,
  getAllLevels,
  addAcademicInfo,
  updateAcademics,
  workingExperience,
  personalInfo,
  getAcademicInfo,
  getworkInfo,
  adminViewMemberPersonalInfo,
  adminViewMemberAcademicInfo,
  adminViewMemberWorkInfo,
  deleteMember,
  manageMember,
  addProject,
  getProjects,
};
