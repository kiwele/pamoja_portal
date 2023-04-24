export default (sequelize, Sequelize) => {
  const Member = sequelize.define(
    'member',
    {
      memberId: {
        type: Sequelize.STRING,
        defaultValue: Sequelize.UUIDV4,
        primaryKey: true,
      },
      first_name: {
        type: Sequelize.STRING,
        required: true,
      },
      middle_name: {
        type: Sequelize.STRING,
        required: true,
      },
      last_name: {
        type: Sequelize.STRING,
        required: true,
      },
      email: {
        type: Sequelize.STRING,
        required: true,
      },
      phone_number: {
        type: Sequelize.INTEGER(15),
        required: true,
      },
      gender: {
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
    Member,
  };
};
