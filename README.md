# Hubot suisjenormal

A little script to get quotes from [suisjenormal.fr](http://www.suisjenormal.fr).

## Usage

Returns a random quote.

* `robot suisjenormal` : returns a random one


* [cheerio](https://github.com/MatthewMueller/cheerio)
* [he](https://github.com/mathiasbynens/he)

## Installation

Add the package `hubot-suisjenormal` as a dependency in your Hubot `package.json` file.

    "dependencies": {
      "hubot-suisjenormal": "0.1.0"
    }

Run the following command to make sure the module is installed.

    $ npm install hubot-suisjenormal

To enable the script, add the `hubot-suisjenormal` entry to the `external-scripts.json` file (you may need to create this file).

    ["hubot-suisjenormal"]
