const knex = require('../db/knex');

module.exports = {
    getAllUsers: (req, res) => {
        knex('users')
            .select()
            .then(data => {
                res.send(data)
            });
    },

    getOneUser: (req, res) => {
        knex('users')
            .select()
            .where('id', req.params.id)
            .then(data => {
                res.send(data)
            });
    },

    updateUser: (req, res) => {
        knex('users')
            .update(req.body)
            .then(
                knex('users')
                    .select()
                    .then(res.redirect(`/api/users/${req.params.id}`))
            )
    },

    addUser: (req, res) => {
        knex('users')
            .insert(req.body)
            .then(
                knex('users')
                    .select()
                    .then(res.redirect('/api/users'))
            )
    },

    deleteUser: (req, res) => {
        knex('users')
            .delete()
            .where('id', req.params.id)
            .then(
                knex('users')
                    .select()
                    .then(res.redirect('/api/users'))
            );
    }
    
}