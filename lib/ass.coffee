ASStest = require './ass-test'

module.exports =
class ASS
  file: null
  lines: null
  tests: null

  constructor: (@rawData) ->
    start = new Date().getTime()
    @parseData()
    console.log "ASS.parseData() "+(new Date().getTime() - start)+" ms"

  parseData: ->
    @splitDataIntoLines()
    @removeEmptyLinesAndComments()
    @splitLinesIntoTests()

  splitDataIntoLines: ->
    @lines = @rawData.split("\n")

  removeEmptyLinesAndComments: ->
    lines = []
    for line in @lines
      if line.length and (line[0] isnt "#")
        lines.push(line)
    @lines = lines

  splitLinesIntoTests: ->
    @tests = []
    test = []
    for line in @lines
      if line[0] is '@' and test.length
        @addTest(test)
        test = []
      test.push(line)
      if line[0] is '}'
        @addTest(test)
        test = []

  addTest: (test) ->
    if test.length > 1
      @tests.push(new ASStest(@tests.length, test))

  getTests: ->
    @tests
