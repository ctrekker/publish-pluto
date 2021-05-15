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

# ╔═╡ 03106db5-0388-4fae-a0af-66beb98b6705
begin
	using Plots, PlutoUI, HypertextLiteral
end

# ╔═╡ db705c81-6f66-4145-8d4c-0a42d85d1088
md"# Electric Potential"

# ╔═╡ 09c0f180-13d8-4637-a847-85339703857c
md"Electric potential allows one to easily calculate the work done by the electric field without having to perform path integrals. This works because the electric field is *conservative*"

# ╔═╡ 3119d52e-22a0-422f-a931-1806c9826ca6
md"""
## Work
$W=F\times d$
$W=Fdcos(θ)$

In the case of gravity, gravitational potential is defined as the amount of work per unit of mass required to move a test mass from infinity to the corresponding position. Electric potential is analogous.

Reminder that...

$F_E=\frac{kqQ}{R^2}$
"""

# ╔═╡ 92616f1f-f06b-4a34-949b-079cc7415949
md"""
## Electric Potential (Voltage)
Symbol for electric potential is $V$

$\Delta V=V_b-V_a=\frac{W_{a\rightarrow b}}{q}=\frac{\Delta U_{ab}}{q}$
$\Delta U_{ab}=W_{a\rightarrow b}=q\Delta V_{ab}$

Where $a$ and $b$ are points somewhere in the electric field.

1 Volt = 1 J/C

$V=\frac{kQ}{R}=\frac{1}{4\pi \epsilon_0}\frac{Q}{R}$
"""

# ╔═╡ 028f46fd-8935-422f-9cc3-9d189a4f0bda
md"### Single Point Charge"

# ╔═╡ 41287741-2d9f-4279-b443-68100d87d7cf
scale = -1:0.01:1

# ╔═╡ d9ce34ab-9296-40ec-afbe-690b7a1c932f
md"Note that this is actually the base 10 log of the field potential, since otherwise contour freaks out around the pole at 0, 0"

# ╔═╡ d3e02d61-4bec-4f65-8090-8ef7a8e0fb1c
md"### Two Point Charges"

# ╔═╡ a373637b-2a8c-492e-bea1-5791e646144c
@bind reset Button("Reset")

# ╔═╡ 5ec8ac7e-b461-4380-b60c-7f6782c2e484
@htl("""
<!-- $(reset) -->
<div>
	<div>
	$(html"$q_1$") = $(@bind q1 Slider(-1:0.01:1; default=1))
	<br/>
	$(html"$q_2$") = $(@bind q2 Slider(-1:0.01:1; default=1))
	</div>
</div>
""")

# ╔═╡ 09a00d13-d96a-479f-a2cb-523b6d259b3c
@htl("""
<!-- $(reset) -->
<div style="display: flex">
	<div>
	$(html"$x_1$") = $(@bind x1 Slider(-1:0.01:1; default=0.35))
	<br/>
	$(html"$y_1$") = $(@bind y1 Slider(-1:0.01:1; default=0.35))
	</div>
	<div>
	$(html"$x_2$") = $(@bind x2 Slider(-1:0.01:1; default=-0.35))
	<br/>
	$(html"$y_2$") = $(@bind y2 Slider(-1:0.01:1; default=-0.35))
	</div>
</div>

""")

# ╔═╡ c7762535-32df-4659-a717-947c099984ff
@htl("""
Values:<br/>
$(html"$q_1$") = $(q1)
<br/>
$(html"$q_2$") = $(q2)
<br/><br/>
<div style="display: flex">
	<div style="margin-right: 20px">
		$(html"$x_1$") = $(x1)
	<br/>
		$(html"$y_1$") = $(y1)
	</div>
	<div>
		$(html"$x_2$") = $(x2)
	<br/>
		$(html"$y_2$") = $(y2)
	</div>
</div>
""")

# ╔═╡ 469149ea-c47d-43a4-87ff-35da749c821e
md"### Uniformly-Charged Loop (along axis)"

# ╔═╡ 9dd8082a-5f8d-4c01-89b8-c058ea0f4ec7
md"""
#### Derivation (ew)
$\lambda=\frac{Q}{2\pi R}$
$dQ=\lambda ds$
$V_p=k\int{\frac{dQ}{D}}$
$V_p=k\int{\frac{\lambda}{D}ds}$
$ds=d\theta$
$V_p=k\int_{0}^{2\pi}{\frac{\lambda}{D}d\theta}$
$V_p=k\left[\frac{\lambda\theta}{D}\right]_{0}^{2\pi}$
$V_p=k\frac{2\pi R\lambda}{D}$
$D=\sqrt{x^2+R^2}$
$V_p=\frac{kQ}{\sqrt{x^2+R^2}}$
"""

