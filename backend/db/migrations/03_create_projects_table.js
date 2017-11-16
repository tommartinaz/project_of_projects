exports.up = function(knex, Promise) {
    return knex.schema.createTable('projects', table => {
        table.increments();
        table.string('business_name');
        table.string('proj_name').notNullable();
        table.string('contact_name');
        table.string('contact_phone_num');
        table.string('contact_email');
        table.string('proj_type');
        table.string('tech_stack');
        table.string('short_desc');
        table.text('long_desc');
        table.boolean('is_capstone_worthy');
        table.integer('user_id').references('id').inTable('users');
        table.integer('location_id').references('id').inTable('locations');
        table.boolean('is_paid');
        table.text('business_problem');
        table.string('url');
        table.integer('wish_ct').defaultTo(0);
        table.timestamps(true, true);
    })
};

exports.down = function(knex, Promise) {
    return knex.schema.dropTable('projects');
};
