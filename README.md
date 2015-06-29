# LCS.jl

##### A Julia package for finding longest common and longest contiguous subsequences

[![Build Status](https://travis-ci.org/WestleyArgentum/LCS.jl.svg?branch=master)](https://travis-ci.org/WestleyArgentum/LCS.jl)

## Quickstart

```julia
julia> Pkg.add("LCS")

julia> using LCS

julia> a = "abc-abc----"; b = "___ab_c__abc";

julia> seq, a_range, b_range = longest_common_subsequence(a, b)
("abcabc",1:7,4:12)

julia> a[a_range]
"abc-abc"

julia> b[b_range]
"ab_c__abc"

julia> seq, a_range, b_range = longest_contiguous_subsequence(a, b)
("abc",1:3,10:12)

julia> a[a_range]
"abc"

julia> b[b_range]
"abc"

```
