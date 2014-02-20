require "spec_helper.rb"

describe "stackdriver::default" do
  context "enabled" do
    let(:chef_run) do
      runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
      runner.node.set['stackdriver']['api_key'] = 'xxx'
      runner.converge(described_recipe)
    end

    it 'should enable the stackdriver-agent service' do
      expect(chef_run).to enable_service 'stackdriver-agent'
    end

    it 'should render the configuration file' do
      expect(chef_run).to render_file '/etc/default/stackdriver-agent'
    end
  end

  context "disabled" do
    let(:chef_run) do
      runner = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
      runner.node.set['stackdriver']['enable'] = false
      runner.converge(described_recipe)
    end

    it 'should not enable the stackdriver-agent service' do
      expect(chef_run).not_to enable_service 'stackdriver-agent'
    end

    it 'should not render the configuration file' do
      expect(chef_run).not_to render_file '/etc/default/stackdriver-agent'
    end
  end
end
