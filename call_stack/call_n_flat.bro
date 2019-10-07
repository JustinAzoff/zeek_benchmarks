function func_2(x: count): bool
{
    return T;
}
function func(x: count): bool
{
{% for p in range(number-1) %}
    func_2(x);
{% endfor %}
    return func_2(x);
}

local x = 0;
while ( x < {{N}} ) {
    if(func(x))
        ++x;
}
