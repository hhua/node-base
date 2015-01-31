describe 'Simple Test', ->
  it 'shoule return -1 when the value is not present', ->
    [1,2,3].indexOf(5).should.equal(-1)
    [1,2,3].indexOf(0).should.equal(-1)
