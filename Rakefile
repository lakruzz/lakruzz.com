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
    sh 'bundle exec jekyll serve --source src --destination _site --livereload --quiet'
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
      enforce_https: false,
      ignore_urls: [
        %r{linkedin\.com},
        %r{twitter\.com},
        %r{instagram\.com},
        %r{devopsdays\.dk}
      ]
    }
    
    HTMLProofer.check_directory('./_site', options).run
    puts '✓ HTML validation passed!'
  end

  desc 'Validate HTML links (including external)'
  task :check_external do
    puts 'Running HTML link validation (with external links)...'
    
    options = {
      assume_extension: '.html',
      check_external_hash: false,
      extensions: ['.html'],
      ignore_urls: [
        %r{linkedin\.com},
        %r{twitter\.com},
        %r{instagram\.com},
        %r{devopsdays\.dk}
      ]
    }
    
    HTMLProofer.check_directory('./_site', options).run
    puts '✓ HTML validation passed!'
  end

  desc 'Validate HTML links (in development environment, including external)'
  task :dev do
    puts 'Running HTML link validation (with external links)...'
    
    options = {
      assume_extension: '.html',
      check_external_hash: false,
      enforce_https: false,
      extensions: ['.html'],
      ignore_urls: [
        %r{linkedin\.com},
        %r{twitter\.com},
        %r{instagram\.com},
        %r{devopsdays\.dk}
      ]
    }
    
    HTMLProofer.check_directory('./_site', options).run
    puts '✓ HTML validation passed!'
  end  
end
