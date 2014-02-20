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

    it 'should render the configuration file and notify the service to restart' do
      expect(chef_run).to render_file chef_run.node[:stackdriver][:config_path]
      template = chef_run.template(chef_run.node[:stackdriver][:config_path])
      expect(template).to notify('service[stackdriver-agent]').to(:restart)
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
