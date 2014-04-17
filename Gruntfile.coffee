module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files: [
          expand: true
          cwd: 'src'
          src: '**/*.coffee'
          dest: 'dest'
          ext: '.js'
        ]
    coffeelint:
      app: 'src/**/*.coffee'
    copy:
      build:
        cwd: 'src'
        src: '**/*.html'
        dest: 'dest'
        expand: true
    clean:
      build:
        src: [ 'dest' ]
      styles:
        src: [ 'dest/**/*.css', '!dest/public/assets/styles/application.css' ]
      scripts:
        src: [ 'dest/**/*.js', '!dest/public/assets/js/application.js' ]
    stylus:
      build:
        options:
          linenos: false
          compress: false
        files: [
          expand: true
          cwd: 'src'
          src: ['**/*.styl']
          dest: 'dest'
          ext: '.css'
        ]
    cssmin:
      build:
        files:
          'dest/public/assets/styles/application.css': [ 'dest/**/frontend/**/*.css' ]
    uglify:
      build:
        options:
          mangle: false
        files:
          'dest/public/assets/js/application.js': [ 'dest/**/frontend/**/*.js' ]
    connect:
      server:
        options:
          port: 4000
          base: 'dest'
          hostname: '*'
    watch:
      files: ['Gruntfile.coffee', 'src/**/*.coffee', 'src/**/*.styl', 'src/**/*.html']
      tasks: ['stylus', 'cssmin', 'coffee', 'coffeelint', 'uglify', 'copy']

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'default', ['clean:build', 'copy', 'stylus', 'cssmin', 'coffee', 'coffeelint', 'uglify', 'watch']