const knex = require('../db/knex');

module.exports = {
    getAllProjects: (req, res) => {
        knex('projects')
            .select()
            .then(data => {
                res.send(data)
            });
    },

    getOneProject: (req, res) => {
        knex('projects')
            .select()
            .where('id', req.params.id)
            .then(data => {
                res.send(data)
            });
    },

    addProject: (req, res) => {
        knex('projects')
            .insert(req.body)
            .then(
                knex('projects')
                    .select()
                    .then(res.redirect('/api/projects'))
            );
    },

    updateProject: (req, res) => {
        knex('projects')
            .update(req.body)
            .where('id', req.params.id)
            .then(
                knex('projects')
                    .select()
                    .then(res.redirect(`/api/projects/${req.params.id}`))
            )
    },

    deleteProject: (req, res) => {
        knex('projects')
            .delete()
            .where('id', req.params.id)
            .then(
                knex('projects')
                    .select()
                    .then(res.redirect('/api/projects'))
            );
    }
}