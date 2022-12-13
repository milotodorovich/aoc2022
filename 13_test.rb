require "test/unit"
require_relative './13'

class ThirteenTest < Test::Unit::TestCase

    def test_compare_two_digits
        assert_true compare(1, 1)
        assert_true compare(0, 1)
        assert_false compare(1, 0)
    end

    def test_compare_two_arrays_same_size
        assert_true compare([1,2], [1,2])
        assert_true compare([1,2], [1,3])
        assert_true compare([1,2], [2,3])
        assert_false compare([3,2], [2,3])
    end

    def test_compare_two_arrays_first_smaller
        assert_true compare([4], [4,4])
        assert_true compare([3], [4,4])
        assert_false compare([5], [4,4])
    end

    def test_compare_two_arrays_second_smaller
        assert_false compare([4, 4], [4])
        assert_true compare([3, 4], [4])
    end

    def test_array_and_number_in_order
        assert_true compare([2,3,4], 4)
    end
    def test_array_and_number_NOT_in_order
        assert_false compare([2,3,4], 1)
    end
    def test_right_nil
        assert_false compare(1, nil)
        assert_false compare([1], [])
    end

    def test_1
        assert_true compare([1,1,3,1,1], [1,1,5,1,1])
    end
    def test_2
        assert_true compare([[1],[2,3,4]], [[1],4])
    end
    def test_3
        assert_false compare([9], [[8,7,6]])
    end
    def test_4
        assert_true compare([[4,4],4,4], [[4,4],4,4,4])
    end
    def test_5
        assert_false compare([7,7,7,7], [7,7,7])
    end
    def test_6
        assert_true compare([], [3])
    end
    def test_7
        assert_false compare([[[]]], [[]])
    end
    def test_8
        assert_false compare(
            [1,[2,[3,[4,[5,6,7]]]],8,9],
            [1,[2,[3,[4,[5,6,0]]]],8,9])
    end
end
