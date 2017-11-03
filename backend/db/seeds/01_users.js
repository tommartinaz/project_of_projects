
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('users').del()
    .then(function () {
      // Inserts seed entries
      return knex('users').insert([
        {first_name: 'Tom', last_name: 'Martin', email: 'tom.martinaz@gmail.com', phone_number: '480-200-4074'}
      ]);
    });
};
