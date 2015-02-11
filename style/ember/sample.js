App.Post = DS.Model.extend({
  author: DS.belongsTo("user"),
  tags: DS.hasMany("tag"),

  createdAt: DS.attr("date"),
  title: DS.attr("string"),
});

test("checks the box", function() {
  visit("/");
  click(".check-box");

  andThen(function() {
    const checkBox = find(".check-box");

    ok(checkBox.prop("checked"), "box is checked");
  });
});
