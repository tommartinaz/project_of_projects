const express = require('express');
const router = express.Router();
const knex = require('../db/knex');

router.get('/', (req, res) => {
    knex('locations')
        .select()
        .then(data => {
            res.send(data)
        });
});

router.get('/:id', (req, res) => {
    knex('locations')
        .select()
        .where('id', req.params.id)
        .then(data => {
            res.send(data)
        });
});

module.exports = router;