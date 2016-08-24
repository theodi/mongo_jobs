require "mongo_jobs/version"
require 'fog'
require 'securerandom'
require 'dotenv'
require 'curacao'

Dotenv.load

module MongoJobs
  def self.download_latest_dump container
    temp_key = SecureRandom.base64

    client = Fog::Storage.new({
      provider: 'Rackspace',
      rackspace_username: ENV['RACKSPACE_USER'],
      rackspace_api_key: ENV['RACKSPACE_KEY'],
      rackspace_region: :lon,
      rackspace_temp_url_key: temp_key
    })

    account = client.account
    account.meta_temp_url_key = temp_key
    account.save

    dir = client.directories.get('quirkafleeg-dumps')
    key = dir.files.last.key
    file = dir.files.get(key)

    FileUtils.mkdir_p 'dumps/'

    File.open "dumps/#{key}", 'w' do |f|
      f.write file.body
    end
  end

  def self.nuke_db database
    %x[ mongo #{database} --eval 'db.dropDatabase()' ]
  end

  def self.restore_dump
    dump = Dir.entries('dumps').last
    %x[ tar xjf dumps/#{dump} && mongorestore --drop ]
  end
end
