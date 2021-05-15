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

# ╔═╡ 60f3d07d-7ab9-4f09-9de0-5552ed962283
using HypertextLiteral

# ╔═╡ 6912d069-04d8-4d77-9491-99ea7e05223d
random_string(n; alphabet="abcdefghijklmnopqrstuvwxyz0123456789") = join([alphabet[rand(1:length(alphabet))] for i in 1:n])

# ╔═╡ d20b29e3-2cc5-4eeb-8514-020329243dea
function MouseMoveInput(width=300, height=300)
	id = random_string(16)
	@htl("""
	<div id=$(id) style="width: $(width)px; height: $(height)px; border: 1px solid black">
		<script>
			const mouseInput = document.getElementById("$(id)");
	
			mouseInput.value = [0, 0];
			
			mouseInput.addEventListener('mousemove', function(e) {
				const rect = mouseInput.getBoundingClientRect();
				mouseInput.value = [Math.floor(e.x-rect.left+1), Math.floor(e.y-rect.top+1)];
				mouseInput.dispatchEvent(new Event('input'));
			});
		</script>
	</div>
	""")
end

# ╔═╡ 928805f0-a147-11eb-01cb-754dbb0ecb4c
@bind custom_input MouseMoveInput(100, 100)

# ╔═╡ 635e2f85-3999-4f77-99b4-983459ca1c37
custom_input

# ╔═╡ 6f6b7e09-62f7-47c2-9518-09d39cf9ab90
@bind custom_input2 MouseMoveInput()

# ╔═╡ 18055c01-5071-4e82-a95e-6d1d28c21368
custom_input, custom_input2

# ╔═╡ 688d9748-8969-42e7-b16b-af18349f01f4
@bind my_custom_input MouseMoveInput(100, 100)

# ╔═╡ 998bafb0-7316-4828-bb58-465e9c2950cc
my_custom_input

# ╔═╡ Cell order:
# ╠═60f3d07d-7ab9-4f09-9de0-5552ed962283
# ╠═6912d069-04d8-4d77-9491-99ea7e05223d
# ╠═d20b29e3-2cc5-4eeb-8514-020329243dea
# ╠═928805f0-a147-11eb-01cb-754dbb0ecb4c
# ╟─635e2f85-3999-4f77-99b4-983459ca1c37
# ╠═6f6b7e09-62f7-47c2-9518-09d39cf9ab90
# ╠═18055c01-5071-4e82-a95e-6d1d28c21368
# ╠═688d9748-8969-42e7-b16b-af18349f01f4
# ╠═998bafb0-7316-4828-bb58-465e9c2950cc
