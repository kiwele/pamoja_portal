export default (sequelize, Sequelize) => {
  const MemberLocation = sequelize.define(
    'memberlocation',
    {
      locationId: {
        type: Sequelize.INTEGER(3),
        autoIncrement: true,
        primaryKey: true,
      },
      country: {
        type: Sequelize.STRING,
        required: true,
      },
      region: {
        type: Sequelize.STRING,
        required: true,
      },
      district: {
        type: Sequelize.STRING,
        required: true,
      },
      ward: {
        type: Sequelize.STRING,
        required: true,
      },
      street: {
        type: Sequelize.STRING,
        required: true,
      },
      house_number: {
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
    MemberLocation,
  };
};
