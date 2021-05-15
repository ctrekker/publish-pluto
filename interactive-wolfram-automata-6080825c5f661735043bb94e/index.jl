### A Pluto.jl notebook ###
# v0.14.2

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 7f4d35df-cbe5-43ca-8938-54cdd4c3a15f
begin
	using Images
	using PlutoUI
	using HypertextLiteral
end

# ╔═╡ 12b85af0-a0a2-11eb-0ae8-a30a12eecb9b
md"""
# Interactive Wolfram Automata
"""

# ╔═╡ 22a26ba1-c0aa-4406-a5b0-fb4a63945d45
@htl("""
Rule: $(@bind rule NumberField(0:255; default=30)) 
<br/>
Steps: $(@bind steps Slider(5:500; default=5))
""")

# ╔═╡ 1db39d44-2526-491e-a359-3965474de850
@htl("Viewing $(steps) steps")

# ╔═╡ 35cb644a-c9c9-4abc-9998-25e73af2f337
@htl("""<div style="height: 600px"/>""")

# ╔═╡ 6c0a23e9-a91f-4abb-838c-79f4649d6c53
md"## Inner workings"

# ╔═╡ d479e307-7ed4-436b-bab3-956230ce97a0
to_rule_map(rule::Int) = to_rule_map(UInt8(rule))

# ╔═╡ 94627199-45b0-4505-b795-a21414a4500f
to_rule_map(rule::UInt8) = Dict([i => rule >> i & 1 for i ∈ 0:7])

# ╔═╡ 6f1f5266-75cd-41b4-91d1-f9ab1da335dc
to_rule_map(30)

# ╔═╡ e01a0d37-6d30-45a2-b4d6-ccdd9bcf80ac
function generate_history(rule::Int, steps::Int)
	rule_map = to_rule_map(rule)
	
	history = zeros(Bool, steps, steps*2+1)
	history[1, steps+1] = 1
	
	for step ∈ 2:(steps)
		for col ∈ (steps+2-step):(steps+step)
			history[step, col] = rule_map[history[step-1, col-1] << 2 | history[step-1, col] << 1 | history[step-1, col+1]]
		end
	end
	
	history
end

# ╔═╡ 6f92e305-84b5-4c5d-910e-bc0f16ef0056
function render_history(history)
	Gray.(1 .- history)
end

# ╔═╡ 9223bb3c-8df3-46d3-9b75-bbc73459f052
render_history(generate_history(rule, steps))

# ╔═╡ Cell order:
# ╟─12b85af0-a0a2-11eb-0ae8-a30a12eecb9b
# ╟─22a26ba1-c0aa-4406-a5b0-fb4a63945d45
# ╟─1db39d44-2526-491e-a359-3965474de850
# ╟─9223bb3c-8df3-46d3-9b75-bbc73459f052
# ╟─35cb644a-c9c9-4abc-9998-25e73af2f337
# ╟─6c0a23e9-a91f-4abb-838c-79f4649d6c53
# ╠═d479e307-7ed4-436b-bab3-956230ce97a0
# ╠═94627199-45b0-4505-b795-a21414a4500f
# ╠═6f1f5266-75cd-41b4-91d1-f9ab1da335dc
# ╠═e01a0d37-6d30-45a2-b4d6-ccdd9bcf80ac
# ╠═6f92e305-84b5-4c5d-910e-bc0f16ef0056
# ╠═7f4d35df-cbe5-43ca-8938-54cdd4c3a15f
