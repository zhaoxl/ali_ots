lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ali_ots/version'

Gem::Specification.new do |s|
  s.name        = 'ali_ots'
  s.version     = AliOts::VERSION
  s.date        = '2015-09-21'
  s.summary     = "AliOts"
  s.description = "Aliyun OTS from ruby client"
  s.authors     = ["Backkom"]
  s.email       = '99866770@qq.com'
  s.files       = ["lib/ali_ots.rb"]
  s.homepage    = 'https://github.com/zhaoxl/ali_ots'
  s.license     = 'MIT'
  s.files       = Dir["{lib}/**/*"]
  s.require_paths = ["lib"]
  s.add_dependency 'faraday', '>= 0.9'
  s.add_dependency 'protobuf', '>= 3.5'
  s.add_dependency 'addressable', '>= 2.3'
  
end