const express = require('express');
const router = express.Router();
const knex = require('../db/knex');

router.get('/', (req, res) => {
    knex('users')
        .select()
        .then(data => {
            res.send(data)
        });
});

router.get('/:id', (req, res) => {
    knex('users')
        .select()
        .where('id', req.params.id)
        .then(data => {
            res.send(data)
        });
});

router.post('/', (req, res) => {
    knex('users')
        .insert(req.body)
        .then(
            knex('users')
                .select()
                .then(res.redirect('/api/users'))
        )
})

router.post('/:id', (req, res) => {
    knex('users')
        .update(req.body)
        .then(
            knex('users')
                .select()
                .then(res.redirect(`/api/users/${req.params.id}`))
        )
})

router.delete('/:id', (req, res) => {
    knex('users')
        .delete()
        .where('id', req.params.id)
        .then(
            knex('users')
                .select()
                .then(res.redirect('/api/users'))
        );
});

module.exports = router;
