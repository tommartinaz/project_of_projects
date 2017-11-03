
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('locations').del()
    .then(function () {
      // Inserts seed entries
      return knex('locations').insert([
        {city: 'Austin'},
        {city: 'Boulder'},
        {city: 'Denver'},
        {city: 'New York'},
        {city: 'Phoenix'},
        {city: 'San Francisco'},
        {city: 'Seattle'},
      ]);
    });
};
