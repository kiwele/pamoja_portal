export default (sequelize, Sequelize) => {
  const SchoolStudied = sequelize.define(
    'schoolstudied',
    {
      schoolId: {
        type: Sequelize.INTEGER(3),
        autoIncrement: true,
        primaryKey: true,
      },
      school_names: {
        type: Sequelize.STRING,
        required: true,
      },
      study_taken: {
        type: Sequelize.STRING,
        required: true,
      },
      award: {
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
    SchoolStudied,
  };
};
