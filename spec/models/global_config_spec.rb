require 'rails_helper'

#describe GlobalConfig do
RSpec.describe GlobalConfig, :type => :model do

  context "should save total four type of value" do

    it "should create string" do
      expect {
        GlobalConfig.store({key: 'email', value_str: 'test@gmail.com', class_str: 'String'})
      }.to change { GlobalConfig.count }.by(1)
      global_config = GlobalConfig.last

      assert global_config.key.eql?('email')
      assert global_config.value.eql?('test@gmail.com')
    end

    it "should save integer" do
      expect {
        GlobalConfig.store({key: 'cap', value_str: 100, class_str: 'Integer'})
      }.to change { GlobalConfig.count }.by(1)
      global_config = GlobalConfig.last

      assert global_config.key.eql?('cap')
      assert global_config.value.eql?(100)

    end

    it "should save float" do
      expect {
        GlobalConfig.store({key: 'pi', value_str: 3.1416, class_str: 'Float'})
      }.to change { GlobalConfig.count }.by(1)
      global_config = GlobalConfig.last

      assert global_config.key.eql?('pi')
      assert global_config.value.eql?(3.1416)
    end

    it "should save boolean" do
      expect {
        GlobalConfig.store({key: 'enable', value_str: true, class_str: 'Boolean'})
      }.to change { GlobalConfig.count }.by(1)
      global_config = GlobalConfig.last

      assert global_config.key.eql?('enable')
      expect(global_config.value).to be(true)
    end
  end

  context "should update total four type of value" do
    it "should update string" do
      GlobalConfig.store({key: 'email', value_str: 'test@gmail.com'})
      GlobalConfig.store({key: 'email', value_str: 'fake@gmail.com'})
      global_config = GlobalConfig.last
      assert global_config.value.eql?('fake@gmail.com')
    end
  end

  context "should delete total four type of value" do
    it "should delete string" do
      GlobalConfig.store({key: 'email', value_str: 'test@gmail.com'})
      expect {
        GlobalConfig.delete(:email)
      }.to change { GlobalConfig.count }.by(-1)
      GlobalConfig.count.should == 0
    end
  end

  context "should store cache total four type of value" do
    it "should cache string" do
      GlobalConfig.store({key: 'email', value_str: 'test@gmail.com'})
      assert GlobalConfig.read_cache(:email).eql?('test@gmail.com')
    end
  end

end