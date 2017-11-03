const express = require('express');
const router = express.Router();
const knex = require('../db/knex');

router.get('/', (req, res) => {
    knex('projects')
        .select()
        .then(data => {
            res.send(data)
        });
});

router.get('/:id', (req, res) => {
    knex('projects')
        .select()
        .where('id', req.params.id)
        .then(data => {
            res.send(data)
        });
});

router.post('/', (req, res) => {
    knex('projects')
        .insert(req.body)
        .then(
            knex('projects')
                .select()
                .then(data => res.send(data))
        );
});

module.exports = router;