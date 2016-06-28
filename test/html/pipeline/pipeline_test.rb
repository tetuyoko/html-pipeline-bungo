require 'test_helper'

class Html::Pipeline::PipelineTest < Minitest::Test

  def test_pipeline_with_div
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::PlainTextInputFilter,
      HTML::Pipeline::BungoFilter,
    ]
    doc = pipeline.call "吾輩は猫である。\n名前はまだ無い。", {}
    dest = "<p><div>吾輩は猫である。</p><p>名前はまだ無い。</div></p>"

    assert_equal dest, doc[:output].to_s
  end

  def test_pipeline_with_no_div
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::NowrapPlainTextInputFilter,
      HTML::Pipeline::BungoFilter,
    ]
    doc = pipeline.call "吾輩は猫である。\n名前はまだ無い。", {}
    dest = "<p>吾輩は猫である。</p><p>名前はまだ無い。</p>"

    assert_equal dest, doc[:output].to_s
  end

end
