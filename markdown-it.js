#!/usr/bin/env node
/*eslint no-console:0*/

'use strict';

var fs = require('fs');
var argparse = require('argparse');
var parser = new argparse.ArgumentParser();

parser.add_argument('file', {
  help: 'File to read',
  nargs: '?',
  default: '-'
});

let args = parser.parse_args();

fs.readFile(args.file, 'utf8', function (err, input) {
  var output;

  if (err) {
    if (err.code === 'ENOENT') {
      console.error('File not found: ' + args.file);
      process.exit(2);
    }

    console.error(
      err.message ||
      String(err));

    process.exit(1);
  }

  try {
    output = require('./node_modules/markdown-it')().render(input);

  } catch (e) {
    console.error(
      e.message ||
      String(e));

    process.exit(1);
  }

  process.stdout.write(output);
});
