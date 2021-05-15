### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ 31861ed0-7fba-11eb-14d3-1f61b9b27e66
using Plots

# ╔═╡ 3faa6980-7fab-11eb-2bab-cb2ce673c4e5
begin
	abs(v::Vector) = √(sum(v .^ 2))
	unit(v::Vector) = v ./ abs(v)
	
	nothing
end

# ╔═╡ dbf03d40-7fa8-11eb-19f9-17af6c38d69c
md"# Unit 1: Charged Particles and Electric Fields"

# ╔═╡ fcb13fbe-7fa8-11eb-3a5b-a1e5f2a4ae7f
md"## Coulomb's Law"

# ╔═╡ 1019d0e0-7fa9-11eb-066d-b9483c95aaa9
md"
Given two charged particles, Q and q, separated by distance R, the force on q (the victim) by Q (the agent) is given by Coulomb's law:

$$F_{Q on q}=\frac{kqQ}{R^2}$$

_$k$ is a constant_

Due to Newton's 3rd law:

$$F_{Q on q}=F_{q on Q}=\frac{kqQ}{R^2}$$

$$\overrightarrow{F_{Q on q}}=\frac{kqQ}{R^2}\hat{R}$$

 $\hat{R}$ is a unit vector that points from q to Q


"

# ╔═╡ 5aa5b830-7faa-11eb-08c2-67a2454cebd5
md"
1 Coloumb = $6.25×10^{18}$ electron charges

$∴k=9×10^9 \frac{Nm^2}{c^2}$

Coloumb's law can also be written as:

$\overrightarrow{F}=\frac{1}{4πϵ_0}\frac{qQ}{R^2}\hat{R}$

$ϵ_0=\frac{1}{4πk}$
"

# ╔═╡ fef1f60e-7faa-11eb-2f7e-efd115bf7f6d
md"### Practice"

# ╔═╡ 149471a0-7fab-11eb-24a1-3d2df893cdbf
k = 9 * 10^9

# ╔═╡ 03eef820-7fab-11eb-1943-b1c5d9c6303d
F_Qonq(q, Q, R::Vector) = ((k * q * Q) / abs(R)) * unit(R)

# ╔═╡ 7c13a710-7fab-11eb-21c4-e7e3b25f10ce
md"Example A:"

# ╔═╡ c9df4580-7fab-11eb-05a7-91bba9f31163
md"## The Electric Field"

# ╔═╡ cf4df51e-7fab-11eb-258b-55d162d65ab2
md"
**Electric Field (Intensity)**: Force per unit of charge

$\overrightarrow{E_p}=\frac{\overrightarrow{F_{Q on q}}}{q}=\frac{kQ}{R^2}\hat{R}$

Example: Suppose $Q=+1μC$, and from $Q$ to $p$ is 1 mm.

$\overrightarrow{E_p}=\frac{k*10^{-6}}{0.001^2}$
"

# ╔═╡ a4ed9c30-7fac-11eb-252c-09acaa46b70f
Ep = (k * 10^-6)/(0.001^2)

# ╔═╡ dcf04b50-7fac-11eb-3b60-9f6d34fc536f
F2μC = Ep * 2 * 10^-6

# ╔═╡ 4c102b90-7fad-11eb-13b7-1738e04b7f80
md"
Positive field lines point away, negative field lines point in

**Finding total charge**:
$$\overrightarrow{E}_{total}=\overrightarrow{E}_1+\overrightarrow{E}_2+\overrightarrow{E}_3+...+\overrightarrow{E}_n=\sum^{n}_{i=1}{\overrightarrow{E}_i}$$

**Finding work**:
$$W_{A→B}=\int_A^B \overrightarrow{F}ds=q\int_A^B \overrightarrow{E}ds$$

Since $E$ is conservative...
$$W_{A→B}=ΔU=U_B-U_A=kQq\left(\frac{1}{R_B}-\frac{1}{R_A}\right)$$

**Electric Potential**:
$$U_R=\frac{kQq}{R}=\frac{Qq}{4πϵ_0R}$$
"

# ╔═╡ a837a0a0-7fb8-11eb-1a59-fde10df51cda
md"## Simulation!"

# ╔═╡ 27bc6ef0-7fb9-11eb-1c99-2106e4f88bad
struct PointCharge
	position::Vector{Float64}
	velocity::Vector{Float64}
	q::Float64
	mass::Float64
end

# ╔═╡ ae187300-7fb8-11eb-3ef5-af518c4e8029
begin
	dt = 0.001
	steps = 100000
	Qs = [PointCharge([0, 0], [0, 0], 1e-5, 1.)]
	P = [PointCharge([0.5, 0.], [0., 0.025], -1e-7, 1.)]
	
	for step ∈ 1:steps
		Pf = P[end]
		Fnet = sum((Q -> F_Qonq(Pf.q, Q.q, Pf.position .- Q.position)).(Qs))
		v = Pf.velocity .+ (Fnet ./ Pf.mass) .* dt
		push!(P, PointCharge(Pf.position .+ v * dt, v, Pf.q, Pf.mass))
	end
	P
end

# ╔═╡ 47d29600-7fba-11eb-2f14-db9d09ab7a84
plot((x -> x.position[1]).(P), (x -> x.position[2]).(P))

# ╔═╡ 343be8a0-7fbd-11eb-274e-ed3d463f407b
inv_square = [(k*Qs[1].q)/abs([x, y]) for x ∈ -0.5:0.1:0.5, y ∈ -0.5:0.1:0.5]

# ╔═╡ e4b6b350-7fbc-11eb-1ff4-f377639b6fca
heatmap(inv_square)

# ╔═╡ Cell order:
# ╟─3faa6980-7fab-11eb-2bab-cb2ce673c4e5
# ╟─dbf03d40-7fa8-11eb-19f9-17af6c38d69c
# ╟─fcb13fbe-7fa8-11eb-3a5b-a1e5f2a4ae7f
# ╟─1019d0e0-7fa9-11eb-066d-b9483c95aaa9
# ╟─5aa5b830-7faa-11eb-08c2-67a2454cebd5
# ╟─fef1f60e-7faa-11eb-2f7e-efd115bf7f6d
# ╠═149471a0-7fab-11eb-24a1-3d2df893cdbf
# ╠═03eef820-7fab-11eb-1943-b1c5d9c6303d
# ╟─7c13a710-7fab-11eb-21c4-e7e3b25f10ce
# ╟─c9df4580-7fab-11eb-05a7-91bba9f31163
# ╟─cf4df51e-7fab-11eb-258b-55d162d65ab2
# ╠═a4ed9c30-7fac-11eb-252c-09acaa46b70f
# ╠═dcf04b50-7fac-11eb-3b60-9f6d34fc536f
# ╟─4c102b90-7fad-11eb-13b7-1738e04b7f80
# ╟─a837a0a0-7fb8-11eb-1a59-fde10df51cda
# ╠═27bc6ef0-7fb9-11eb-1c99-2106e4f88bad
# ╠═ae187300-7fb8-11eb-3ef5-af518c4e8029
# ╠═31861ed0-7fba-11eb-14d3-1f61b9b27e66
# ╠═47d29600-7fba-11eb-2f14-db9d09ab7a84
# ╠═343be8a0-7fbd-11eb-274e-ed3d463f407b
# ╠═e4b6b350-7fbc-11eb-1ff4-f377639b6fca
