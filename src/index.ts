#!/usr/bin/env node
import yargs from 'yargs';

const {hideBin} = require('yargs/helpers');

yargs(hideBin(process.argv))
    .command('serve [port]', 'start the server', (yargs) => {
        yargs
            .positional('port', {
                describe: 'port to bind on',
                default: 5000
            })
            .positional('port2', {
                describe: 'port to bind on',
                default: 5000
            });
    }, (argv) => {
        console.log(argv.verbose)
        if (argv.verbose) console.info(`start server on :${ argv.port }`);
    })
    .option('verbose', {
        alias: 'v',
        type: 'boolean',
        description: 'Run with verbose logging'
    })
    .argv;
