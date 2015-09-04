App.Post = DS.Model.extend({
  createdAt: DS.attr('date'),
  title: DS.attr('string'),

  author: DS.belongsTo('user'),
  tags: DS.hasMany('tag'),
});

test('checks the box', function() {
  visit('/');
  click('.check-box');

  andThen(function() {
    const checkBox = find('.check-box');

    ok(checkBox.prop('checked'), 'box is checked');
  });
});

import Ember from 'ember';
import DS from 'ember-data';

const { computed } = Ember;
const { attr, hasMany, belongsTo } = DS;

export default DS.Model.extend({
  name: attr('string'),
  ...
});

import fetch from 'fetch';
import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return fetch('/my-cool-end-point.json').then(function(response) {
      return response.json();
    });
  }
});
