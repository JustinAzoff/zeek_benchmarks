function func_{{number}}(x: count): bool
{
    return T;
}
{% for p in range(number-1, 0, -1) %}
function func_{{p}}(x: count): bool
{
    return func_{{p+1}}(x);
}
{% endfor %}

local x = 0;
while ( x < {{N}} ) {
    if(func_1(x))
        ++x;
}
