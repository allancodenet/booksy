class BasePresenter
  include Rails.application.routes.url_helpers
  @build_attributes = []
  @relations = []
  @sort_attributes = []
  @filter_attributes = []

  def cover
    path = @object.cover.url.to_s
    path[0] = "" if path[0] == "/"
    "#{root_url}#{path}"
  end
  # metaprogramming example
  #  #CLASS_ATTRIBUTES = {
  #     build_with: :build_attributes,
  #     related_to: :relations,
  #     sort_by: :sort_attributes,
  #     filter_by: :filter_attributes
  #   }

  #   CLASS_ATTRIBUTES.each { |k, v| instance_variable_set("@#{v}", []) }

  #   class << self
  #     attr_accessor *CLASS_ATTRIBUTES.values

  #     CLASS_ATTRIBUTES.each do |k, v|
  #       define_method k do |*args|
  #         instance_variable_set("@#{v}", args.map(&:to_s))
  #       end
  #     end
  #   end
  #
  #
  class << self
    attr_accessor :relations, :sort_attributes,
      :filter_attributes, :build_attributes

    def build_with(*args)
      @build_attributes = args.map(&:to_s)
    end

    def related_to(*args)
      @relations = args.map(&:to_s)
    end

    def sort_by(*args)
      @sort_attributes = args.map(&:to_s)
    end

    def filter_by(*args)
      @filter_attributes = args.map(&:to_s)
    end
  end

  attr_accessor :object, :params, :data
  def initialize(object, params, options = {})
    @object = object
    @params = params
    @options = options
    @data = HashWithIndifferentAccess.new
  end

  def as_json(*)
    @data
  end

  def build(actions)
    actions.each { |action| send(action) }
    self
  end

  def fields
    FieldPicker.new(self).pick
  end

  def embeds
    EmbedPicker.new(self).embed
  end
end
