/*
* Matching function for user search
*
*/
var substringMatcher = function(strs) {
    user_map = {};


    $.each(user_list, function (i, user) {
        user_map[user.username] = user.id;
    });

  return function findMatches(q, cb) {
    var matches, substringRegex;

    // an array that will be populated with substring matches
    matches = [];

    // regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i');

    // iterate through the pool of strings and for any string that
    // contains the substring `q`, add it to the `matches` array
    $.each(strs, function(i, user) {
      if (substrRegex.test(user.first_name) ||
            substrRegex.test(user.last_name) ||
            substrRegex.test(user.username) ||
            substrRegex.test(user.email)) {
        matches.push(user);
      }
    });

    cb(matches);
  };
};

var users = user_list;

$('#user_search .typeahead').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
},
{
  name: 'users',
  display: 'email',
  source: substringMatcher(users),
  templates: {
    suggestion: function(user) {
        var display = '<div><span>' + user.first_name + " " + user.last_name + " (" + user.username +
            ')</span> - <span class="text-muted">' + user.email + '</span></div>';
        return display;
    }
  }

});
$('#user_search .typeahead').bind('typeahead:selected', function(obj, datum, name) {
    $('#user_id_selected').val(user_map[datum.username]);
});
$('#user_search .typeahead').bind('typeahead:autocompleted', function(obj, datum, name) {
    $('#user_id_selected').val(user_map[datum.username]);
});
