require 'test_helper'

class Html::Pipeline::BungoTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::Html::Pipeline::Bungo::VERSION
  end

  def test_bungo_filter
    src = "<div>:鴨川(かもがわ)の水</div> :傍点.."
    dest = "<div><ruby><rb>鴨川</rb><rp>(</rp><rt>かもがわ</rt><rp>)</rp></ruby>の水</div> <em class='emphasis-dot'><span>傍点</span></em>"

    assert_equal HTML::Pipeline::BungoFilter.to_html(src), dest
  end
end
