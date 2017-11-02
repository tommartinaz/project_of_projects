
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('projects').del()
    .then(function () {
      // Inserts seed entries
      return knex('projects').insert([
        {
          business_name: 'Hyver',
          contact_name: 'Kirk Morales',
          contact_phone_num: '',
          contact_email: 'kirk@hyverlabs.com',
          proj_type: 'Full Stack Web Dev',
          tech_stack: 'JavaScript/HTML/CSS',
          short_desc: 'Port of Chrome extension to FireFox and Safari',
          long_desc: "Hyver currently offers a Chrome plugin for managing CSS selectors and previewing websites. We need this code ported over to FireFox and Safari with the same functionality that's offered in Chrome currently: https://chrome.google.com/webstore/detail/hyver/ojmjgmmmbepnmkfohhglpjcfnkdbibkb?hl=en-US This project will require knowledge of Javascript, HTML, and CSS as well as some research into browser specificities to make each plugin function properly in its intended browser.",
          is_capstone_worthy: false,
          user_id: 1,
          location_id: 5,
          is_paid: false,
          url: 'http://hyverlabs.com'
        }
      ]);
    });
};
