const things: table[count] of count = {
{% for p in range(number) -%}
	[{{ p }}] = {{ p }},
{% endfor %}
};

local x = 0;
local i = 0;
while ( x < {{ N }} ) {
    for(p in things) {
        i += p;
    }
    ++x;
}
