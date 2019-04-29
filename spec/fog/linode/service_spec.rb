describe Fog::Linode::Service do
  it 'configures the client to include fog-linode in the User-Agent' do
    Fog::Core::Connection.expects(:add_user_agent).with("fog-linode/#{Fog::Linode::VERSION}")
    Fog::Linode::Service.new
  end

  it 'includes additional tokens in the User-Agent when `:user_agents` is specified' do
    Fog::Core::Connection.expects(:add_user_agent).with("fog-linode/#{Fog::Linode::VERSION}")
    Fog::Core::Connection.expects(:add_user_agent).with('my-token/1.2.3')
    Fog::Linode::Service.new(user_agents: ['my-token/1.2.3'])
  end
end
