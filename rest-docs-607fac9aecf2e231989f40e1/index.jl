### A Pluto.jl notebook ###
# v0.14.3

using Markdown
using InteractiveUtils

# ╔═╡ f91fe30b-41f7-41e7-ad0e-1b66b121f3af
md"""
# "What you see is what you REST"
Welcome to Pluto's "What you see is what you REST" documentation! Firstly I encourage you to run this notebook locally, as many of the examples will interface with this notebook through WYSIWYR.
"""

# ╔═╡ 71facfd1-9b26-40c0-9b85-7549776d7e2e
md"## Getting notebook variables"

# ╔═╡ ba042091-5391-4cc9-8548-9fc4d40ce957
md"The simplest function of WYSIWYR is to allow other code to get the value of variables. For instance, we can get the value of any of the three variables defined below directly from the Julia REPL."

# ╔═╡ 73ac88be-557d-4f3f-bfb8-cddb20731eaa
a, b = 3., 4.

# ╔═╡ a9bfbbb7-eccf-4f73-b937-80ad87bec399
c = √(a^2 + b^2)

# ╔═╡ b06ba2bb-14e0-42fa-9f4c-4cd0f3de5645
md"""
Try getting the value of `c` from your Julia REPL with the following:
```julia
using Pluto  # notice we use pluto instead of importing it
notebook = PlutoNotebook("REST Docs.jl")
@info notebook.c
```
After a momentary precompilation delay, your REPL (or console) should output `[ Info: 5.0`. Try changing the values of `a` and `b` in this notebook and see how the output changes to match `c`'s new value after rerunning the code above.

**Note**: From here on out the `using Pluto` statement will be implicit.
"""

# ╔═╡ 4f760505-f9ae-4e88-ac95-f2cf3ab4a2f1
md"""
#### TL;DR
* Notebook variables are accessible *outside* your notebook
"""

# ╔═╡ b7e4b203-740c-4651-b829-95efe0da9dcd
md"## Getting notebook variables *reactively*"

# ╔═╡ 3b055f61-cea3-493f-bd26-6e3115cd4d4a
md"""
Just as we can see the value of variables from other places besides the notebook it was defined in now, we can also see what the value of a variable *would be* if other variables had different values. For example, we could find the value of `c` *if* `a` were equal to some other value instead, say $10.0$. Of course, you could update the cell above containing the definition for `a` and `b` manually and see that $c\approx 10.77$, but the point of WYSIWYR is doing a similar thing *programmatically*, without touching the state of your notebook. To do this there is a particular syntax which is similar to getting a variable normally.
"""

# ╔═╡ 9dfff6ad-65b3-49d3-9449-c7591489de70
md"""
```julia
notebook = PlutoNotebook("REST Docs.jl")
notebook.c  # gets the value of c as-is
notebook(; a=10.0).c  # gets the value of c as if a = 10.0
notebook(; a=5.0, b=12.0).c  # gets the value of c as if a = 5 and b = 12
```
"""

# ╔═╡ 551f7f2e-3dc9-420c-a8d2-8ba8b367cc50
md"""
Try it out for yourself! `notebook(; a=10.0).c` should yield a value around $10.77$ without touching the cells above that define `a`, `b`, and `c`.

Notice that to evaluate a hypothetical scenario, we call our notebook as a function and provide to it keyword arguments which represent the variables we want to change. Then we use the same dot syntax on the result to get the associated value of `c`. Also note that any number of keyword arguments can be provided.
"""

# ╔═╡ 748c733d-7ccb-41e5-bdec-977460662035
md"""
#### TL;DR
* Notebook state cannot be modified from outside the notebook
* Instead, evaluate what a variable *would be* if the state of other variables were different
* Call a notebook reference as a function with keyword arguments to evaluate hypothetical variable states
"""

# ╔═╡ d2eaba4e-e595-498f-9133-a392328a1b40
md"## Calling functions inside notebooks"

# ╔═╡ 9c41d187-d937-4bb4-b19b-cfe493147f1f
md"""
Along with getting the values of variables from places outside the notebook they are defined in, WYSIWYR also provides a function call feature. Let's quickly illustrate the necessity of this feature with an example.

Consider a distance function which is defined below.
"""

