export default (sequelize, Sequelize) => {
  const User = sequelize.define(
    'user',
    {
      userId: {
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV4,
        primaryKey: true,
      },
      email: {
        type: Sequelize.STRING,
        required: true,
      },
      password: {
        type: Sequelize.STRING,
        required: true,
      },
      profile_picture: {
        type: Sequelize.STRING,
        required: false,
      },
    },
  );

  return {
    User,
  };
};
