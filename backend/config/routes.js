const users = require('../controllers/users');
const locations = require('../controllers/locations');
const projects = require('../controllers/projects');

module.exports = (app) => {

    app.get('/')

    app.get('/api/users', users.getAllUsers);
    app.get('/api/users/:id', users.getOneUser);
    app.post('/api/users', users.addUser);
    app.post('/app/users/:id', users.updateUser);
    app.delete('/api/users/:id', users.deleteUser);

    app.get('/api/locations', locations.getAllLocations);
    app.get('/api/locations/:id', locations.getOneLocation);

    app.get('/api/projects', projects.getAllProjects);
    app.get('/api/projects/:id', projects.getOneProject);
    app.post('/api/projects', projects.addProject);
    app.post('/api/projects/edit/:id', projects.updateProject);
    app.delete('/api/projects/:id', projects.deleteProject);
}
