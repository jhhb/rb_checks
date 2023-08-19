# frozen_string_literal: true

RSpec.describe "The standard library" do
  describe "Module#ancestors" do
    module_a = Module.new
    module_b = Module.new

    context "both modules are included" do
      test_class = Class.new do
        include module_a
        include module_b
      end

      it "places the last-included module right after the class" do
        expect(test_class.ancestors).to eq([test_class, module_b, module_a, Object, PP::ObjectMixin, Kernel,
                                            BasicObject])
      end
    end

    context "both modules are prepended" do
      test_class = Class.new do
        prepend module_a
        prepend module_b
      end

      it "places the last-prepended module first in the ancestor chain" do
        expect(test_class.ancestors).to eq([module_b, module_a, test_class, Object, PP::ObjectMixin, Kernel,
                                            BasicObject])
      end
    end
  end
end
