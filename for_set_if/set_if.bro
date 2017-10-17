const scan_ports: set[port] = {
{% for p in range(number) -%}
	{{ p }}/tcp,
{% endfor %}
};

local x = 0;
while ( x < {{ N }} ) {
    if(|scan_ports|!=0) {
        for(p in scan_ports) {
        }
    }
    ++x;
}
