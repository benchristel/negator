module Negator
  NEGATED_METHOD = /^(?:not_|no_)(.*\?)$/

  def method_missing(meth, *args, &block)
    if meth.to_s =~ NEGATED_METHOD
      not send $1, *args, &block
    else
      super
    end
  end
  
  def respond_to?(meth)
    if meth.to_s =~ NEGATED_METHOD
      super $1
    else
      super
    end
  end
end
