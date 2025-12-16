require 'html-proofer'

task default: 'build'

task build: 'jekyll:build' do
  puts 'Build completed.'
end

namespace :jekyll do
  desc 'Build Jekyll site'
  task :build do
    sh 'bundle exec jekyll build --source src --quiet --destination _site'
  end

  desc 'Serve Jekyll site with live reload'
  task :serve do
    sh 'bundle exec jekyll serve --source src --destination _site --livereload'
  end 
end

namespace :proofer do
  desc 'Validate HTML links (internal only)'
  task :check do
    puts 'Running HTML link validation...'

    # Set options for HTMLProofer
    # https://github.com/gjtorikian/html-proofer?tab=readme-ov-file#using-on-the-command-line
    
    options = {
      disable_external: true,
      assume_extension: '.html',
      extensions: ['.html'],
      check_external_hash: false,
      check_internal_hash: false,
      ignore_urls: [
        %r{linkedin\.com},
        %r{twitter\.com},
        %r{instagram\.com},
        %r{lakruzz\.com}
      ]
    }
    
    HTMLProofer.check_directory('./_site', options).run
    puts '✓ HTML validation passed!'
  end

  desc 'Validate HTML links (including external)'
  task :check_external do
    puts 'Running HTML link validation (with external links)...'
    
    options = {
      disable_external: false,
      assume_extension: '.html',
      extensions: ['.html'],
      check_external_hash: false,
      check_internal_hash: false,
      ignore_urls: [
        %r{linkedin\.com},
        %r{twitter\.com},
        %r{instagram\.com},
        %r{lakruzz\.com}
      ]
    }
    
    HTMLProofer.check_directory('./_site', options).run
    puts '✓ HTML validation passed!'
  end

end