# ╔═╡ 705411f1-45c1-41af-b7da-3765a63e4c6b
distance(x...) = √(sum(x .^ 2))

# ╔═╡ b263577b-5194-45d4-951a-ba428e692d41
md"""
Given any non-zero number of arguments it will return the (euclidean) distance from that point to the origin. For example...
"""

# ╔═╡ 51bfdefe-5a67-4083-bf1d-eca10767a684
distance(a, b), c

# ╔═╡ cfb85a78-90bc-4e84-964d-21e82dec5363
md"""
But what if we want to get this function in a similar manner to how we got the value of variables earlier? Well, let's see what happens if we try.
```julia
julia> notebook.distance
Pluto.PlutoCallable(PlutoNotebook("localhost:1234", "REST Docs.jl"), :distance)
```
"""

# ╔═╡ 77f122b5-08de-4ff7-b3fd-1d14c031c9c9
md"""
Woah... That's certainly not our function, so what is it? For reasons largely outside the scope of this documentation, functions are extremely difficult, if not downright impossible, to send to other locations outside of where they are defined. WYSIWYR uses HTTP requests to transport information to and from your Pluto notebook, and sending working code live over a network connection is difficult (but not impossible for Pluto—more on that later).

The way WYSIWYR addresses this problem without completely blocking functions out is by calling the function from *within* your notebook, trusting that it will return a value that *can* be passed back over HTTP to wherever the function was originally called. When we tried to access the value of `notebook.distance`, instead of getting back our function we got back a wacky structure that just contains our notebook and a symbol. Similarly to how `PlutoNotebook` operates, `PlutoCallable` simply stores a reference to the function rather than the function itself. This way we can call it as if it were a function defined locally, even though it's actually only defined on the notebook. This idea is best illustrated with an example.
"""

# ╔═╡ 198c3384-6ac4-4fa0-8bef-50ff73abf530
md"""
```julia
notebook.distance(3, 4)
# returns "5.0"

notebook.distance(5, 12)
# returns "13.0"

notebook.distance(3, 4, 12)
# returns "13.0"
```
"""

# ╔═╡ 92a036c1-d51c-4400-b5d3-a11c3b5ba300
md"""
#### TL;DR
* Julia functions cannot easily be sent over WYSIWYR like numbers or vectors can
* WYSIWYR addresses this with `PlutoCallable`, a way to call function on the notebook process and send back the result
* The syntax is identical to getting a variable, but the result can be called as a function
"""

# ╔═╡ Cell order:
# ╟─f91fe30b-41f7-41e7-ad0e-1b66b121f3af
# ╟─71facfd1-9b26-40c0-9b85-7549776d7e2e
# ╟─ba042091-5391-4cc9-8548-9fc4d40ce957
# ╠═73ac88be-557d-4f3f-bfb8-cddb20731eaa
# ╠═a9bfbbb7-eccf-4f73-b937-80ad87bec399
# ╟─b06ba2bb-14e0-42fa-9f4c-4cd0f3de5645
# ╟─4f760505-f9ae-4e88-ac95-f2cf3ab4a2f1
# ╟─b7e4b203-740c-4651-b829-95efe0da9dcd
# ╟─3b055f61-cea3-493f-bd26-6e3115cd4d4a
# ╟─9dfff6ad-65b3-49d3-9449-c7591489de70
# ╟─551f7f2e-3dc9-420c-a8d2-8ba8b367cc50
# ╟─748c733d-7ccb-41e5-bdec-977460662035
# ╟─d2eaba4e-e595-498f-9133-a392328a1b40
# ╟─9c41d187-d937-4bb4-b19b-cfe493147f1f
# ╠═705411f1-45c1-41af-b7da-3765a63e4c6b
# ╟─b263577b-5194-45d4-951a-ba428e692d41
# ╠═51bfdefe-5a67-4083-bf1d-eca10767a684
# ╟─cfb85a78-90bc-4e84-964d-21e82dec5363
# ╟─77f122b5-08de-4ff7-b3fd-1d14c031c9c9
# ╟─198c3384-6ac4-4fa0-8bef-50ff73abf530
# ╟─92a036c1-d51c-4400-b5d3-a11c3b5ba300
