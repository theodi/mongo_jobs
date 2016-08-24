describe MongoJobs do
  it 'has a version number' do
    expect(MongoJobs::VERSION).not_to be nil
  end

#  it 'downloads an file' do
#    described_class.download_latest_dump 'quirkafleeg-dumps'
#    expect(File).to exist 'dumps/mongo-2016-08-24.tbz'
#  end
end
