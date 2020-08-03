# encoding: utf-8

title 'docker section'

control 'docker' do
  impact 0.7
  title 'Check docker container'
  desc 'Check docker container'

  describe docker_container(name: 'sut') do
    it { should exist }
    it { should be_running }
    its('id')      { should_not eq '' }
    its('image')   { should eq ENV['D_IMAGE'] }
    its('repo')    { should eq ENV['PACKAGE'] }
    its('tag')     { should eq ENV['PACKAGE_VERSION'] }
    its('command') { should eq '/bin/bash' }
  end

end
