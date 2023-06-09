export default (sequelize, Sequelize) => {
  const WorkExperience = sequelize.define(
    'workexperience',
    {
      workId: {
        type: Sequelize.INTEGER(2),
        autoIncrement: true,
        primaryKey: true,
      },
      organization: {
        type: Sequelize.STRING,
        required: true,
      },
      position_title: {
        type: Sequelize.STRING,
        required: true,
      },
      start_date: {
        type: Sequelize.DATE,
        required: true,
      },
      end_date: {
        type: Sequelize.DATE,
        required: true,
      },
    },
  );

  return {
    WorkExperience,
  };
};
