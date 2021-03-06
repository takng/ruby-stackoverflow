require "rails/generators"
require "ruby-stackoverflow"
class RubyStackoverflowGenerator < Rails::Generators::Base
  desc "Creates the ruby-stackoverflow initializer file at config/initialize/ruby-stackoverflow.rb"
  class_option :client_key, aliases: "-k", type: :string, desc: "Your Stackoverflow Client key"
  class_option :access_token, aliases: "-k", type: :string, desc: "Your STackoverflow access token"

  def self.source_root
    @_ruby_stackoverflow_root ||= File.expand_path("../templates", __FILE__)
  end

  def install
    template "ruby-stackoverflow.rb", "config/initializer/ruby-stackoverflow.rb"
  end

  private

  def configuration_output
    output = <<-eos
RubyStackoverflow.configure do|config|
  config.client_key = #{client_key}
  config.access_token = #{access_token}
end
    eos
    output
  end
end
