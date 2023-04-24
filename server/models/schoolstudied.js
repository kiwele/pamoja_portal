export default (sequelize, Sequelize) => {
  const SchoolStudied = sequelize.define(
    'schoolStudied',
    {
      schoolId: {
        type: Sequelize.INTEGER(1),
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