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
    console.log(crypto.createHash('sha256').update(argv.input).digest('hex'));
} else {
    console.log("Input recieved was blank.");
    process.exit(1);
}