App.Post = DS.Model.extend({
  author: DS.belongsTo("user"),
  tags: DS.hasMany("tag"),

  createdAt: DS.attr("date"),
  title: DS.attr("string"),
});
