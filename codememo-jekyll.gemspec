# coding: utf-8

Gem::Specification.new do |spec|
    spec.name                    = "codememo-jekyll"
    spec.version                 = "0.0.1"
    spec.authors                 = ["Lars Kruse, Michael Rose"]
  
    spec.summary                 = %q{A metric model framework on to of minimal-mistakes Jekyll theme.}
    spec.homepage                = "https://codememo.lakruzz.com"
    spec.license                 = "MIT"
  
    spec.metadata["plugin_type"] = "theme"
  
    spec.files                   = `git ls-files -z`.split("\x0").select do |f|
      f.match(%r{^(assets|_(data|includes|layouts|sass)/|(LICENSE|README|CHANGELOG)((\.(txt|md|markdown)|$)))}i)
    end
  
    spec.add_runtime_dependency "jekyll", ">= 3.7", "< 5.0"
    spec.add_runtime_dependency "jekyll-paginate", "~> 1.1"
    spec.add_runtime_dependency "jekyll-sitemap", "~> 1.3"
    spec.add_runtime_dependency "jekyll-gist", "~> 1.5"
    spec.add_runtime_dependency "jekyll-feed", "~> 0.1"
    spec.add_runtime_dependency "jekyll-include-cache", "~> 0.1"
  
    spec.add_development_dependency "bundler"
    spec.add_development_dependency "rake", ">= 12.3.3"
  end