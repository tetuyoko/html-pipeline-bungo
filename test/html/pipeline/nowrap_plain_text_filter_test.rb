require 'test_helper'

class Html::Pipeline::NowrapTest < Minitest::Test
  HOGE = HTML::Pipeline::NowrapPlainTextInputFilter
  def test_no_div_wrap_plain_text_filter
    doc = HOGE.call "<p>吾輩は猫である。\n名前はまだ無い。</p>", {}
    dest = "&lt;p&gt;吾輩は猫である。\n名前はまだ無い。&lt;/p&gt;"

    assert_equal dest, doc.to_s
  end
end
