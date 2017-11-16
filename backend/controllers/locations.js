const knex = require('../db/knex');

module.exports = {
    getAllLocations: (req, res) => {
        knex('locations')
            .select()
            .then(data => {
                res.send(data)
            });
    },

    getOneLocation: (req, res) => {
        knex('locations')
            .select()
            .where('id', req.params.id)
            .then(data => {
                res.send(data)
            });
    }
}