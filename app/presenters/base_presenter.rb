class BasePresenter
  @build_attributes = []
  @relations = []
  @sort_attributes = []
  @filter_attributes = []
 #metaprogramming example
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
  class  << self
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
  def initialize(object, params, options = {} )
      @object = object
      @params = params
      @options = options
      @data = HashWithIndifferentAccess.new
  end

  def as_json(*)
    @data
  end







  
  
end