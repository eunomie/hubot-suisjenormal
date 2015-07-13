# Description:
#   Display quote from "Suisjenormal.fr <http://www.suisjenormal.fr>".
#
# Dependencies:
#   "cheerio": "0.7.0"
#   "he": "0.4.1"
#
# Configuration:
#   None
#
# Commands:
#   hubot suisjenormal - Returns random quote
#
# Author:
#   Eunomie

cheerio = require('cheerio')
he = require('he')

module.exports = (robot)->
  robot.respond /suisjenormal/i, (message)->
    send_quote message, 'http://www.suisjenormal.fr/hasard', (desc, text)->
      message.send desc
      message.send "/quote #{text}"

send_quote = (message, location, response_handler)->
  url = location

  message.http(url).get() (error, response, body)->
    return response_handler "Sorry, something went wrong" if error

    if response.statusCode == 302 || response.statusCode == 301
      location = response.headers['location']
      return send_quote(message, location, response_handler)

    $ = cheerio.load(body)
    el = $("#siteDescription .transp p").first()
    desc = he.decode el.text()
    
    el = $("#siteDescription .transp i.highlightstory")[1]
    txt = he.decode el.text()

    response_handler desc, txt
