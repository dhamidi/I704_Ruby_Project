require 'test_helper'

class ProjectTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Project::VERSION
  end
end
