require_relative '../lib/negator'

describe 'a class including Negator' do
  let(:qlass) do
    Class.new do
      include Negator
      
      def purple?
        true
      end
      
      def walrus?
        false
      end
      
      def poo
        nil
      end
    end
  end
  
  let(:purple_giraffe) { qlass.new }
  
  it "responds to boolean methods negated with `not_`" do
    purple_giraffe.should respond_to :not_purple?
  end
  
  it "responds to boolean methods negated with `no_`" do
    purple_giraffe.should respond_to :no_walrus?
  end
  
  it "doesn't respond to negated non-boolean methods" do
    purple_giraffe.should_not respond_to :no_poo
  end
  
  it "returns the correct value from negated methods" do
    purple_giraffe.not_purple? .should be_false
    purple_giraffe.no_walrus?  .should be_true
  end
  
  it 'raises on nonexistent negated methods' do
    expect { purple_giraffe.no_poo }.to raise_error NoMethodError
  end
  
  it 'returns the correct value from non-negated methods' do
    purple_giraffe.purple? .should be_true
    purple_giraffe.walrus? .should be_false
    purple_giraffe.poo.should be_nil
  end
end
