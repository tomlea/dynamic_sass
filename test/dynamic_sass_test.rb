require File.join(File.dirname(__FILE__), "test_helper")

class DynamicSassTest < ActionController::TestCase
  tests DynamicSass::StylesheetsController

  PUBLIC_PATH = File.expand_path(File.dirname(__FILE__) + "/../public")
  SASS_PATH = "#{PUBLIC_PATH}/stylesheets/sass"

  should_route :get, "/stylesheets/foobar.css", {:controller => "dynamic_sass/stylesheets", :action => "show", :stylesheet => "foobar"}

  context "we have a stylesheet template" do
    setup do
      FileUtils.mkdir_p SASS_PATH
      File.open("#{SASS_PATH}/test.sass", "w"){|f| f << "div\n  :foo bar\n"}
    end

    teardown do
      FileUtils.rm    PUBLIC_PATH + "/stylesheets/sass/test.sass"
      FileUtils.rmdir PUBLIC_PATH + "/stylesheets/sass"
      FileUtils.rmdir PUBLIC_PATH + "/stylesheets"
      FileUtils.rmdir PUBLIC_PATH
    end

    context "and it is requested" do
      setup do
        get :show, :stylesheet => "test"
      end

      should_render_without_layout
      should_respond_with :success

      should "render a stylesheet" do
        assert_equal "div {\n  foo: bar; }\n", @response.body
      end

      should "have correct cache control headers" do
        assert_equal "max-age=86400, public", @response["Cache-Control"]
      end
    end

    context "and another stylesheet is requested" do
      setup do
        get :show, :stylesheet => "foo"
      end

      should_respond_with :missing
    end

    context "and an invalid stylesheet is requested" do
      setup do
        get :show, :stylesheet => "foo bar"
      end

      should_respond_with :bad_request
    end
  end
end
