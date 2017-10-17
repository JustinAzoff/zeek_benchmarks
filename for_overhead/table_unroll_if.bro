const things: table[count] of count = {
{% for p in range(number) -%}
	[{{ p }}] = {{ p }},
{% endfor %}
};

local x = 0;
local i = 0;
while ( x < {{ N }} ) {
    if(|things| == 0) {
    } elif(|things| == 1) {
        i += things[0];
    } else {
    {% for p in range(number) %}
        i += things[{{p}}];
    {% endfor %}
        ++x;
    }
}
