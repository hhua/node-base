global.APP_ROOT = (require 'path').resolve "#{__dirname}/../"
global.requireRoot = (path) -> require "#{APP_ROOT}/#{path}"