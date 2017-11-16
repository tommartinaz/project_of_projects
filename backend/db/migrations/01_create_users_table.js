exports.up = function(knex, Promise) {
    return knex.schema.createTable('users', table => {
        table.increments();
        table.string('first_name')
        table.string('last_name');
        table.string('email');
        table.string('phone_number');
        table.timestamps(true, true);
    })
  
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('users');
};
