chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'suisjenormal', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()

    require('../src/suisjenormal')(@robot)

  it 'registers respond listeners', ->
    expect(@robot.respond.args[0][0].toString()).to.equal("/suisjenormal/i")
    expect(@robot.respond.args[0][0].toString()).to.equal("/suis-je normal ?/i")
