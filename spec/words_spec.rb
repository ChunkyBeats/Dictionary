require('rspec')
require('words')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe('#word') do
    it("returns the word") do
      test_word = Word.new({:word => "fox"})
      expect(test_word.word()).to(eq("fox"))
    end
  end

  describe('#id') do
    it("returns the id number of the word") do
      test_word = Word.new({:word => "fox"})
      expect(test_word.id()).to(eq(1))
    end
  end

  describe('#save') do
    it("saves the word into the Words array") do
      test_word = Word.new({:word => "fox"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe('#entry') do
    it("returns the definition of the word (it will be empty here)") do
      test_word = Word.new({:word => "fox"})
      expect(test_word.entry()).to(eq([]))
    end
  end

  describe('.all') do
    it("will be empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears out the array of all words") do
      test_word = Word.new({:word => "fox"})
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.find') do
    it("returns a word by its ID number") do
      test_word = Word.new({:word => "fox"})
      test_word.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe('#add_definition') do
    it("adds a definition to a word") do
      test_word = Word.new({:word => "fox"})
      test_definition = Definition.new({:define =>"a sly animal"})
      test_word.add_definition(test_definition)
      expect(test_word.entry).to(eq([test_definition]))
    end
  end

end
