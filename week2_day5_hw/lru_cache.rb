class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      move_to_front(el)
    elsif @cache.length < @size
      @cache << el
    else
      @cache.shift
      @cache << el
    end
  end

  def show
    @cache.dup
  end

  private
  def move_to_front(el)
    idx = @cache.index(el)
    sliced = @cache.slice!(idx)
    @cache << sliced
  end

end
