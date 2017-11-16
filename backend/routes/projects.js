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
                .then(res.redirect('/api/projects'))
        );
});

router.post('/edit/:id', (req, res) => {
    knex('projects')
        .update(req.body)
        .where('id', req.params.id)
        .then(
            knex('projects')
                .select()
                .then(res.redirect(`/api/projects/${req.params.id}`))
        )
})

router.delete('/:id', (req, res) => {
    knex('projects')
        .delete()
        .where('id', req.params.id)
        .then(
            knex('projects')
                .select()
                .then(res.redirect('/api/projects'))
        );
});

module.exports = router;