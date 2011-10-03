task :compile_css do
  system 'sass --update vendor/assets/stylesheets/sass/bhf.sass:vendor/assets/stylesheets/bhf.css --style compressed'
end

task :compile_js do
  require 'yuicompressor'

  output = ''
  [
    'mootools-core-1.3.2-full-compat-yc.js',
    'mootools-more-1.3.2.1.js'
  ].each do |js_path|
    output << File.read('vendor/assets/javascripts/bhf/'+js_path)
  end

  [
    'mootools_rails_driver-0.4.1.js',
    'class/BrowserUpdate.js',
    'class/Ajaxify.js',
    'class/AjaxEdit.js',
    'class/MooEditable.js',
    'class/Datepicker.js',
    'class/MultipleFields.js',
    'bhf_application.js'
  ].each do |js_path|
    output << YUICompressor.compress_js(File.read('vendor/assets/javascripts/bhf/'+js_path))
  end

  File.open('vendor/assets/javascripts/bhf.js', 'w') do |file|
    file.write(output)
  end
end

task :default => :compile_css

require 'rake/testtask'

Rake::TestTask.new do |test|
  test.pattern = 'test/**/*_test.rb'
  test.libs << 'test'
end


begin
  require 'jeweler'

  Jeweler::Tasks.new do |gem|
    Rake::Task[:compile_js].invoke
    Rake::Task[:compile_css].invoke
    
    gem.name = 'bhf'
    gem.summary = 'Agnostic rails backend'
    gem.description = 'Gets you there in time'
    gem.email = 'anton.pawlik@gmail.com'
    gem.authors = ['Anton Pawlik']
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*", "vendor/assets/stylesheets/bhf.css", "vendor/assets/javascripts/bhf.js", "vendor/assets/javascripts/bhf_includes/showdown.js", "vendor/assets/javascripts/bhf_includes/wmd.js", "public/images/logo_bhf.png", "public/images/bhf/*"]
    gem.homepage = 'http://github.com/antpaw/bahnhof'
    gem.rubyforge_project = 'nowarning'
    gem.add_dependency 'rails', '> 3.1.0'
    gem.add_dependency 'haml', '> 3.1.3'
    gem.add_dependency 'kaminari'
  end

  Jeweler::GemcutterTasks.new
end
