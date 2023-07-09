export default (sequelize, Sequelize) => {
  const ActiveStatus = sequelize.define(
    'activestatus',
    {
      activeId: {
        type: Sequelize.INTEGER(1),
        primaryKey: true,
      },
      status_name: {
        type: Sequelize.STRING,
        required: true,
      },
    },
  );
  return {
    ActiveStatus,
  };
};
