path = require 'path'
ASS = require '../lib/ass'
fs = require 'fs'

ass = null
tests = 0

try
  absolutePath = path.join(__dirname, "test.ass")
  fileContents = fs.readFileSync(absolutePath, 'utf8')
  ass = new ASS(fileContents)
  tests = ass.getTests()
catch error
  console.log error
  ass = null
  tests = 0

if ass is null
  console.error "ASS could not be loaded"
else
  console.log "-----"
  console.log "Number of tests:", tests.length
  console.log "-----"

  # for test, i in tests
  #   console.log "Test #{i}: #{test.id}"
  #   console.log test
  #   console.log "-----"
