# coding: utf-8

Gem::Specification.new do |spec|
    spec.name                    = "jekyll-memo"
    spec.version                 = "0.0.1"
    spec.authors                 = ["Lars Kruse"]
    spec.email                   = ["lars@lakruzz.com"]
 
  
    spec.summary                 = %q{A metric model framework on top of minimal-mistakes Jekyll theme.}
    spec.homepage                = "https://codememo.lakruzz.com"
    spec.license                 = "MIT"
  
    spec.metadata["plugin_type"] = "theme"
  
    spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|reports|_data|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }
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
