export default (sequelize, Sequelize) => {
  const UserRole = sequelize.define(
    'userrole',
    {
      roleId: {
        type: Sequelize.INTEGER(1),
        primaryKey: true,
      },
      role_name: {
        type: Sequelize.STRING,
        required: true,
      },
    },
  );

  return {
    UserRole,
  };
};
