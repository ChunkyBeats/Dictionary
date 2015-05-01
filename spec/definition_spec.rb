require('rspec')
require('definition')

describe(Definition) do

  before() do
    Definition.clear()
  end

  describe("#define") do
    it("returns the definition") do
      test_def = Definition.new({:define => "a sly animal"})
      test_def.save()
      expect(test_def.define()).to(eq("a sly animal"))
    end
  end

  describe("#save") do
    it("adds the definition to the array of saved definitions") do
      test_def = Definition.new({:define => "a sly animal"})
      test_def.save()
      expect(Definition.all()).to(eq([test_def]))
    end
  end

  describe("#.all") do
    it("will return all definitions (will be empty)") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("clears the array of saved definitions") do
      Definition.new({:define => "a sly animal"}).save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a definition by its ID number") do
      test_def_1 = Definition.new({:define => "a sly animal"})
      test_def_1.save()
      test_def_2 = Definition.new({:define => "AWESOME"})
      test_def_2.save()
      expect(Definition.find(test_def_1.id())).to(eq(test_def_1))
    end
  end

end
