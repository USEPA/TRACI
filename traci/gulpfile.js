const { series, src, dest } = require('gulp');

// Task 1: copy bootstap's assets to /traci/static/lib/
function bootstrap() {
    const files = [
        'node_modules/bootstrap/dist/css/bootstrap.min.css',
        'node_modules/bootstrap/dist/js/bootstrap.min.js'
    ];
    return src(files).pipe(dest('traci/static/lib'));
}

// Task 2: copy jquery's assets to /traci/static/lib/
function jquery() {
    const files = [
        'node_modules/jquery/dist/jquery.min.js'
    ];
    return src(files).pipe(dest('traci/static/lib'));
}

// Task 3: copy jquery-ui dist assets to /traci/static/lib/
function jqueryuidist() {
    const files = [
        'node_modules/jquery-ui-dist/jquery-ui.min.js',
        'node_modules/jquery-ui-dist/jquery-ui.min.css',
        'node_modules/jquery-ui-dist/jquery-ui.structure.min.css',
        'node_modules/jquery-ui-dist/jquery-ui.theme.min.css'
    ];
    return src(files).pipe(dest('traci/static/lib'));
}

// Task 4: copy jquery-validation's assets to /traci/static/lib/
function jqueryvalidation() {
    const files = [
        'node_modules/jquery-validation/dist/jquery.validate.min.js'
    ];
    return src(files).pipe(dest('traci/static/lib'));
}

// Task 5: copy popper's assets to /traci/static/lib/
function popper() {
    const files = [
        'node_modules/popper.js/dist/umd/popper.min.js'
    ];
    return src(files).pipe(dest('traci/static/lib'));
}

exports.default = series(bootstrap, jquery, jqueryuidist, jqueryvalidation, popper);
