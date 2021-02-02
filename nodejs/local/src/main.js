const yargs = require('yargs');
const crypto = require('crypto');

const argv = yargs
    .option('input', {
        description: '',
        type: 'string',
        demand: true,
    })
    .help()
    .alias('help', 'h')
    .argv;

if (argv.input) {
    console.log(hashInput(argv.input));
} else {
    console.log("Input recieved was blank.");
    process.exit(1);
}

function hashInput(input) {
    var output = crypto.createHash('sha256').update(input).digest();

    for (const _ in [...Array(99998).keys()]) { // eslint-disable-line no-unused-vars
        output = crypto.createHash('sha256').update(output).digest();
    }

    return crypto.createHash('sha256').update(output).digest('hex');
}