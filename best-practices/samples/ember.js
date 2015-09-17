import Ember from 'ember';

const { inject } = Ember;

export default Ember.Controller({
  applicationController: inject.controller('application'),
  index: inject.controller(),

  toastService: inject.service('toast'),
  store: inject.service(),
});
