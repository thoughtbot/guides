App.Post = DS.Model.extend({
  author: DS.belongsTo('user'),
  tags: DS.hasMany('tag'),

  createdAt: DS.attr('date'),
  title: DS.attr('string'),
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

import Ember from 'ember';

export default Ember.Route.extend({
  ajax: Ember.inject.service(),
  model() {
    return this.get('ajax').request('/posts');
  }
});
