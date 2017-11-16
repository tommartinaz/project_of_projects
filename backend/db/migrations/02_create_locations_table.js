exports.up = function(knex, Promise) {
    return knex.schema.createTable('locations', table => {
        table.increments();
        table.string('city');
        table.timestamps(true, true);
    })
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('locations');
};