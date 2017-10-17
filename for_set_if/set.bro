const scan_ports: set[port] = {
{% for p in range(number) -%}
	{{ p }}/tcp,
{% endfor %}
};

local x = 0;
while ( x < {{ N }} ) {
    for(p in scan_ports) {
    }
    ++x;
}
