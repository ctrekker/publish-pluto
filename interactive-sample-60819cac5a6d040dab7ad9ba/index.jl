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

# ╔═╡ 853fcb82-4a03-11eb-2200-950a9787a807
using Plots

# ╔═╡ 1b6c9e80-4a04-11eb-1926-699fb6519146
@bind ϕ html"<input type='range' min='0' max='6.28' step='0.1'/>"

# ╔═╡ 900bf740-4a04-11eb-176c-b500c66ba272
md"### ϕ = $(ϕ)"

# ╔═╡ cb4583e0-4a03-11eb-1fe7-b76a3251697f
r = 0:0.1:4π

# ╔═╡ e36a6490-4a03-11eb-02a1-c1241f9c8aa7
y1(x) = sin(x)

# ╔═╡ e8c209c0-4a03-11eb-364f-7d992795e3c7
y2(x) = sin(x + ϕ)

# ╔═╡ 87183500-4a03-11eb-39b6-c7c23f031565
plot(r, [y1, y2, (x) -> y1(x) + y2(x)], labels=["y1" "y2" "sum"], ylims=(-2, 2))

# ╔═╡ Cell order:
# ╟─900bf740-4a04-11eb-176c-b500c66ba272
# ╟─1b6c9e80-4a04-11eb-1926-699fb6519146
# ╠═87183500-4a03-11eb-39b6-c7c23f031565
# ╠═853fcb82-4a03-11eb-2200-950a9787a807
# ╠═cb4583e0-4a03-11eb-1fe7-b76a3251697f
# ╠═e36a6490-4a03-11eb-02a1-c1241f9c8aa7
# ╠═e8c209c0-4a03-11eb-364f-7d992795e3c7
