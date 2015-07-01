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
