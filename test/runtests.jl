using Subsequences
using Base.Test

a = "abc"
b = "abc"
seq, a_range, b_range = longest_common_subsequence(a, b)
@test seq == "abc"
@test a_range == b_range == 1:3

a = "-abc-"
b = "_abc_"
seq, a_range, b_range = longest_common_subsequence(a, b)
@test seq == "abc"
@test a_range == b_range == 2:4

a = "abc-abc----"
b = "___ab_c__a_bc"
seq, a_range, b_range = longest_common_subsequence(a, b)
@test seq == "abcabc"
@test a_range == 1:7
@test b_range == 4:13

# Test for type-stability with identical element types
a = [:v, :x, :x, :y, :x, :z, :y, :z]
b = [:x, :z, :x, :y]
@inferred longest_common_subsequence(a, b)
seq, a_range, b_range = longest_common_subsequence(a, b)
@test seq == [:x, :x, :y]
@test typeof(seq) == Vector{Symbol}
@test a_range == 2:4
@test b_range == 1:4

# Test type-stability for different element types
a = [1.0, 2.0, 3.0, 4.0]
b = [1, 3]
@inferred longest_common_subsequence(a, b)
seq, a_range, b_range = longest_common_subsequence(a, b)
@test typeof(seq) == Vector{promote_type(Float64, Int)}
@test seq == [1.0, 3.0]

# -------

a = "abc"
b = "abc"
seq, a_range, b_range = longest_contiguous_subsequence(a, b)
@test a_range == b_range == 1:3

a = "-abc-"
b = "_abc_"
seq, a_range, b_range = longest_contiguous_subsequence(a, b)
@test seq == "abc"
@test a_range == b_range == 2:4

a = "abc-abc----"
b = "___ab_c__abc"
seq, a_range, b_range = longest_contiguous_subsequence(a, b)
@test seq == "abc"
@test a_range == 1:3
@test b_range == 10:12
