require "test/unit"
require_relative './13'

class ThirteenTest < Test::Unit::TestCase

    def test_compare_two_digits
        assert_equal 0, compare(1, 1)
        assert_equal -1, compare(0, 1)
        assert_equal 1, compare(1, 0)
    end

    def test_compare_two_arrays_same_size
        assert_equal 0, compare([1,2], [1,2])
        assert_equal -1, compare([1,2], [1,3])
        assert_equal -1, compare([1,2], [2,3])
        assert_equal 1, compare([3,2], [2,3])
    end

    def test_compare_two_arrays_first_smaller
        assert_equal -1, compare([4], [4,4])
        assert_equal -1, compare([3], [4,4])
        assert_equal 1, compare([5], [4,4])
    end

    def test_compare_two_arrays_second_smaller
        assert_equal 1, compare([4, 4], [4])
        assert_equal -1, compare([3, 4], [4])
    end

    def test_array_and_number_in_order
        assert_equal -1, compare([2,3,4], 4)
    end
    def test_array_and_number_NOT_in_order
        assert_equal 1, compare([2,3,4], 1)
    end
    def test_right_nil
        # assert_equal 1, compare(1, nil)
        assert_equal 1, compare([1], [])
    end

    def test_1
        assert_equal -1, compare([1,1,3,1,1], [1,1,5,1,1])
    end
    def test_2
        assert_equal -1, compare([[1],[2,3,4]], [[1],4])
    end
    def test_3
        assert_equal 1, compare([9], [[8,7,6]])
    end
    def test_4
        assert_equal -1, compare([[4,4],4,4], [[4,4],4,4,4])
    end
    def test_5
        assert_equal 1, compare([7,7,7,7], [7,7,7])
    end
    def test_6
        assert_equal -1, compare([], [3])
    end
    def test_7
        assert_equal 1, compare([[[]]], [[]])
    end
    def test_8
        assert_equal 1, compare(
            [1,[2,[3,[4,[5,6,7]]]],8,9],
            [1,[2,[3,[4,[5,6,0]]]],8,9])
    end


    def test_problem_38
        assert_equal 1,  compare(
            [[[[9],5]],[[[7,7,4],8,9,[0,10,2,0,9]],[[1,0],[6],4],6],[[[7,8],8,9,[],[]],5,[],9],[10]],
            [[[9,[],6],[[7,8,8,1],[]],[4,[],[8,4,9,3,5],3],[0,[0,5,3,4],0,1],[4,9,4,7]],[[0,[10,0]],[[1,1,8,10],9,1,[7,6]],4]]
        )
    end
end
