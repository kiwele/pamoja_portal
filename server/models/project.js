export default (sequelize, Sequelize) => {
  const Projects = sequelize.define(
    'project',
    {
      projectId: {
        type: Sequelize.INTEGER(3),
        autoIncrement: true,
        primaryKey: true,
      },
      title: {
        type: Sequelize.STRING,
        required: true,
      },
      description: {
        type: Sequelize.STRING,
        required: true,
      },
      file: {
        type: Sequelize.STRING,
        required: true,
      },
    },
  );

  return {
    Projects,
  };
};
