local x = 0;
local y = 0;
local ptest = {{number//2}}/tcp;
local p3389 = 3389/tcp;
while ( x < {{ N }} ) {
    if (
        ptest == 0/tcp
    {% for p in range(1,number) %}
        || ptest == {{ p }}/tcp
    {% endfor %}
    )
        ++y;

    ++x;
}
