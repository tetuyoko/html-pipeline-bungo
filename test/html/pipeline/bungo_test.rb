require 'test_helper'

class Html::Pipeline::BungoTest < Minitest::Test
   def setup
     @pipeline = HTML::Pipeline.new [
                   HTML::Pipeline::BoldFilter,
                   HTML::Pipeline::EmphFilter,
                   HTML::Pipeline::ParagraphFilter,
                   HTML::Pipeline::RubyFilter,
                   HTML::Pipeline::DashFilter,
                 ]
   end

  def test_that_it_has_a_version_number
    refute_nil ::Html::Pipeline::Bungo::VERSION
  end

  def test_bungo_filter
    src = ":強調!<div>:鴨川(かもがわ)の水</div> :傍点.."
    dest = "<p><b>強調</b><div><ruby><rb>鴨川</rb><rp>(</rp><rt>かもがわ</rt><rp>)</rp></ruby>の水</div> <span class='botenparent'><span class='boten'>傍</span><span class='boten'>点</span></span></p>"
    doc = @pipeline.call(src)

    assert_equal dest, doc[:output].to_s
  end

  def test_paragraph_filter
    src = "hogehoge\rhogehoge\r\nhgoe\n\n"
    dest = "<p>hogehoge</p><p>hogehoge</p><p>hgoe</p><p></p><p></p>"
    doc = @pipeline.call(src)

    assert_equal dest, doc[:output].to_s
  end

  def test_pararel_filter
    src = ":傍点..(ほげ)"
    dest = "<p><span class='botenparent'><span class='boten'>傍</span><span class='boten'>点</span></span>(ほげ)</p>"
    doc = @pipeline.call(src)

    assert_equal dest, doc[:output].to_s
  end

  def test_dash_filter
    src = ":--"
    dest = "<p><span class='dash'>――</span></p>"
    doc = @pipeline.call(src)

    assert_equal dest, doc[:output].to_s
  end

  def test_one_stop
    src = ":お.. :性せい).. :性せい)!.."
    
    dest =  "<p><span class='botenparent'><span class='boten'>お</span></span> :性せい).. :性せい)!..</p>"
    doc = @pipeline.call(src)

    assert_equal dest, doc[:output].to_s
  end

end
