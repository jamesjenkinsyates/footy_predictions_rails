require 'spec_helper'

describe User do

  it { should have_many :predictions }

  pending "add some examples to (or delete) #{__FILE__}"
end
