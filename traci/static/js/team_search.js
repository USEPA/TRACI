/*
* Matching function for team search
*
*/
var teamMatcher = function(team_list) {
    team_map = {};

    $.each(team_list, function (i, team) {
        team_map[team.name] = team.id;
    });

    return function findMatches(q, cb) {
        var matches, substringRegex;

        // an array that will be populated with substring matches
        matches = [];

        // regex used to determine if a string contains the substring `q`
        substrRegex = new RegExp(q, 'i');

        // iterate through the pool of strings and for any string that
        // contains the substring `q`, add it to the `matches` array
        $.each(team_list, function(i, team) {
            if (substrRegex.test(team.name)) {
                matches.push(team.name);
            }
        });

        cb(matches);
    };
};

$('#team_search .typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 0
},
{
    name: 'teams',
    source: teamMatcher(team_list)
});
$('#team_search .typeahead').bind('typeahead:selected', function(obj, datum, name) {
    $('#team_id_selected').val(team_map[datum]);
});
$('#team_search .typeahead').bind('typeahead:autocompleted', function(obj, datum, name) {
    $('#team_id_selected').val(team_map[datum]);
});

