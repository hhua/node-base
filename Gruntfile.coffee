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
      app: ['src/**/*.coffee', "Gruntfile.coffee"]
      options:
        configFile: 'coffeelint.json'
    copy:
      templates:
        cwd: 'src'
        src: '**/*.html'
        dest: 'dest'
        expand: true
      scripts:
        cwd: 'src/core/frontend/vendor'
        src: [ '**/*.js']
        dest: 'dest/public/vendor'
        expand: true
      styles:
        cwd: 'src/core/frontend/vendor'
        src: '**/*.css'
        dest: 'dest/public/vendor'
        expand: true
      fonts:
        cwd: 'src/core/frontend/vendor'
        src: [ '**/*.eot', '**/*.svg', '**/*.ttf', '**/*.woff', '**/*.woff2' ]
        dest: 'dest/public/vendor'
        expand: true
    clean:
      build:
        src: [ 'dest' ]
      styles:
        src: [ 'dest/**/*.css', '!dest/public/assets/styles/application.css' ]
      scripts:
        src: [ 'dest/**/*.js', '!dest/public/assets/scripts/application.js' ]
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
          'dest/public/assets/styles/application.min.css': [ 'dest/core/frontend/styles/main.css' ]
    uglify:
      build:
        options:
          mangle: false
        files:
          'dest/public/assets/scripts/application.min.js': [ 'dest/**/frontend/**/*.js' ]
    connect:
      server:
        options:
          port: 4000
          base: 'dest'
          hostname: '*'
    watch:
      files: ['Gruntfile.coffee', 'src/**/*.coffee', 'src/**/*.styl', 'src/**/*.html', 'src/**/*.js']
      tasks: ['stylus', 'cssmin', 'coffeelint', 'coffee', 'uglify', 'copy']

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

  grunt.registerTask 'default', ['clean:build', 'stylus', 'cssmin', 'coffeelint', 'coffee', 'uglify', 'copy']

