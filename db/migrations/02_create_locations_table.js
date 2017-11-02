exports.up = function(knex, Promise) {
    return knex.schema.createTable('locations', table => {
        table.increments();
        table.string('city');
        table.timestamps();
    })
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('locations');
};