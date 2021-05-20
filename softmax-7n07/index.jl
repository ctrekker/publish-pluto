### A Pluto.jl notebook ###
# v0.14.2

using Markdown
using InteractiveUtils

# ╔═╡ 773f9a96-5213-420e-9693-7ed71aab081c
md"""
**Hello there! This is an implementation of the softmax function!**
"""

# ╔═╡ 66e81d50-ae1b-11eb-1087-85fe0da078db
σ(z) = [exp(zi)/sum(exp.(z)) for zi ∈ z]

# ╔═╡ 903cf78c-209e-4558-8f9d-9fa43ae260d3
z = [0., 0., 0.]

# ╔═╡ 4869315a-67cb-4240-980e-cd12b8e1298b
dist = σ(z)

# ╔═╡ Cell order:
# ╟─773f9a96-5213-420e-9693-7ed71aab081c
# ╠═66e81d50-ae1b-11eb-1087-85fe0da078db
# ╠═903cf78c-209e-4558-8f9d-9fa43ae260d3
# ╠═4869315a-67cb-4240-980e-cd12b8e1298b
