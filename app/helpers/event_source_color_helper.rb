module EventSourceColorHelper
  def color_for event_source
    color_cache event_source.id
  end

  def color_cache event_source_id
    @color_cache ||= {}
    @color_cache[event_source_id] ||= generate_color(event_source_id * 40000)
  end

  def generate_color seed
    generator = ColorGenerator.new saturation: 0.35, value: 0.9, seed: seed
    generator.create_hex
  end
end
