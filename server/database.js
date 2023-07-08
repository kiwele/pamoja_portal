/* eslint-disable camelcase */
/* eslint-disable import/extensions */
import Sequelize from 'sequelize';
import user from './models/user.js';
import schoolstudied from './models/schoolstudied.js';
import members from './models/members.js';
import memberLocation from './models/memberLocation.js';
import work_experience from './models/work_experience.js';
import maritalStatus from './models/maritalStatus.js';
import activeStatus from './models/activeStatus.js';
import userRole from './models/userRole.js';
import project from './models/project.js';
import level from './models/level.js';

// const sequelize = new Sequelize('pamoja', 'admin', '#Kiwele123', {
//   host: 'pamoja.ccrssgvdi4ff.eu-north-1.rds.amazonaws.com',
//   dialect: 'mysql',
//   port: 3306,
// });

const sequelize = new Sequelize('Pamoja_portal', 'root', '', {
  host: 'localhost',
  dialect: 'mysql',
  port: 3306,
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.user = user(sequelize, Sequelize);
db.members = members(sequelize, Sequelize);
db.schoolstudied = schoolstudied(sequelize, Sequelize);
db.memberLocation = memberLocation(sequelize, Sequelize);
db.work_experience = work_experience(sequelize, Sequelize);
db.maritalStatus = maritalStatus(sequelize, Sequelize);
db.userRole = userRole(sequelize, Sequelize);
db.activeStatus = activeStatus(sequelize, Sequelize);
db.project = project(sequelize, Sequelize);
db.level = level(sequelize, Sequelize);

// making table relations

// user and userRole
db.userRole.UserRole.hasMany(db.user.User, {
  foreignKey: 'roleId',
});
db.user.User.belongsTo(db.userRole.UserRole, {
  foreignKey: 'roleId',
});

// member and work experince
db.members.Member.hasMany(db.work_experience.WorkExperience, {
  foreignKey: 'memberId',
});
db.work_experience.WorkExperience.belongsTo(db.members.Member, {
  foreignKey: 'memberId',
});

// member and marital status
db.maritalStatus.MaritalStatus.hasMany(db.members.Member, {
  foreignKey: 'maritalStatusId',
});
db.members.Member.belongsTo(db.maritalStatus.MaritalStatus, {
  foreignKey: 'maritalStatusId',
});

// member and active status
db.activeStatus.ActiveStatus.hasMany(db.members.Member, {
  foreignKey: 'activeId',
});
db.members.Member.belongsTo(db.activeStatus.ActiveStatus, {
  foreignKey: 'activeId',
});

// // member and work  location
db.members.Member.hasMany(db.memberLocation.MemberLocation, {
  foreignKey: 'memberId',
});
db.memberLocation.MemberLocation.belongsTo(db.members.Member, {
  foreignKey: 'memberId',
});

// member and school studied
db.members.Member.hasMany(db.schoolstudied.SchoolStudied, {
  foreignKey: 'memberId',
});
db.schoolstudied.SchoolStudied.belongsTo(db.members.Member, {
  foreignKey: 'memberId',
});

// member and projects
db.members.Member.hasMany(db.project.Projects, {
  foreignKey: 'memberId',
});
db.project.Projects.belongsTo(db.members.Member, {
  foreignKey: 'memberId',
});

// Level and memberId
db.level.Level.hasMany(db.members.Member, {
  foreignKey: 'levelId',
});
db.members.Member.belongsTo(db.level.Level, {
  foreignKey: 'levelId',
});

export default db;
