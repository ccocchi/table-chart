require "test_helper"

class TableTest < Minitest::Test
  def setup
    @t1 = Table.new([
      [1, 2],
      [3, 4]
    ])

    @t2 = Table.new([
      [1, 2, 3],
      [4, 5, 6]
    ])
  end

  def test_initialization_with_rows
    assert_equal 2, @t1.width
    assert_equal 2, @t1.height
    assert_equal [1, 2, 3, 4], @t1.instance_variable_get(:@ary)
  end

  def test_empty_initialization
    table = Table.new

    assert_equal 0, table.width
    assert_equal 0, table.height
    assert_empty table.instance_variable_get(:@ary)
  end

  def test_aliases
    assert_equal 3, @t2.cols
    assert_equal 2, @t2.rows
  end

  def test_emptying_a_table
    @t1.empty

    assert_equal 2, @t1.width
    assert_equal 0, @t1.height
    assert_empty @t1.instance_variable_get(:@ary)
  end

  def test_accessing_cell
    assert_equal 1, @t1[0, 0]
    assert_equal 3, @t1.(1, 0)
    assert_nil @t1.call(2, 1)
  end

  def test_accessing_non_cubic_cells
    assert_equal 2, @t2.(0, 1)
    assert_equal 6, @t2[1, 2]
  end

  def test_setting_cell
    @t1[0, 0] = 3
    assert_equal 3, @t1.(0, 0)
  end

  def test_adding_row
    @t1 << [5, 6]

    assert_equal 3, @t1.height
    assert_equal 5, @t1.(2, 0)
  end

  def test_adding_invalid_row
    assert_raises(ArgumentError) do
      @t1 << [5, 6, 7]
    end
  end

  def test_retrieving_row
    assert_equal [1, 2], @t1.row(0)
    assert_equal [4, 5, 6], @t2.row(1)
  end

  def test_retrieving_col
    assert_equal [1, 3], @t1.col(0)
    assert_equal [3, 6], @t2.col(2)
  end

  def test_retrieving_out_of_range_row
    assert_nil @t1.row(4)
  end

  def test_transpose
    @t2.transpose

    assert_equal 3, @t2.height
    assert_equal 2, @t2.width
    assert_equal 4, @t2[0, 1]
    assert_equal 3, @t2[2, 0]
  end

  def test_adding_column
    @t1.add_column([7, 8])

    assert_equal 3, @t1.cols
    assert_equal 7, @t1.(0, 2)
    assert_equal [3, 4, 8], @t1.row(1)
  end

  def test_equality
    other = Table.new([
      [1, 2],
      [3, 4]
    ])

    assert_equal other, @t1
  end

  def test_non_equality
    other = Table.new([
      [1, 2],
      [3, 4],
      [5, 6]
    ])

    refute_equal other, @t2
  end

  def test_to_array
    assert_equal [[1, 2], [3, 4]], @t1.to_a
  end
end
