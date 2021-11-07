RSpec.describe CollectService do
  subject { CollectService.new('world') }
  it 'return this is' do
    expect(subject.convert).to eq('this is world')
  end
end
