const scan_ports: set[port] = {
{% for p in range(number) %}
	{{ p }}/tcp,
{% endfor %}
};

local x = 0;
local y = 0;
local ptest = {{number // 2}}/tcp;
while ( x < {{ N }} ) {
    if (ptest in scan_ports)
        ++y;
    ++x;
}
