guard 'rspec', :all_on_start => false, :all_after_pass => false, :cli => '--format Fuubar' do
  watch(%r{^(.*)\.(rb|haml|erb)$}) { 'spec' }
end

guard 'spork', :rspec => true, :test_unit => false, :wait => 60, :rspec_port => 8991, :cucumber => false do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.*\.rb$})
  watch(%r{^config/initializers/.*\.rb$})
  watch('spec/spec_helper.rb')
end