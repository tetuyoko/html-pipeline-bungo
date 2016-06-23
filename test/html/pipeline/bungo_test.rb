require 'test_helper'

class Html::Pipeline::BungoTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Html::Pipeline::Bungo::VERSION
  end

  def test_bungo_filter
    src = ":強調!<div>:鴨川(かもがわ)の水</div> :傍点.."
    dest = "<b>強調</b><div><ruby><rb>鴨川</rb><rp>(</rp><rt>かもがわ</rt><rp>)</rp></ruby>の水</div> <span class='botenparent'><span class='boten'>傍点</span></span>"

    assert_equal dest, HTML::Pipeline::BungoFilter.to_html(src)
  end
end
