/* eslint-disable no-plusplus */
/* eslint-disable no-restricted-syntax */
/* eslint-disable no-console */
/* eslint-disable import/extensions */
/* eslint-disable no-useless-catch */
/* eslint-disable camelcase */
import bcrypt from 'bcryptjs';
import { Op } from 'sequelize';
import db from '../database.js';

const { User } = db.user;

// get user image
const getUser = async (req, res) => {
  try {
    const userFound = await User.findOne({
      where: { userId: req.userDetails.id },
      attribute: ['profile_picture'],
    });

    res.status(200).json(userFound);
  } catch (error) {
    throw error;
  }
};

// reset password
const resetPassword = async (req, res) => {
  console.log(req.userDetails);
  try {
    bcrypt.hash(req.body.newPassword, 10, async (err, hash) => {
      const newDetails = {
        password: hash,
      };

      await User.update(newDetails, {
        where: { userId: req.userDetails.id },
      });
      res.status(204).json({ message: 'successifully updated' });
    });
  } catch (error) {
    throw error;
  }
};

// admin edit user
const uploadPicture = async (req, res) => {
  console.log('tupo hapa');

  try {
    const userDetails = {
      profile_picture: req.file.filename,
    };

    await User.update(userDetails, {
      where: { userId: req.userDetails.id },
    });
    res.status(204).json({ message: 'successifully updated' });
  } catch (error) {
    throw error;
  }
};

export {
  getUser,
  resetPassword,
  uploadPicture,
};
