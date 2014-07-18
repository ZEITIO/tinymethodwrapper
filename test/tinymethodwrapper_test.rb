require 'test_helper'

class User
  include Tinymethodwrapper

  @@custom_called = 0

  def self.custom_called
    @@custom_called
  end

  def self.set_custom_called(new_val)
    @@custom_called = new_val
  end

  def godzilla_rocks
    "yes"
  end

  def method_with_argument(hi)
    hi
  end

  def method_with_keyword_arguments(age, name: "bruno")
    age.to_s + name
  end

  def method_with_default_arguments(name = "hans")
    name
  end

  wrap_methods %i[godzilla_rocks method_with_argument
    method_with_keyword_arguments method_with_default_arguments],
    -> (method_name) { @@custom_called += 1}
end

describe Tinymethodwrapper do
  # Reset class var before each test
  before do
    User.set_custom_called 0
  end

  it "adds a class method" do
    assert User.respond_to? :wrap_methods
  end

  it "wraps the method and performs something" do
    u = User.new
    assert u.godzilla_rocks == "yes"
    assert User.custom_called == 1
  end

  it "works for methods with arguments" do
    u = User.new
    assert u.method_with_argument("hi") == "hi"
    assert User.custom_called == 1
  end

  it "works for methods with keyword arguments" do
    u = User.new
    assert u.method_with_keyword_arguments(16, name: "bruno") == "16bruno"
    assert User.custom_called == 1
  end

  it "works for methods with default arguments" do
    u = User.new
    assert u.method_with_default_arguments == "hans"
    assert User.custom_called == 1
  end
end
