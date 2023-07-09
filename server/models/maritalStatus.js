export default (sequelize, Sequelize) => {
  const MaritalStatus = sequelize.define(
    'maritalstatus',
    {
      statusId: {
        type: Sequelize.INTEGER(1),
        primaryKey: true,
      },
      status_name: {
        type: Sequelize.STRING,
        required: true,
      },
      start_date: {
        type: Sequelize.DATE,
        required: true,
      },
    },
  );

  return {
    MaritalStatus,
  };
};
