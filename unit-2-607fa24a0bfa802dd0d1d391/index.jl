### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ a0602d4f-221b-4bfb-8993-b47c3f9f7fd5
begin
	using Plots
end

# ╔═╡ 6dabd1c0-9e19-11eb-203f-95cf2f900097
md"
# Electrostatic Fields and Gauss' Law
"

# ╔═╡ d8d970cc-c7b4-48cf-862c-b602fda805d0
md"
## Electric Fields of Non-Point Objects
"

# ╔═╡ 2fd45247-86dd-46fe-a81c-f67342b01544
md"
Firstly, electric field calculations for non-point charges:

$$\overrightarrow{E_p}=k\int{\frac{dq}{R^2}\hat{R}}$$
"

# ╔═╡ 4d207227-e57a-45c2-98bb-e6c1385c1b66
md"
### Uniformly charged wire
"

# ╔═╡ 7b2bbe49-2972-4513-812e-f30dce3533bc
md"
#### Infinite / straight"

# ╔═╡ 2ff9f39c-d0b4-4a05-bf3e-050cd1e24e4d
md"
Through a somewhat lengthy derivation using the above formula we come to the answer

$$\overrightarrow{E}=\frac{2k\lambda}{D}\hat{D}=\frac{2\lambda}{2\piϵ_0D}\hat{D}$$

From the equation it can be seen that E is directed *away* from the wire when λ is +, and the opposite when it is -.
"

# ╔═╡ 8dbeb54b-eb09-44e0-bb58-0087e06ea272
md"
#### Loop on same axis
"

# ╔═╡ 5c63a589-c167-47bb-aaac-5723b3fabf57
md"
* λ is the amount of charge per unit of length
* x is the distance from point P to the center of the wire loop
* R is the radius of the wire loop
* î is the unit vector normal to the nearest point on the circle (parallel to direction of x
$$\overrightarrow{E}=\frac{2πkλxR}{\left(x^2+R^2\right)^\frac{3}{2}}\hat{i}=\frac{λxR}{2ϵ_0\left(x^2+R^2\right)^\frac{3}{2}}\hat{i}$$
"

# ╔═╡ dc217341-c1f2-4c2c-ba30-fe4743257352
md"#### Disk on same axis"

# ╔═╡ 67525bef-c5bc-4fae-b0fe-75896669176b
md"
* σ is the charge per unit of area, meaning $σ=\frac{Q}{πR^2}$
* Other variables are same as for loop

$$\overrightarrow{E}=2πkσ\left[1-\frac{x}{\sqrt{x^2+R^2}}\right]\hat{i}$$
"

# ╔═╡ c08f1212-1517-4ad1-b69e-41284c2a711e
md"
## Flux
Flux is the amount of a vector quantity passing through an area, meaning it depends on three things:
1. magnitude of the vector field
2. the area of \"patch\"
3. orientation fo vector field relative to the area

$\phi_v=|\overrightarrow{v}||\overrightarrow{A}|cos(\theta)=\overrightarrow{v}\cdot\overrightarrow{A}$

* Flux is always 0 for a surface if a charge is located outside of it
* Flux is non-0 if a charge is located inside a surface (Always $4πkQ$)
"

# ╔═╡ 7e90b010-f7c9-46f9-97e8-29162f10ab2a
md"## Gauss' Law"

# ╔═╡ 0d5165b3-1bd6-432d-a7ed-638cc6f0dc39
md"
$$\phi_E=\oint{\overrightarrow{E}\cdot d\overrightarrow{A}}=4πkQ_{total}=\frac{Q_{total}}{\epsilon_0}$$

This allows us to derive what was derived earlier (wire, hoop, etc) without dealing with nasty integrals!
"

# ╔═╡ f310dc05-0440-4da7-b6f4-fa0ff23d627f
md"## Constant Definitions"

# ╔═╡ db910562-43bd-4adc-83b8-5783e84ffb03
k = 9 * 10^9

# ╔═╡ 03c11054-ec7b-4171-a6df-21e7dc2d8c63
line_E(λ, D) = (2 * k * λ) / abs(D)

# ╔═╡ 13528c3e-7db5-4181-89c2-7328f52d3c05
heatmap(-10:10, -10:10, (x, y) -> line_E(1e-8, y))

# ╔═╡ edeb7a59-883e-450a-8c73-a6ae1c60fc54
loop_E(λ, R, x, y) = (2 * π * k * λ * √(x ^ 2 + y ^ 2) * R) / ((x ^ 2 + y ^ 2 + R ^ 2) ^ (3/2))

# ╔═╡ d65474a5-183e-4a85-8295-4e76656471a2
heatmap(-10:10, -10:10, (x, y) -> loop_E(1e-8, 3, x, y))

# ╔═╡ 78867934-cc87-400a-a17d-f748afa53d77
disk_E(σ, R, x, y) = (2 * π * k * σ) * (1 - (√(x^2 + y^2) / √(x^2 + y^2 + R^2)))

# ╔═╡ 9ec30d32-3cc1-45c2-b866-7bcde11840d4
heatmap(-10:10, -10:10, (x, y) -> disk_E(1e-8, 5, x, y))

# ╔═╡ Cell order:
# ╟─6dabd1c0-9e19-11eb-203f-95cf2f900097
# ╟─d8d970cc-c7b4-48cf-862c-b602fda805d0
# ╟─2fd45247-86dd-46fe-a81c-f67342b01544
# ╟─4d207227-e57a-45c2-98bb-e6c1385c1b66
# ╟─7b2bbe49-2972-4513-812e-f30dce3533bc
# ╟─2ff9f39c-d0b4-4a05-bf3e-050cd1e24e4d
# ╠═03c11054-ec7b-4171-a6df-21e7dc2d8c63
# ╠═13528c3e-7db5-4181-89c2-7328f52d3c05
# ╟─8dbeb54b-eb09-44e0-bb58-0087e06ea272
# ╟─5c63a589-c167-47bb-aaac-5723b3fabf57
# ╠═edeb7a59-883e-450a-8c73-a6ae1c60fc54
# ╠═d65474a5-183e-4a85-8295-4e76656471a2
# ╟─dc217341-c1f2-4c2c-ba30-fe4743257352
# ╟─67525bef-c5bc-4fae-b0fe-75896669176b
# ╠═78867934-cc87-400a-a17d-f748afa53d77
# ╠═9ec30d32-3cc1-45c2-b866-7bcde11840d4
# ╟─c08f1212-1517-4ad1-b69e-41284c2a711e
# ╟─7e90b010-f7c9-46f9-97e8-29162f10ab2a
# ╟─0d5165b3-1bd6-432d-a7ed-638cc6f0dc39
# ╟─f310dc05-0440-4da7-b6f4-fa0ff23d627f
# ╠═a0602d4f-221b-4bfb-8993-b47c3f9f7fd5
# ╠═db910562-43bd-4adc-83b8-5783e84ffb03