# ╔═╡ 12e7f1aa-b402-4f2f-a347-6a812aed8391
md"#### Trying it out"

# ╔═╡ ce741f1b-931b-40c3-95ba-d78964f5b66e
@bind Rp Slider(0.1:0.1:5; default=0.1)

# ╔═╡ 0bcf0c1d-1616-42ef-8c87-11b0fc856add
Rp

# ╔═╡ b2f9ce71-ed87-490c-b1d9-881074e5c991
md"""
### Surfaces!
* Electric potential along surface of conductor is always the same ($dV=0$)
* Also means, because of Gauss' Law, all points inside surface are same potential
#### Potential inside of a sphere
$V_0=-\int_{\infty}^{r}{\overrightarrow{E}\cdot d\overrightarrow{s}}=\int_{\infty}^{r}{Eds}=kQ\int_{\infty}^{r}{\frac{1}{r^2}ds}=\frac{kQ}{r}$
"""

# ╔═╡ e44a28ff-e080-4593-8ce4-9a9da6feb0ea
md"## Constant Definitions"

# ╔═╡ 1d458a20-a21d-11eb-1d58-85a07a30c711
k = 9 * 10^9

# ╔═╡ 816c58cc-938c-46a2-8af6-2ed46e5cf21e
V(Q, x, y) = (k * Q) / √(x^2 + y^2)

# ╔═╡ b33b55f6-bfb7-4626-a6ff-dcc110bcc940
contour(scale, scale, (x, y) -> log10(V(1e-10, x, y)))

# ╔═╡ 8dd947e4-dc78-47d9-86e7-75d86a4fad3c
contour(scale, scale, (x, y) -> log10(abs(V(q1/k, x-x1, y-y1) + V(q2/k, x-x2, y-y2))))

# ╔═╡ 2ad2a82c-177f-4e09-a2be-43af361b037c
Vp(Q, R, x) = (k * Q) / √(x^2 + R^2)

# ╔═╡ dbd00d43-5f9c-4b6e-b94e-58f4db380f48
plot(scale, [Vp(1/k, Rp, xp) for xp ∈ scale])

# ╔═╡ Cell order:
# ╟─db705c81-6f66-4145-8d4c-0a42d85d1088
# ╟─09c0f180-13d8-4637-a847-85339703857c
# ╟─3119d52e-22a0-422f-a931-1806c9826ca6
# ╟─92616f1f-f06b-4a34-949b-079cc7415949
# ╠═816c58cc-938c-46a2-8af6-2ed46e5cf21e
# ╟─028f46fd-8935-422f-9cc3-9d189a4f0bda
# ╠═41287741-2d9f-4279-b443-68100d87d7cf
# ╠═b33b55f6-bfb7-4626-a6ff-dcc110bcc940
# ╟─d9ce34ab-9296-40ec-afbe-690b7a1c932f
# ╟─d3e02d61-4bec-4f65-8090-8ef7a8e0fb1c
# ╟─5ec8ac7e-b461-4380-b60c-7f6782c2e484
# ╟─09a00d13-d96a-479f-a2cb-523b6d259b3c
# ╟─a373637b-2a8c-492e-bea1-5791e646144c
# ╟─c7762535-32df-4659-a717-947c099984ff
# ╠═8dd947e4-dc78-47d9-86e7-75d86a4fad3c
# ╟─469149ea-c47d-43a4-87ff-35da749c821e
# ╟─9dd8082a-5f8d-4c01-89b8-c058ea0f4ec7
# ╟─12e7f1aa-b402-4f2f-a347-6a812aed8391
# ╠═2ad2a82c-177f-4e09-a2be-43af361b037c
# ╟─0bcf0c1d-1616-42ef-8c87-11b0fc856add
# ╠═ce741f1b-931b-40c3-95ba-d78964f5b66e
# ╠═dbd00d43-5f9c-4b6e-b94e-58f4db380f48
# ╟─b2f9ce71-ed87-490c-b1d9-881074e5c991
# ╟─e44a28ff-e080-4593-8ce4-9a9da6feb0ea
# ╠═03106db5-0388-4fae-a0af-66beb98b6705
# ╠═1d458a20-a21d-11eb-1d58-85a07a30c711
