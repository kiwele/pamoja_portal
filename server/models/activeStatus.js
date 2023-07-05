export default (sequelize, Sequelize) => {
  const ActiveStatus = sequelize.define(
    'activeStatus',
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
