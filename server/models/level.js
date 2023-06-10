export default (sequelize, Sequelize) => {
  const Level = sequelize.define(
    'level',
    {
      levelId: {
        type: Sequelize.INTEGER(1),
        autoIncrement: true,
        primaryKey: true,
      },
      level_name: {
        type: Sequelize.STRING,
        required: true,
      },
    },
  );

  return {
    Level,
  };
};
