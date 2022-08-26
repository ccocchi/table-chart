class Table
  attr_reader :width, :height

  def initialize(rows = nil)
    if rows&.any?
      first, *rest = rows

      unless rest.all? { |a| a.length == first.length }
        raise ArgumentError, "rows must have the same length"
      end

      @ary    = rows.flatten
      @height = rows.size
      @width  = first.length
    else
      empty(keep_dimensions: false)
    end
  end

  protected def ary
    @ary
  end

  def rows
    @height
  end

  def cols
    @width
  end

  def empty(keep_dimensions: true)
    @ary    = []
    @height = 0
    @width  = 0 unless keep_dimensions
  end

  def to_a
    @ary.each_slice(width).to_a
  end

  # Same as matrix notation, i is the row number while j is the column number.
  def call(i, j)
    @ary[i * width + j]
  end
  alias_method :[], :call
  alias_method :cell, :call

  def []=(i, j, val)
    @ary[i * width + j] = val
  end

  def <<(row)
    raise ArgumentError, "row size does not match table" if row.size != width
    @ary.concat(row)
    @height += 1
  end

  def row(n)
    start = n * width
    @ary.slice(start, width)
  end

  def col(n)
    start = n
    stop  = size
    res   = Array.new(height)
    i     = 0

    while n < stop
      res[i] = @ary[n]
      n += width
      i += 1
    end

    res
  end

  def size
    width * height
  end

  def transpose
    res = Array.new(size)
    @ary.each_with_index do |e, i|
      r, c = i.divmod(width)
      res[c * height + r] = e
    end

    @ary    = res
    w       = @width
    @width  = @height
    @height = w
  end

  def add_column(col)
    raise ArgumentError, "col size does not match table" if col.size != height

    new_width = width + 1

    res = Array.new(size + height)
    @ary.each_with_index do |e, i|
      r, c = i.divmod(width)
      res[r * new_width + c] = e
    end

    col.each_with_index { |e, i| res[(i + 1) * new_width - 1] = e }

    @ary = res
    @width = new_width
  end

  def ==(other)
    width == other.width && height == other.height && @ary == other.ary
  end
end
