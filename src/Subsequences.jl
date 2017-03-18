module Subsequences

export longest_common_subsequence, longest_contiguous_subsequence

# -------

function longest_common_subsequence(a, b; result_base = "", join_fn = string)
    longest_common_subsequence(a, b, result_base, join_fn)
end

function longest_common_subsequence{T}(a, b, result_base::T, join_fn)
    lengths = zeros(length(a) + 1, length(b) + 1)

    for i in 1:length(a)
        ai = a[i]
        for j in 1:length(b)
            if ai == b[j]
                lengths[i+1, j+1] = lengths[i, j] + 1
            else
                lengths[i+1, j+1] = max(lengths[i+1, j], lengths[i, j+1])
            end
        end
    end

    x, y = length(a) + 1, length(b) + 1
    result::T = result_base
    a_start, a_end = 0, 0
    b_start, b_end = 0, 0

    while x != 1 && y != 1
        if lengths[x, y] == lengths[x-1, y]
            x -= 1
        elseif lengths[x, y] == lengths[x, y-1]
            y -= 1
        else
            result = join_fn(a[x-1], result)

            a_start = x - 1
            b_start = y - 1

            if (a_end == 0)
                a_end = x - 1
                b_end = y - 1
            end

            x -= 1
            y -= 1
        end
    end

    result, a_start:a_end, b_start:b_end
end

# In julia < v0.6, the return type of vcat(x::T, v::Vector{T}) is not
# inferred correctly, so we explicitly construct [x] before calling
# Base.vcat
prepend{T}(x::T, v::AbstractVector{T}) = vcat([x], v)

longest_common_subsequence{T1, T2}(a::Array{T1}, b::Array{T2}) = longest_common_subsequence(a, b, promote_type(T1, T2)[], prepend)

# -------

function longest_contiguous_subsequence(a, b)
    m = zeros(Int, length(a) + 1, length(b) + 1)
    longest, x_longest, y_longest = 0, 0, 0

    for x in 2:(length(a) + 1)
        for y in 2:(length(b) + 1)

            if a[x - 1] == b[y - 1]
                m[x, y] = m[x - 1, y - 1] + 1

                if m[x, y] > longest
                    longest = m[x, y]
                    x_longest = x
                    y_longest = y
                end
            else
                m[x, y] = 0
            end

        end
    end

    a_range = (x_longest - longest):(x_longest - 1)
    b_range = (y_longest - longest):(y_longest - 1)
    a[a_range], a_range, b_range
end

end
